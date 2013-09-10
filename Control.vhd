library ieee;
use ieee.std_logic_1164.all;

entity Control is
    port (clk:    	in std_logic;
          areset: 	in std_logic;
			 startstop:	in std_logic;
          mins:      in std_logic;
			 secs:		in std_logic;
			 timezero:	in std_logic;
          ready:		out std_logic;
			 mins_up:	out std_logic;
			 secs_up:	out std_logic;
			 countdown:	out std_logic;
			 clear:     out std_logic
         );
end Control;

architecture fsm_2proc of Control is
type state_type is (clears, rest, waitc, sec, min, counts, count, peep);
signal current_state, next_state : state_type;
begin
    comb: process (current_state, startstop, mins, secs, timezero) is
    begin
        case current_state is
            when rest =>
								ready <= '0';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '0';
								clear <= '0';
								if secs = '1' then
									next_state <= sec;
								elsif mins = '1' then
									next_state <= min;
								elsif startstop = '1' and timezero = '0' then
									next_state <= counts;
								else
									next_state <= rest;
								end if;
            when waitc =>
								ready <= '0';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '0';
								clear <= '0';
								if startstop = '0' then
									next_state <= rest;
								else
									next_state <= waitc;
								end if;
            when sec =>
								ready <= '0';
								mins_up <= '0';
								countdown <= '0';
								clear <= '0';
								if secs = '0' then
									next_state <= rest;
									secs_up <= '1';
								elsif secs = '1' and mins = '0' then
									next_state <= sec;
									secs_up <= '0';
								else
									next_state <= clears;
									secs_up <= '0';
								end if;
            when min =>
								ready <= '0';
								secs_up <= '0';
								countdown <= '0';
								clear <= '0';
								if mins = '0' then
									next_state <= rest;
									mins_up <= '1';
								elsif secs = '0' and mins = '1' then
									next_state <= min;
									mins_up <= '0';
								else
									next_state <= clears;
									mins_up <= '0';
								end if;
            when clears =>
								ready <= '0';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '0';
								clear <= '1';
								if secs = '0' and mins = '0' then
									next_state <= rest;
								else
									next_state <= clears;
								end if;
            when counts =>
								ready <= '0';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '1';
								clear <= '0';
								if timezero = '1' then
									next_state <= peep;
								elsif startstop = '0' then
									next_state <= count;
								else
									next_state <= counts;
								end if;
            when count =>
								ready <= '0';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '1';
								clear <= '0';
								if timezero = '1' then
									next_state <= peep;
								elsif startstop = '1' then
									next_state <= waitc;
								else
									next_state <= count;
								end if;
            when peep =>
								ready <= '1';
								mins_up <= '0';
								secs_up <= '0';
								countdown <= '0';
								clear <= '0';
								if mins = '1' or secs = '1' or startstop = '1' then
									next_state <= rest;
								else
									next_state <= peep;
								end if;
            when others => next_state <= rest;
                           ready <= 'X';
									mins_up <= 'X';
									secs_up <= 'X';
									countdown <= 'X';
									clear <= 'X';
									report "Reached nonexistent state";
        end case;
    end process;

    reg: process (clk, areset) is
    begin
        if areset = '1' then
            current_state <= clears;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

end architecture;
