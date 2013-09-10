library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Timer is
	port (clk:			in std_logic;
			enable:		in std_logic;
			reset:		in std_logic;
			refresh:		out std_logic;
			data:			out unsigned(15 downto 0)
			);
end entity Timer;

architecture structural of Timer is
signal TotalCount : unsigned(15 downto 0);
signal TempCount : unsigned(15 downto 0);
signal dataout : unsigned(15 downto 0);
begin
	
	process (clk, reset) is
	begin
		if rising_edge(clk) then
			refresh <= '0';
			if reset = '1' then
				TotalCount <= "0000000000000000";
				TempCount <= "0000000000000000";
			elsif enable = '1' then
				TotalCount <= TotalCount + 1;
				if TempCount < 9375 then
					TempCount <= TempCount + 1;
				else
					TempCount <= "0000000000000000";
					refresh <= '1';
				end if;
			end if;
		end if;
	end process;
	
	data <= TotalCount;
	
end structural;
