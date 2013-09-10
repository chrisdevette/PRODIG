-- Filename:     
-- Filetype:     
-- Date:         
-- Update:       
-- Description:  
-- Author:       
-- State:        
-- Error:        
-- Version:      1.0
-- Copyright:    (c)2012, De Haagse Hogeschool

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teller is
	port (clk      : in std_logic;
			clear   : in std_logic;
			enable   : in std_logic;
			increment: in std_logic;
			height   : in std_logic;
			count    : out unsigned(3 downto 0);
			cout     : out std_logic;
			zeroflag : out std_logic
			);
end entity teller;

architecture rtl of teller is
signal q : unsigned(3 downto 0);
signal checkseconds : integer range 0 to 99;
signal c5temp, c9temp, carryflag : std_logic;
begin

	process (clk) is
	begin
		if rising_edge(clk) then
			if clear = '1' then
				q <= "0000";
				checkseconds <= 0;
			else
				if increment = '1' then
					if height = '0' then
						if q < "0101" then
							q <= q + 1;
						else
							q <= "0000";
						end if;
					else
						if q < "1001" then
							q <= q + 1;
						else
							q <= "0000";
						end if;
					end if;
				end if;
				if enable = '1' then
					if checkseconds = 99 then
						checkseconds <= 0;
						if q > "0000" then
							q <= q - 1;
						else
							if height = '0' then
								q <= "0101";
							else
								q <= "1001";
							end if;
						end if;
					else
						checkseconds <= checkseconds + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	count <= q;
	
	
	zeroflag <= '1' when q = "0000" else '0';
	c5temp <= '1' when q > "0100" and increment = '1' else '0';
	c9temp <= '1' when q > "1000" and increment = '1' else '0';
	
	with height select
		cout <=	c5temp when '0',
					c9temp when '1',
					'X' when others;
	

end rtl;