-- Filename:     prescaler.vhd
-- Filetype:     VHDL code of a prescaler(behavioral)
-- Date:         3 march 2012
-- Update:       -
-- Description:  A behavioral description of configurable prescaler
-- Author:       J. op den Brouw
-- State:        demo
-- Error:        -
-- Version:      1.0
-- Copyright:    (c)2012, De Haagse Hogeschool
--
-- This is a behavioral description of 1000 Hz prescaler.
-- The input clock frequency is assumed to be 50 MHz as is on the DE0 and
-- DE2-70 boards. The prescaler creates a 50% Duty Cycle output clock.
--
-- The port signals of the prescaler:
--
--    clkin    - the input clock
--    areset   - asynchronous reset
--    clkout   - the output clock

library ieee;
use ieee.std_logic_1164.all;

entity prescaler is
	generic (freqin : positive := 50000000;
				freqout : positive := 10000
				);
	port (clkin  : in std_logic;
			reset : in std_logic;
			clkout : out std_logic
			);
end entity prescaler;

-- Behavioral description of the prescaler
architecture behav of prescaler is
-- Calculate the maximum value we have to count to.
-- The divide by 2 is needed because we toggle the
-- the output clock signal. The off by one is needed
-- because we start counting from 0...
constant countmax : positive := ((freqin/2)/freqout)-1;
-- We need to count up to some maximum...
signal count : integer range 0 to countmax;
begin
	process (clkin) is
	-- Clkint is the internal clock (output), but as you know,
	-- you cannot read an output signal...
	variable clkint : std_logic;
	begin
		-- The global reset signal. Reset the lot.
		if rising_edge(clkin) then
			if reset = '1' then
				count <= 0;
				clkint := '0';
			-- If we're at the top...
			elsif count = countmax then
				-- Toggle the output clock and restart counting...
				clkint := not clkint;
				count <= 0;
			else
				-- We are not at the top so increment the counter
				count <= count + 1;
			end if;
		end if;
		-- Output the clock...
		clkout <= clkint;
	end process;

end behav;