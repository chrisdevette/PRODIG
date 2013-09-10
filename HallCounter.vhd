-- Libraries et al.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HallCounter is
	port(	Clk_10k 	 	: in std_logic;
			reset			: in std_logic;
			Hallsensor  : in std_logic;
			refresh 		: in std_logic; -- Signals to refresh output to new value
			enable 		: in std_logic;
			data 			: out unsigned(15 downto 0)
			);
end entity HallCounter;

architecture hardware of HallCounter is
signal TotalCount : unsigned(15 downto 0);
signal TempCount : unsigned(15 downto 0);
signal dataout : unsigned(15 downto 0);
signal DelayCount : integer range 0 to 3;
signal UseTemp : std_logic;


type type_state is (Rest, WaitLow, DelayIn, Measure, WaitHigh, DelayOut);
signal state : type_state;

begin
	process(clk_10k, reset)
	begin

		if reset = '1' then
			state <= Rest;
			TotalCount <= "0000000000000000";
			TempCount <= "0000000000000000";
			dataout <= "0000000000000000";
			DelayCount <= 0;
			UseTemp <= '0';
		elsif rising_edge(Clk_10k) then
			
			if enable = '0' then
				state <= Rest;
			end if;

			if Usetemp = '0' then
				dataout <= TotalCount;
			elsif refresh = '1' and UseTemp = '1' then
				dataout <= TempCount;
				TempCount <= "0000000000000000";
			end if;
			
			case state is
				when Rest =>
								DelayCount <= 0;
								UseTemp <= '0';
								if enable = '1' then
									state <= WaitLow;
								end if;
				when WaitLow =>
								DelayCount <= 0;
								UseTemp <= '1';
								if Hallsensor = '0' then
									state <= DelayIn;
								end if;
				when DelayIn =>
								DelayCount <= DelayCount + 1;
								UseTemp <= '1';
								if DelayCount > 2 then
									state <= Measure;
								end if;
				when Measure =>
								DelayCount <= 0;
								UseTemp <= '1';
								TotalCount <= TotalCount + 1;
								TempCount <= TempCount + 1;
								if Hallsensor = '1' then
									state <= WaitLow;
									
									state <= WaitHigh;
								end if;
				when WaitHigh =>
								DelayCount <= 0;
								UseTemp <= '1';
								if Hallsensor = '1' then
									state <= DelayOut;
								end if;
				when DelayOut =>
								DelayCount <= DelayCount + 1;
								UseTemp <= '1';
								if DelayCount > 1 then
									if Hallsensor = '1' then
										state <= WaitLow;
										
										state <= WaitHigh;
									end if;
								end if;
            when others => state <= Rest;
									report "Reached nonexistent state";
				
			end case;
		end if;
	end process;
	
	data <=	dataout;
	
end architecture;