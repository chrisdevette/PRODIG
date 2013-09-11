library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- clock_50  - input clock (50 MHz)
-- sw(0)     - asynchronous reset
-- sw(1)     - select 1 Hz/10 Hz clock
-- sw(2)     - enable counting
-- sw(3)     - select BCD or HEX counting
-- hex3_d    - 7 seg display fourth digit counting value
-- hex2_d    - 7 seg display third digit counting value
-- hex1_d    - 7 seg display second counting value
-- hex0_d    - 7 seg display first digit counting value

-- The other port signals are not used but here for
-- completeness.

entity HomeTrainer is
	-- Please leave the port names upper case here!
	-- VHDL is case insensitive for port names, but the
	-- Quartus pin planner is!
	port (CLOCK_50 : in std_logic;
			BUTTON   : in std_logic_vector(3 downto 0);
			SW       : in std_logic_vector(17 downto 0);
			LEDG     : out std_logic_vector(8 downto 0);
			LEDR     : out std_logic_vector(17 downto 0);
			IO_A		: inout std_logic_vector(31 downto 0);
			HEX7_D   : out std_logic_vector(6 downto 0);
			HEX6_D   : out std_logic_vector(6 downto 0);
			HEX5_D   : out std_logic_vector(6 downto 0);
			HEX4_D   : out std_logic_vector(6 downto 0);
			HEX3_D   : out std_logic_vector(6 downto 0);
			HEX2_D   : out std_logic_vector(6 downto 0);
			HEX1_D   : out std_logic_vector(6 downto 0);
			HEX0_D   : out std_logic_vector(6 downto 0);
			HEX0_DP  : out std_logic;
			HEX1_DP  : out std_logic;
			HEX2_DP  : out std_logic;
			HEX3_DP  : out std_logic;
			HEX4_DP  : out std_logic;
			HEX5_DP  : out std_logic;
			HEX6_DP  : out std_logic;
			HEX7_DP  : out std_logic
	);
end entity HomeTrainer;

architecture structural of HomeTrainer is
	component prescaler is
		port (clkin  : in std_logic;
				reset : in std_logic;
				clkout : out std_logic
				);
	end component prescaler;
	component Timer is
		port (clk:			in std_logic;
				enable:		in std_logic;
				reset:		in std_logic;
				refresh:		in std_logic;
				tempcount:	out unsigned(5 downto 0); -- Seconden met één cijfer achter de komma voor berekening huidige RPM
				sec:			out unsigned(5 downto 0);
				min:			out unsigned(5 downto 0);
				hr:			out unsigned(6 downto 0)
				);
	end component Timer;
	component HallCounter is
		port(	Clk_10k 	 	: in std_logic;
				reset			: in std_logic;
				Hallsensor  : in std_logic;
				refresh 		: out std_logic; -- Signals sequential devider to refresh output to new value
				data 			: out unsigned(31 downto 0)
				);
	end component HallCounter;

--	component Control is
--		 port (clk:    	in std_logic;
--				 areset: 	in std_logic;
--				 startstop:	in std_logic;
--				 mins:      in std_logic;
--				 secs:		in std_logic;
--				 timezero:	in std_logic;
--				 ready:		out std_logic;
--				 mins_up:	out std_logic;
--				 secs_up:	out std_logic;
--				 countdown:	out std_logic;
--				 clear:     out std_logic
--				);
--	end component Control;
--	component Counter is
--		port (clk       : in std_logic;
--				clear     : in std_logic;
--				countdown : in std_logic;
--				mins_up	 : in std_logic;
--				secs_up	 : in std_logic;
--				timezero	 : out std_logic;
--				digit0    : out unsigned(3 downto 0);
--				digit1    : out unsigned(3 downto 0);
--				digit2    : out unsigned(3 downto 0);
--				digit3    : out unsigned(3 downto 0)
--				);
--	end component Counter;
--	component vier7segmentdecoder is
--		 port (data0   : in unsigned(3 downto 0);
--				 data1   : in unsigned(3 downto 0);
--				 data2   : in unsigned(3 downto 0);
--				 data3   : in unsigned(3 downto 0);
--				 leds0   : out std_logic_vector(6 downto 0);
--				 leds1   : out std_logic_vector(6 downto 0);
--				 leds2   : out std_logic_vector(6 downto 0);
--				 leds3   : out std_logic_vector(6 downto 0)
--				);
--	end component vier7segmentdecoder;

