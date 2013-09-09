library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
-- Empty entity 
entity Sim is 
end Sim; 
architecture behav of Sim is 
-- Top level signals  
signal Clk_10k : std_logic;
signal reset : std_logic;
signal DB : std_logic_vector(7 downto 0);
signal Busy : std_logic;
signal conv : std_logic;
signal rd : std_logic;
signal data : std_logic_vector(7 downto 0);

-- Component declaration 
component ADC is
port(
	Clk_10k : in std_logic;
	reset		: in std_logic;
	DB  		: in std_logic_vector(7 downto 0);
	Busy 		: in std_logic;
	conv 		: out std_logic;
	rd   		: out std_logic:='1';
	data 		: out std_logic_vector(7 downto 0)
	);
end component ADC;

begin 
 -- Component instantiation 
 dut : ADC
 port map (Clk_10k => Clk_10k, reset => reset, DB => DB, Busy => Busy, conv => conv, rd => rd, data => data);
 -- Process that asserts the stimuli 
 
 Clk_10kgen: process is
 begin
	Clk_10k <= '0';
	wait for 50 us;
	Clk_10k <= '1';
	wait for 50 us;
 end process;
  
 stim: process is 
 begin 

 wait until Clk_10k = '1';
 wait for 10 us;
 reset <= '1';
 Busy <= '1';
 conv <= '0';
 DB <= "10101010";
 wait until Clk_10k = '1';
 wait for 10 us;
 reset <= '0';
 wait until Clk_10k = '1';
 wait for 10 us;
 busy <= '0';
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 busy <= '0';
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 busy <= '1';
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 busy <= '0';
 wait until Clk_10k = '1';
 wait for 10 us;

 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;

 wait until Clk_10k = '1';
 wait for 10 us;
 
 wait until Clk_10k = '1';
 wait for 10 us;
 wait; -- wait forever 
 end process; 
end behav;