library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Timer is
	port (clk:			in std_logic;
			enable:		in std_logic;
			reset:		in std_logic;
			refresh:		in std_logic;
			tempcount:	out unsigned(5 downto 0); -- Seconden met één cijfer achter de komma voor berekening huidige RPM
			sec:			out unsigned(5 downto 0);
			min:			out unsigned(5 downto 0);
			hr:			out unsigned(6 downto 0)
			);
end entity Timer;

architecture structural of Timer is
signal TotalDelay : integer range 0 to 10000; -- Teldelay voor de totale tijd
signal TotalSec : unsigned(5 downto 0);
signal TotalMin : unsigned(5 downto 0);
signal TotalHr : unsigned(6 downto 0);
signal TempCount : unsigned(5 downto 0); -- Seconden met één cijfer achter de komma, als heel getal weergegeven (3.2 seconden -> 32), hoogste bit om aan te geven dat RPM < 20, en dus 0
begin
	
	process (clk, reset) is
	begin
		if rising_edge(clk) then
			if reset = '1' then
				TotalDelay <= 0;
				TotalSec <= "000000";
				TotalMin <= "000000";
				TotalHr <= "0000000";
				TempCount <= "00000";
			elsif enable = '1' then
				if refresh = '1' then
					TempCount <= "000000";
				else
					if TempCount < 63 then
						TempCount <= TempCount + 1;
					end if;
				end if;
				
				if TotalDelay < 10000 then
					TotalDelay <= TotalDelay + 1;
				else
					if TotalSec > 58 then
						if TotalMin > 58 then
							if TotalHr < 99 then
								TotalHr <= TotalHr + 1;
							end if;
						else
							TotalMin <= TotalMin + 1;
						end if;
					else
						TotalSec <= TotalSec + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	sec <= TotalSec;
	min <= TotalMin;
	hr <= TotalHr;
	tempcount <= TempCount;
	
end structural;
