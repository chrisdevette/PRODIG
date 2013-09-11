-- Libraries et al.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SequentialDevider is
	port(	clk 	 		: in std_logic;
			reset			: in std_logic;
			refresh 		: in std_logic;
			outputtotal	: in std_logic;
			tempcount	: in unsigned(5 downto 0);
			sec			: in unsigned(5 downto 0);
			min			: in unsigned(5 downto 0);
			hr				: in unsigned(6 downto 0);
			Halldata 	: in unsigned(31 downto 0);
			CurrentRPM	: out unsigned(7 downto 0);
			TotAvgRPM	: out unsigned(7 downto 0)
			);
end entity SequentialDevider;

architecture hardware of SequentialDevider is
signal TempBottom, TempTop : unsigned(9 downto 0);
signal TotBottom, TotTop, TotSecs : unsigned(31 downto 0);
signal TempRPM_Calc, TempRPM_Final, TotRPS_Calc, TotRPM_Final: unsigned(7 downto 0);
signal TempRunning, TotRunning : std_logic;
constant RPM_Constant: unsigned := "1001011000";

begin

	process (clk) is
	begin
		if rising_edge(clk) then
			
			if TempRunning = '0' and refresh = '1' then
				TempBottom <= "0000" & tempcount;
				TempTop <= RPM_Constant;
				TempRPM_Calc <= "00000000";
				TempRunning <= '1';
			else
				if TempTop > TempBottom then
					TempTop <= TempTop - TempBottom;
					TempRPM_Calc <= TempRPM_Calc + 1;
				elsif ('0' & TempTop(9 downto 1)) > TempBottom(9 downto 0) then
					TempRunning <= '0';
					TempRPM_Calc <= TempRPM_Calc + 1;
					TempRPM_Final <= TempRPM_Calc;
				else
					TempRunning <= '0';
					TempRPM_Final <= TempRPM_Calc;
				end if;
			end if;

			if TotRunning = '0' and outputtotal = '1' then
				TotSecs <= sec + ((min + (hr * 60)) * 60);
				TotBottom <= Totsecs;
				TotTop <= Halldata;
				TotRPS_Calc <= "00000000";
				TotRunning <= '1';
			else
				if TotTop > TotBottom then
					TotTop <= TotTop - TotBottom;
					TotRPS_Calc <= TotRPS_Calc + 1;
				elsif ('0' & TotTop(31 downto 1)) > TotBottom(31 downto 0) then
					TotRunning <= '0';
					TotRPS_Calc <= TotRPS_Calc + 1;
					TotRPM_Final <= TotRPS_Calc * 60;
				else
					TotRunning <= '0';
					TotRPM_Final <= TotRPS_Calc * 60;
				end if;
			end if;

		end if;
	end process;
	
	CurrentRPM <= TempRPM_Final;
	TotAvgRPM <= TotRPM_Final;
	
end architecture;