signal reset, CLOCK_10, refresh, enable: std_logic;
signal countdata: unsigned(31 downto 0);
signal tempcount, sec, min: unsigned(5 downto 0);
signal hr: unsigned(6 downto 0);

signal LCD_Data, ADC_Data: std_logic_vector(7 downto 0);
signal LCD_RS, LCD_RW, LCD_E, Servo_Positive, Servo_Negative, ADC_ConvStart, ADC_RD, ADC_Busy, Hallsensor: std_logic;
signal BikeButtons: std_logic_vector(6 downto 1);

-- Glue counting values with seven segment decoders
signal digit0_2_data0 : unsigned(3 downto 0);
signal digit1_2_data1 : unsigned(3 downto 0);
signal digit2_2_data2 : unsigned(3 downto 0);
signal digit3_2_data3 : unsigned(3 downto 0);

begin
	
	IO_A(0) <= LCD_RS;
	IO_A(1) <= LCD_RW;
	IO_A(2) <= LCD_E;
	IO_A(10 downto 3) <= LCD_Data;
	IO_A(11) <= Servo_Positive;
	IO_A(12) <= Servo_Negative;
	Hallsensor <= IO_A(13);
	IO_A(14) <= ADC_ConvStart;
	IO_A(15) <= ADC_RD;
	ADC_Busy <= IO_A(16);
	ADC_Data(7 downto 0) <= IO_A(24 downto 17);
	BikeButtons(6 downto 1) <= IO_A(31 downto 26);
	
--	FSMControl: Control
--		port map (clk => CLOCK_10, areset => areset, startstop => startstop, mins => mins, secs => secs, timezero => timezero, ready => LEDG(0), mins_up => mins_up, secs_up => secs_up, countdown => countdown, clear => clear);

	ClockScaler: prescaler
		port map (clkin => CLOCK_50, reset => reset, clkout => CLOCK_10);

	TotalTimer: Timer
		port map (clk => CLOCK_10, enable => enable, reset => reset, refresh => refresh, tempcount => tempcount, sec => sec, min => min, hr => hr);

	HallSensCount: HallCounter
		port map (Clk_10k => CLOCK_10, reset => reset, Hallsensor => Hallsensor, refresh => refresh, data => countdata);
	
--	CounterTop: Counter
--		port map (clk => CLOCK_10, clear => clear, countdown => countdown, mins_up => mins_up, secs_up => secs_up, timezero => timezero, digit0 => digit0_2_data0, digit1 => digit1_2_data1, digit2 => digit2_2_data2, digit3 => digit3_2_data3);
		
--	FullVisual: vier7segmentdecoder
--		port map (data0 => digit0_2_data0, data1 => digit1_2_data1, data2 => digit2_2_data2, data3 => digit3_2_data3, leds0 => HEX0_D, leds1 => HEX1_D, leds2 => HEX2_D, leds3 => HEX3_D);
	
	reset <= SW(0);
		
	HEX0_DP <= '1';
	HEX1_DP <= '1';
	HEX2_DP <= '1';
	HEX3_DP <= '1';
	HEX4_DP <= '1';
	HEX5_DP <= '1';
	HEX6_DP <= '1';
	HEX7_DP <= '1';
	
--	inputsync: process (CLOCK_10) is
--	begin
--		startstop <= (NOT BUTTON(0));
--		mins <= (NOT BUTTON(1));
--		secs <= (NOT BUTTON(2));
--	end process;
		
end architecture structural;
