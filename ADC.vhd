-- Libraries et al.
library ieee;
use ieee.std_logic_1164.all;

entity ADC is
port(
	Clk_10k  : in std_logic;
	reset		: in std_logic;
	DB  		: in std_logic_vector(7 downto 0);
	Busy 		: in std_logic;
	conv 		: out std_logic;
	rd   		: out std_logic:='1'; -- Read
	data 		: out std_logic_vector(7 downto 0)
	);
end entity ADC;

architecture hardware of ADC is
signal Buf : std_logic_vector(7 downto 0);
signal convint : std_logic;
signal rdint : std_logic;
type type_state is (s0, s1, s2, s3, s4, s5);
signal state : type_state;

begin
process(clk_10k, busy, reset, DB)
begin

if reset = '1' then
		state <= s0;
		convint <= '0';
		rdint <= '1';
		Buf <= "00000000";
	elsif rising_edge(Clk_10k) then
	
		case state is
			when s0 =>
				if busy = '0' then
					state <= s1;
				else
					state <= s0;
				end if;
				rdint <= '1';
			when s1 =>
				convint <= '1';
				state <= s2;
			when s2 =>
				if busy = '1' then
					state <= s3;
				elsif busy = '0' then
					state <= s1;
				end if;
				convint <= '0';
			when s3 =>
				if busy = '0' then
					state <= s4;
				end if;
			when s4 =>
				rdint <= '0';
				state <= s5;
			when s5 =>
				buf(7 downto 0) <= DB(7 downto 0);
				state <= s0;
			
		end case;
	end if;
end process;
	data(7 downto 0) <= buf(7 downto 0);
	conv <= convint;
	rd <= rdint;
end architecture;