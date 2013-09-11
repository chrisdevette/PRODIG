-- Libraries et al.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HallCounter is
	port(	Clk_10k 	 	: in std_logic;
			reset			: in std_logic;
			Hallsensor  : in std_logic;
			refresh 		: out std_logic; -- Signals sequential devider to refresh output to new value
			data 			: out unsigned(31 downto 0)
			);
end entity HallCounter;

architecture hardware of HallCounter is
signal TotalCount : unsigned(31 downto 0);
signal DelayCount : integer range 0 to 3;
signal CalcTick : std_logic;


type type_state is (Rest, WaitLow, DelayIn, Measure, WaitHigh, DelayOut);
signal state : type_state;

begin
	process(clk_10k, reset)
	begin

		if reset = '1' then
			state <= Rest;
			TotalCount <= "00000000000000000000000000000000";
			DelayCount <= 0;
			CalcTick <= '0';
		elsif rising_edge(Clk_10k) then

			case state is
				when Rest =>
								DelayCount <= 0;
								CalcTick <= '0';
								state <= WaitLow;
				when WaitLow =>
								DelayCount <= 0;
								CalcTick <= '0';
								if Hallsensor = '0' then
									state <= DelayIn;
								end if;
				when DelayIn =>
								DelayCount <= DelayCount + 1;
								CalcTick <= '0';
								if DelayCount > 2 then
									state <= Measure;
								end if;
				when Measure =>
								DelayCount <= 0;
								TotalCount <= TotalCount + 1;
								CalcTick <= '1';
								if Hallsensor = '1' then
									state <= WaitLow;
								else
									state <= WaitHigh;
								end if;
				when WaitHigh =>
								DelayCount <= 0;
								CalcTick <= '0';
								if Hallsensor = '1' then
									state <= DelayOut;
								end if;
				when DelayOut =>
								DelayCount <= DelayCount + 1;
								CalcTick <= '0';
								if DelayCount > 1 then
									if Hallsensor = '1' then
										state <= WaitLow;
									else
										state <= WaitHigh;
									end if;
								end if;
            when others => state <= Rest;
									report "Reached nonexistent state";
				
			end case;
		end if;
	end process;
	
	data <=	TotalCount;
	refresh <= CalcTick;
	
end architecture;