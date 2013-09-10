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

entity Counter is
	port (clk       : in std_logic;
			clear    : in std_logic;
			countdown : in std_logic;
			mins_up	 : in std_logic;
			secs_up	 : in std_logic;
			timezero	 : out std_logic;
			digit0    : out unsigned(3 downto 0);
			digit1    : out unsigned(3 downto 0);
			digit2    : out unsigned(3 downto 0);
			digit3    : out unsigned(3 downto 0)
			);
end entity Counter;

architecture structural of Counter is
	component teller is
		port (clk      : in std_logic;
				clear   : in std_logic;
				enable   : in std_logic;
				increment: in std_logic;
				height   : in std_logic;
				count    : out unsigned(3 downto 0);
				cout     : out std_logic;
				zeroflag : out std_logic
				);
	end component teller;
signal carry0, carry1, carry2, minuteinc, zero0, zero1, zero2, zero3, enablecheck1, enablecheck2, enablecheck3, zerocheckall, max9, max5 : std_logic;
begin

	Secs : teller
		port map(clk => clk, clear => clear, enable => countdown, increment => secs_up, height => max9, count => digit0, cout => carry0, zeroflag => zero0);
	Tens_Secs : teller
		port map(clk => clk, clear => clear, enable => enablecheck1, increment => carry0, height => max5, count => digit1, cout => carry1, zeroflag => zero1);
	Mins : teller
		port map(clk => clk, clear => clear, enable => enablecheck2, increment => minuteinc, height => max9, count => digit2, cout => carry2, zeroflag => zero2);
	Tens_Mins : teller
		port map(clk => clk, clear => clear, enable => enablecheck3, increment => carry2, height => max9, count => digit3, zeroflag => zero3);
	
	max5 <= '0';
	max9 <= '1';
	
	minuteinc <= (mins_up or carry1);
	
	enablecheck1 <= (zero0 and countdown);
	enablecheck2 <= (zero0 and zero1 and countdown);
	enablecheck3 <= (zero0 and zero1 and zero2 and countdown);

	zerocheckall <= (zero0 and zero1 and zero2 and zero3);
	timezero <= zerocheckall;
	
	
end structural;
