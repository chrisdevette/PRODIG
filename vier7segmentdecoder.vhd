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

entity vier7segmentdecoder is
    port (data0   : in unsigned(3 downto 0);
          data1   : in unsigned(3 downto 0);
          data2   : in unsigned(3 downto 0);
          data3   : in unsigned(3 downto 0);
          leds0   : out std_logic_vector(6 downto 0);
          leds1   : out std_logic_vector(6 downto 0);
          leds2   : out std_logic_vector(6 downto 0);
          leds3   : out std_logic_vector(6 downto 0)
         );
end vier7segmentdecoder;

architecture structural of vier7segmentdecoder is
	component seg_decoder is
		port (
		data   : in unsigned(3 downto 0);
      leds   : out std_logic_vector(6 downto 0)
		);
	end component;
begin

	D1: seg_decoder
		port map (data => data0, leds => leds0);
	D2: seg_decoder
		port map (data => data1, leds => leds1);
	D3: seg_decoder
		port map (data => data2, leds => leds2);
	D4: seg_decoder
		port map (data => data3, leds => leds3);
		
end architecture structural;