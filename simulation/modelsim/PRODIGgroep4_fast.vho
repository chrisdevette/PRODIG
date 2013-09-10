-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 243 01/31/2013 Service Pack 1 SJ Web Edition"

-- DATE "09/10/2013 17:56:23"

-- 
-- Device: Altera EP2C15AF484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	HallCounter IS
    PORT (
	Clk_10k : IN std_logic;
	reset : IN std_logic;
	Hallsensor : IN std_logic;
	output : IN std_logic;
	enable : IN std_logic;
	data : OUT IEEE.NUMERIC_STD.unsigned(15 DOWNTO 0)
	);
END HallCounter;

-- Design Ports Information
-- data[0]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[1]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[2]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[3]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[4]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[5]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[6]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[7]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[8]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[9]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[10]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[11]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[12]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[13]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[14]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data[15]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Clk_10k	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- enable	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Hallsensor	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF HallCounter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk_10k : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Hallsensor : std_logic;
SIGNAL ww_output : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_data : std_logic_vector(15 DOWNTO 0);
SIGNAL \Clk_10k~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TempCount[5]~27_combout\ : std_logic;
SIGNAL \TempCount[6]~29_combout\ : std_logic;
SIGNAL \TempCount[8]~33_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Clk_10k~combout\ : std_logic;
SIGNAL \Clk_10k~clkctrl_outclk\ : std_logic;
SIGNAL \TotalCount[0]~15_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \output~combout\ : std_logic;
SIGNAL \enable~combout\ : std_logic;
SIGNAL \Selector3~3_combout\ : std_logic;
SIGNAL \state.WaitLow~regout\ : std_logic;
SIGNAL \Hallsensor~combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \state.Measure~0_combout\ : std_logic;
SIGNAL \state.Measure~regout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector7~2_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \state.WaitHigh~regout\ : std_logic;
SIGNAL \state.DelayOut~0_combout\ : std_logic;
SIGNAL \state.DelayOut~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Selector5~4_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \state.DelayIn~regout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state.Rest~regout\ : std_logic;
SIGNAL \UseTemp~regout\ : std_logic;
SIGNAL \dataout~0_combout\ : std_logic;
SIGNAL \dataout~1_combout\ : std_logic;
SIGNAL \TotalCount[1]~16_combout\ : std_logic;
SIGNAL \dataout~2_combout\ : std_logic;
SIGNAL \TotalCount[1]~17\ : std_logic;
SIGNAL \TotalCount[2]~18_combout\ : std_logic;
SIGNAL \dataout~3_combout\ : std_logic;
SIGNAL \TempCount[0]~16_combout\ : std_logic;
SIGNAL \TempCount[15]~18_combout\ : std_logic;
SIGNAL \TempCount[0]~17\ : std_logic;
SIGNAL \TempCount[1]~19_combout\ : std_logic;
SIGNAL \TempCount[1]~20\ : std_logic;
SIGNAL \TempCount[2]~21_combout\ : std_logic;
SIGNAL \TempCount[2]~22\ : std_logic;
SIGNAL \TempCount[3]~23_combout\ : std_logic;
SIGNAL \dataout~4_combout\ : std_logic;
SIGNAL \TempCount[3]~24\ : std_logic;
SIGNAL \TempCount[4]~25_combout\ : std_logic;
SIGNAL \dataout~5_combout\ : std_logic;
SIGNAL \TotalCount[2]~19\ : std_logic;
SIGNAL \TotalCount[3]~20_combout\ : std_logic;
SIGNAL \TotalCount[3]~21\ : std_logic;
SIGNAL \TotalCount[4]~22_combout\ : std_logic;
SIGNAL \TotalCount[4]~23\ : std_logic;
SIGNAL \TotalCount[5]~24_combout\ : std_logic;
SIGNAL \dataout~6_combout\ : std_logic;
SIGNAL \TotalCount[5]~25\ : std_logic;
SIGNAL \TotalCount[6]~26_combout\ : std_logic;
SIGNAL \dataout~7_combout\ : std_logic;
SIGNAL \TotalCount[6]~27\ : std_logic;
SIGNAL \TotalCount[7]~28_combout\ : std_logic;
SIGNAL \dataout~8_combout\ : std_logic;
SIGNAL \TotalCount[7]~29\ : std_logic;
SIGNAL \TotalCount[8]~30_combout\ : std_logic;
SIGNAL \dataout~9_combout\ : std_logic;
SIGNAL \TotalCount[8]~31\ : std_logic;
SIGNAL \TotalCount[9]~32_combout\ : std_logic;
SIGNAL \TempCount[4]~26\ : std_logic;
SIGNAL \TempCount[5]~28\ : std_logic;
SIGNAL \TempCount[6]~30\ : std_logic;
SIGNAL \TempCount[7]~31_combout\ : std_logic;
SIGNAL \TempCount[7]~32\ : std_logic;
SIGNAL \TempCount[8]~34\ : std_logic;
SIGNAL \TempCount[9]~35_combout\ : std_logic;
SIGNAL \dataout~10_combout\ : std_logic;
SIGNAL \TempCount[9]~36\ : std_logic;
SIGNAL \TempCount[10]~37_combout\ : std_logic;
SIGNAL \TotalCount[9]~33\ : std_logic;
SIGNAL \TotalCount[10]~34_combout\ : std_logic;
SIGNAL \dataout~11_combout\ : std_logic;
SIGNAL \TempCount[10]~38\ : std_logic;
SIGNAL \TempCount[11]~39_combout\ : std_logic;
SIGNAL \TotalCount[10]~35\ : std_logic;
SIGNAL \TotalCount[11]~36_combout\ : std_logic;
SIGNAL \dataout~12_combout\ : std_logic;
SIGNAL \TempCount[11]~40\ : std_logic;
SIGNAL \TempCount[12]~41_combout\ : std_logic;
SIGNAL \TotalCount[11]~37\ : std_logic;
SIGNAL \TotalCount[12]~38_combout\ : std_logic;
SIGNAL \dataout~13_combout\ : std_logic;
SIGNAL \TempCount[12]~42\ : std_logic;
SIGNAL \TempCount[13]~43_combout\ : std_logic;
SIGNAL \TotalCount[12]~39\ : std_logic;
SIGNAL \TotalCount[13]~40_combout\ : std_logic;
SIGNAL \dataout~14_combout\ : std_logic;
SIGNAL \TotalCount[13]~41\ : std_logic;
SIGNAL \TotalCount[14]~42_combout\ : std_logic;
SIGNAL \TempCount[13]~44\ : std_logic;
SIGNAL \TempCount[14]~45_combout\ : std_logic;
SIGNAL \dataout~15_combout\ : std_logic;
SIGNAL \TempCount[14]~46\ : std_logic;
SIGNAL \TempCount[15]~47_combout\ : std_logic;
SIGNAL \TotalCount[14]~43\ : std_logic;
SIGNAL \TotalCount[15]~44_combout\ : std_logic;
SIGNAL \dataout~16_combout\ : std_logic;
SIGNAL dataout : std_logic_vector(15 DOWNTO 0);
SIGNAL TotalCount : std_logic_vector(15 DOWNTO 0);
SIGNAL TempCount : std_logic_vector(15 DOWNTO 0);
SIGNAL DelayCount : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_state.Measure~regout\ : std_logic;

BEGIN

ww_Clk_10k <= Clk_10k;
ww_reset <= reset;
ww_Hallsensor <= Hallsensor;
ww_output <= output;
ww_enable <= enable;
data <= IEEE.NUMERIC_STD.UNSIGNED(ww_data);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clk_10k~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Clk_10k~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);
\ALT_INV_state.Measure~regout\ <= NOT \state.Measure~regout\;

-- Location: LCFF_X21_Y26_N11
\TempCount[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[5]~27_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(5));

-- Location: LCFF_X21_Y26_N13
\TempCount[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[6]~29_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(6));

-- Location: LCFF_X21_Y26_N17
\TempCount[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[8]~33_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(8));

-- Location: LCCOMB_X21_Y26_N10
\TempCount[5]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[5]~27_combout\ = (TempCount(5) & (!\TempCount[4]~26\)) # (!TempCount(5) & ((\TempCount[4]~26\) # (GND)))
-- \TempCount[5]~28\ = CARRY((!\TempCount[4]~26\) # (!TempCount(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(5),
	datad => VCC,
	cin => \TempCount[4]~26\,
	combout => \TempCount[5]~27_combout\,
	cout => \TempCount[5]~28\);

-- Location: LCCOMB_X21_Y26_N12
\TempCount[6]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[6]~29_combout\ = (TempCount(6) & (\TempCount[5]~28\ $ (GND))) # (!TempCount(6) & (!\TempCount[5]~28\ & VCC))
-- \TempCount[6]~30\ = CARRY((TempCount(6) & !\TempCount[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(6),
	datad => VCC,
	cin => \TempCount[5]~28\,
	combout => \TempCount[6]~29_combout\,
	cout => \TempCount[6]~30\);

-- Location: LCCOMB_X21_Y26_N16
\TempCount[8]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[8]~33_combout\ = (TempCount(8) & (\TempCount[7]~32\ $ (GND))) # (!TempCount(8) & (!\TempCount[7]~32\ & VCC))
-- \TempCount[8]~34\ = CARRY((TempCount(8) & !\TempCount[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(8),
	datad => VCC,
	cin => \TempCount[7]~32\,
	combout => \TempCount[8]~33_combout\,
	cout => \TempCount[8]~34\);

-- Location: LCCOMB_X23_Y26_N10
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (!\state.WaitLow~regout\ & (((!DelayCount(1)) # (!\state.DelayIn~regout\)) # (!DelayCount(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => DelayCount(0),
	datab => \state.DelayIn~regout\,
	datac => DelayCount(1),
	datad => \state.WaitLow~regout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X23_Y26_N6
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (!\Hallsensor~combout\ & (((!DelayCount(0)) # (!\state.DelayIn~regout\)) # (!DelayCount(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => DelayCount(1),
	datab => \state.DelayIn~regout\,
	datac => \Hallsensor~combout\,
	datad => DelayCount(0),
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X22_Y26_N10
\Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (!\Hallsensor~combout\ & ((\state.WaitHigh~regout\) # (\state.DelayOut~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Hallsensor~combout\,
	datac => \state.WaitHigh~regout\,
	datad => \state.DelayOut~regout\,
	combout => \Selector7~1_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clk_10k~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Clk_10k,
	combout => \Clk_10k~combout\);

-- Location: CLKCTRL_G3
\Clk_10k~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk_10k~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk_10k~clkctrl_outclk\);

-- Location: LCCOMB_X25_Y26_N30
\TotalCount[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[0]~15_combout\ = \state.Measure~regout\ $ (TotalCount(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.Measure~regout\,
	datac => TotalCount(0),
	combout => \TotalCount[0]~15_combout\);

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X25_Y26_N31
\TotalCount[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[0]~15_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(0));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\output~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_output,
	combout => \output~combout\);

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\enable~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_enable,
	combout => \enable~combout\);

-- Location: LCCOMB_X23_Y26_N28
\Selector3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~3_combout\ = (\enable~combout\ & (((\state.WaitLow~regout\ & \Selector3~2_combout\)) # (!\state.Rest~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.Rest~regout\,
	datab => \enable~combout\,
	datac => \state.WaitLow~regout\,
	datad => \Selector3~2_combout\,
	combout => \Selector3~3_combout\);

-- Location: LCFF_X23_Y26_N29
\state.WaitLow\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector3~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.WaitLow~regout\);

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Hallsensor~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Hallsensor,
	combout => \Hallsensor~combout\);

-- Location: LCCOMB_X23_Y26_N18
\Selector5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (\Hallsensor~combout\ & \state.WaitLow~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Hallsensor~combout\,
	datad => \state.WaitLow~regout\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X22_Y26_N16
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (DelayCount(1) & (\state.DelayIn~regout\ & DelayCount(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => DelayCount(1),
	datab => \state.DelayIn~regout\,
	datac => DelayCount(0),
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X23_Y26_N22
\state.Measure~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \state.Measure~0_combout\ = (\Selector5~4_combout\ & ((\state.Measure~regout\))) # (!\Selector5~4_combout\ & (\Selector5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector5~0_combout\,
	datac => \state.Measure~regout\,
	datad => \Selector5~4_combout\,
	combout => \state.Measure~0_combout\);

-- Location: LCFF_X23_Y26_N23
\state.Measure\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \state.Measure~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.Measure~regout\);

-- Location: LCCOMB_X22_Y26_N2
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\Hallsensor~combout\ & ((\state.Measure~regout\) # ((\state.DelayOut~regout\ & DelayCount(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.DelayOut~regout\,
	datab => \state.Measure~regout\,
	datac => DelayCount(1),
	datad => \Hallsensor~combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X23_Y26_N26
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\Hallsensor~combout\ & (\state.WaitLow~regout\ & (!\state.DelayIn~regout\))) # (!\Hallsensor~combout\ & (((\state.Measure~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Hallsensor~combout\,
	datab => \state.WaitLow~regout\,
	datac => \state.DelayIn~regout\,
	datad => \state.Measure~regout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X22_Y26_N0
\Selector7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~2_combout\ = (\enable~combout\ & ((\Selector7~1_combout\) # ((\Selector7~0_combout\) # (!\Selector5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~1_combout\,
	datab => \enable~combout\,
	datac => \Selector7~0_combout\,
	datad => \Selector5~3_combout\,
	combout => \Selector7~2_combout\);

-- Location: LCCOMB_X22_Y26_N14
\Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\Selector7~2_combout\ & (((\state.WaitHigh~regout\)))) # (!\Selector7~2_combout\ & (\Selector6~0_combout\ & ((!\state.WaitHigh~regout\) # (!\Hallsensor~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Hallsensor~combout\,
	datab => \Selector6~0_combout\,
	datac => \state.WaitHigh~regout\,
	datad => \Selector7~2_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCFF_X22_Y26_N15
\state.WaitHigh\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector6~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.WaitHigh~regout\);

-- Location: LCCOMB_X22_Y26_N12
\state.DelayOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \state.DelayOut~0_combout\ = (\Selector7~2_combout\ & (((\state.DelayOut~regout\)))) # (!\Selector7~2_combout\ & (\Hallsensor~combout\ & (\state.WaitHigh~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Hallsensor~combout\,
	datab => \state.WaitHigh~regout\,
	datac => \state.DelayOut~regout\,
	datad => \Selector7~2_combout\,
	combout => \state.DelayOut~0_combout\);

-- Location: LCFF_X22_Y26_N13
\state.DelayOut\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \state.DelayOut~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.DelayOut~regout\);

-- Location: LCCOMB_X23_Y26_N12
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!DelayCount(0) & ((\state.DelayIn~regout\) # (\state.DelayOut~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.DelayIn~regout\,
	datac => DelayCount(0),
	datad => \state.DelayOut~regout\,
	combout => \Selector1~0_combout\);

-- Location: LCFF_X23_Y26_N13
\DelayCount[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector1~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => DelayCount(0));

-- Location: LCCOMB_X23_Y26_N16
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\state.DelayOut~regout\ & ((DelayCount(1) $ (DelayCount(0))))) # (!\state.DelayOut~regout\ & (\state.DelayIn~regout\ & (DelayCount(1) $ (DelayCount(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.DelayOut~regout\,
	datab => \state.DelayIn~regout\,
	datac => DelayCount(1),
	datad => DelayCount(0),
	combout => \Selector0~0_combout\);

-- Location: LCFF_X23_Y26_N17
\DelayCount[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector0~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => DelayCount(1));

-- Location: LCCOMB_X23_Y26_N4
\Selector5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = (\state.DelayIn~regout\ & (DelayCount(0) & (DelayCount(1)))) # (!\state.DelayIn~regout\ & (((DelayCount(1)) # (!\state.DelayOut~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => DelayCount(0),
	datab => \state.DelayIn~regout\,
	datac => DelayCount(1),
	datad => \state.DelayOut~regout\,
	combout => \Selector5~3_combout\);

-- Location: LCCOMB_X23_Y26_N30
\Selector5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (!\Hallsensor~combout\ & ((\state.WaitHigh~regout\) # ((\state.Measure~regout\) # (\state.DelayOut~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WaitHigh~regout\,
	datab => \state.Measure~regout\,
	datac => \Hallsensor~combout\,
	datad => \state.DelayOut~regout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X23_Y26_N0
\Selector5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~4_combout\ = (\enable~combout\ & ((\Selector5~2_combout\) # ((\Selector5~1_combout\) # (!\Selector5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => \Selector5~2_combout\,
	datac => \Selector5~3_combout\,
	datad => \Selector5~1_combout\,
	combout => \Selector5~4_combout\);

-- Location: LCCOMB_X23_Y26_N8
\Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector5~4_combout\ & (((\state.DelayIn~regout\)))) # (!\Selector5~4_combout\ & (\Selector4~0_combout\ & (\state.WaitLow~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector4~0_combout\,
	datab => \state.WaitLow~regout\,
	datac => \state.DelayIn~regout\,
	datad => \Selector5~4_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCFF_X23_Y26_N9
\state.DelayIn\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector4~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.DelayIn~regout\);

-- Location: LCCOMB_X23_Y26_N24
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (DelayCount(1) & (\state.WaitLow~regout\ & (\Hallsensor~combout\))) # (!DelayCount(1) & ((\state.DelayOut~regout\) # ((\state.WaitLow~regout\ & \Hallsensor~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => DelayCount(1),
	datab => \state.WaitLow~regout\,
	datac => \Hallsensor~combout\,
	datad => \state.DelayOut~regout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X23_Y26_N2
\Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~0_combout\) # ((\Selector3~1_combout\ & ((\state.DelayIn~regout\) # (\Selector5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~1_combout\,
	datab => \state.DelayIn~regout\,
	datac => \Selector3~0_combout\,
	datad => \Selector5~1_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCCOMB_X23_Y26_N20
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\enable~combout\) # ((\state.Rest~regout\ & !\Selector3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datac => \state.Rest~regout\,
	datad => \Selector3~2_combout\,
	combout => \Selector2~0_combout\);

-- Location: LCFF_X23_Y26_N21
\state.Rest\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \Selector2~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.Rest~regout\);

-- Location: LCFF_X23_Y26_N19
UseTemp : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	sdata => \state.Rest~regout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UseTemp~regout\);

-- Location: LCCOMB_X24_Y26_N8
\dataout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~0_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(0))) # (!\UseTemp~regout\ & ((TotalCount(0)))))) # (!\output~combout\ & (((TotalCount(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(0),
	datab => TotalCount(0),
	datac => \output~combout\,
	datad => \UseTemp~regout\,
	combout => \dataout~0_combout\);

-- Location: LCCOMB_X24_Y26_N24
\dataout~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~1_combout\ = (\output~combout\) # (!\UseTemp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \output~combout\,
	datad => \UseTemp~regout\,
	combout => \dataout~1_combout\);

-- Location: LCFF_X24_Y26_N9
\dataout[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(0));

-- Location: LCCOMB_X25_Y26_N0
\TotalCount[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[1]~16_combout\ = (TotalCount(0) & (TotalCount(1) $ (VCC))) # (!TotalCount(0) & (TotalCount(1) & VCC))
-- \TotalCount[1]~17\ = CARRY((TotalCount(0) & TotalCount(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(0),
	datab => TotalCount(1),
	datad => VCC,
	combout => \TotalCount[1]~16_combout\,
	cout => \TotalCount[1]~17\);

-- Location: LCFF_X25_Y26_N1
\TotalCount[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[1]~16_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(1));

-- Location: LCCOMB_X22_Y26_N20
\dataout~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~2_combout\ = (\UseTemp~regout\ & ((\output~combout\ & (TempCount(1))) # (!\output~combout\ & ((TotalCount(1)))))) # (!\UseTemp~regout\ & (((TotalCount(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(1),
	datab => \UseTemp~regout\,
	datac => TotalCount(1),
	datad => \output~combout\,
	combout => \dataout~2_combout\);

-- Location: LCFF_X22_Y26_N21
\dataout[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(1));

-- Location: LCCOMB_X25_Y26_N2
\TotalCount[2]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[2]~18_combout\ = (TotalCount(2) & (!\TotalCount[1]~17\)) # (!TotalCount(2) & ((\TotalCount[1]~17\) # (GND)))
-- \TotalCount[2]~19\ = CARRY((!\TotalCount[1]~17\) # (!TotalCount(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(2),
	datad => VCC,
	cin => \TotalCount[1]~17\,
	combout => \TotalCount[2]~18_combout\,
	cout => \TotalCount[2]~19\);

-- Location: LCFF_X25_Y26_N3
\TotalCount[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[2]~18_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(2));

-- Location: LCCOMB_X22_Y26_N18
\dataout~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~3_combout\ = (\UseTemp~regout\ & ((\output~combout\ & (TempCount(2))) # (!\output~combout\ & ((TotalCount(2)))))) # (!\UseTemp~regout\ & (((TotalCount(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(2),
	datab => TotalCount(2),
	datac => \UseTemp~regout\,
	datad => \output~combout\,
	combout => \dataout~3_combout\);

-- Location: LCFF_X22_Y26_N19
\dataout[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(2));

-- Location: LCCOMB_X21_Y26_N0
\TempCount[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[0]~16_combout\ = TempCount(0) $ (VCC)
-- \TempCount[0]~17\ = CARRY(TempCount(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TempCount(0),
	datad => VCC,
	combout => \TempCount[0]~16_combout\,
	cout => \TempCount[0]~17\);

-- Location: LCCOMB_X23_Y26_N14
\TempCount[15]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[15]~18_combout\ = (\state.Measure~regout\) # ((\output~combout\ & \UseTemp~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \output~combout\,
	datac => \UseTemp~regout\,
	datad => \state.Measure~regout\,
	combout => \TempCount[15]~18_combout\);

-- Location: LCFF_X21_Y26_N1
\TempCount[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[0]~16_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(0));

-- Location: LCCOMB_X21_Y26_N2
\TempCount[1]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[1]~19_combout\ = (TempCount(1) & (!\TempCount[0]~17\)) # (!TempCount(1) & ((\TempCount[0]~17\) # (GND)))
-- \TempCount[1]~20\ = CARRY((!\TempCount[0]~17\) # (!TempCount(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(1),
	datad => VCC,
	cin => \TempCount[0]~17\,
	combout => \TempCount[1]~19_combout\,
	cout => \TempCount[1]~20\);

-- Location: LCFF_X21_Y26_N3
\TempCount[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[1]~19_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(1));

-- Location: LCCOMB_X21_Y26_N4
\TempCount[2]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[2]~21_combout\ = (TempCount(2) & (\TempCount[1]~20\ $ (GND))) # (!TempCount(2) & (!\TempCount[1]~20\ & VCC))
-- \TempCount[2]~22\ = CARRY((TempCount(2) & !\TempCount[1]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(2),
	datad => VCC,
	cin => \TempCount[1]~20\,
	combout => \TempCount[2]~21_combout\,
	cout => \TempCount[2]~22\);

-- Location: LCFF_X21_Y26_N5
\TempCount[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[2]~21_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(2));

-- Location: LCCOMB_X21_Y26_N6
\TempCount[3]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[3]~23_combout\ = (TempCount(3) & (!\TempCount[2]~22\)) # (!TempCount(3) & ((\TempCount[2]~22\) # (GND)))
-- \TempCount[3]~24\ = CARRY((!\TempCount[2]~22\) # (!TempCount(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(3),
	datad => VCC,
	cin => \TempCount[2]~22\,
	combout => \TempCount[3]~23_combout\,
	cout => \TempCount[3]~24\);

-- Location: LCFF_X21_Y26_N7
\TempCount[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[3]~23_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(3));

-- Location: LCCOMB_X24_Y26_N22
\dataout~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~4_combout\ = (\output~combout\ & ((\UseTemp~regout\ & ((TempCount(3)))) # (!\UseTemp~regout\ & (TotalCount(3))))) # (!\output~combout\ & (TotalCount(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(3),
	datab => \output~combout\,
	datac => TempCount(3),
	datad => \UseTemp~regout\,
	combout => \dataout~4_combout\);

-- Location: LCFF_X24_Y26_N23
\dataout[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~4_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(3));

-- Location: LCCOMB_X21_Y26_N8
\TempCount[4]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[4]~25_combout\ = (TempCount(4) & (\TempCount[3]~24\ $ (GND))) # (!TempCount(4) & (!\TempCount[3]~24\ & VCC))
-- \TempCount[4]~26\ = CARRY((TempCount(4) & !\TempCount[3]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(4),
	datad => VCC,
	cin => \TempCount[3]~24\,
	combout => \TempCount[4]~25_combout\,
	cout => \TempCount[4]~26\);

-- Location: LCFF_X21_Y26_N9
\TempCount[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[4]~25_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(4));

-- Location: LCCOMB_X24_Y26_N28
\dataout~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~5_combout\ = (\output~combout\ & ((\UseTemp~regout\ & ((TempCount(4)))) # (!\UseTemp~regout\ & (TotalCount(4))))) # (!\output~combout\ & (TotalCount(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(4),
	datab => \output~combout\,
	datac => TempCount(4),
	datad => \UseTemp~regout\,
	combout => \dataout~5_combout\);

-- Location: LCFF_X24_Y26_N29
\dataout[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~5_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(4));

-- Location: LCCOMB_X25_Y26_N4
\TotalCount[3]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[3]~20_combout\ = (TotalCount(3) & (\TotalCount[2]~19\ $ (GND))) # (!TotalCount(3) & (!\TotalCount[2]~19\ & VCC))
-- \TotalCount[3]~21\ = CARRY((TotalCount(3) & !\TotalCount[2]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(3),
	datad => VCC,
	cin => \TotalCount[2]~19\,
	combout => \TotalCount[3]~20_combout\,
	cout => \TotalCount[3]~21\);

-- Location: LCFF_X25_Y26_N5
\TotalCount[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[3]~20_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(3));

-- Location: LCCOMB_X25_Y26_N6
\TotalCount[4]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[4]~22_combout\ = (TotalCount(4) & (!\TotalCount[3]~21\)) # (!TotalCount(4) & ((\TotalCount[3]~21\) # (GND)))
-- \TotalCount[4]~23\ = CARRY((!\TotalCount[3]~21\) # (!TotalCount(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(4),
	datad => VCC,
	cin => \TotalCount[3]~21\,
	combout => \TotalCount[4]~22_combout\,
	cout => \TotalCount[4]~23\);

-- Location: LCFF_X25_Y26_N7
\TotalCount[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[4]~22_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(4));

-- Location: LCCOMB_X25_Y26_N8
\TotalCount[5]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[5]~24_combout\ = (TotalCount(5) & (\TotalCount[4]~23\ $ (GND))) # (!TotalCount(5) & (!\TotalCount[4]~23\ & VCC))
-- \TotalCount[5]~25\ = CARRY((TotalCount(5) & !\TotalCount[4]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(5),
	datad => VCC,
	cin => \TotalCount[4]~23\,
	combout => \TotalCount[5]~24_combout\,
	cout => \TotalCount[5]~25\);

-- Location: LCFF_X25_Y26_N9
\TotalCount[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[5]~24_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(5));

-- Location: LCCOMB_X24_Y26_N26
\dataout~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~6_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(5))) # (!\UseTemp~regout\ & ((TotalCount(5)))))) # (!\output~combout\ & (((TotalCount(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(5),
	datab => \output~combout\,
	datac => TotalCount(5),
	datad => \UseTemp~regout\,
	combout => \dataout~6_combout\);

-- Location: LCFF_X24_Y26_N27
\dataout[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(5));

-- Location: LCCOMB_X25_Y26_N10
\TotalCount[6]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[6]~26_combout\ = (TotalCount(6) & (!\TotalCount[5]~25\)) # (!TotalCount(6) & ((\TotalCount[5]~25\) # (GND)))
-- \TotalCount[6]~27\ = CARRY((!\TotalCount[5]~25\) # (!TotalCount(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(6),
	datad => VCC,
	cin => \TotalCount[5]~25\,
	combout => \TotalCount[6]~26_combout\,
	cout => \TotalCount[6]~27\);

-- Location: LCFF_X25_Y26_N11
\TotalCount[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[6]~26_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(6));

-- Location: LCCOMB_X24_Y26_N20
\dataout~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~7_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(6))) # (!\UseTemp~regout\ & ((TotalCount(6)))))) # (!\output~combout\ & (((TotalCount(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(6),
	datab => TotalCount(6),
	datac => \output~combout\,
	datad => \UseTemp~regout\,
	combout => \dataout~7_combout\);

-- Location: LCFF_X24_Y26_N21
\dataout[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~7_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(6));

-- Location: LCCOMB_X25_Y26_N12
\TotalCount[7]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[7]~28_combout\ = (TotalCount(7) & (\TotalCount[6]~27\ $ (GND))) # (!TotalCount(7) & (!\TotalCount[6]~27\ & VCC))
-- \TotalCount[7]~29\ = CARRY((TotalCount(7) & !\TotalCount[6]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(7),
	datad => VCC,
	cin => \TotalCount[6]~27\,
	combout => \TotalCount[7]~28_combout\,
	cout => \TotalCount[7]~29\);

-- Location: LCFF_X25_Y26_N13
\TotalCount[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[7]~28_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(7));

-- Location: LCCOMB_X24_Y26_N2
\dataout~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~8_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(7))) # (!\UseTemp~regout\ & ((TotalCount(7)))))) # (!\output~combout\ & (((TotalCount(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(7),
	datab => \output~combout\,
	datac => TotalCount(7),
	datad => \UseTemp~regout\,
	combout => \dataout~8_combout\);

-- Location: LCFF_X24_Y26_N3
\dataout[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~8_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(7));

-- Location: LCCOMB_X25_Y26_N14
\TotalCount[8]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[8]~30_combout\ = (TotalCount(8) & (!\TotalCount[7]~29\)) # (!TotalCount(8) & ((\TotalCount[7]~29\) # (GND)))
-- \TotalCount[8]~31\ = CARRY((!\TotalCount[7]~29\) # (!TotalCount(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(8),
	datad => VCC,
	cin => \TotalCount[7]~29\,
	combout => \TotalCount[8]~30_combout\,
	cout => \TotalCount[8]~31\);

-- Location: LCFF_X25_Y26_N15
\TotalCount[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[8]~30_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(8));

-- Location: LCCOMB_X24_Y26_N4
\dataout~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~9_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(8))) # (!\UseTemp~regout\ & ((TotalCount(8)))))) # (!\output~combout\ & (((TotalCount(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(8),
	datab => \output~combout\,
	datac => TotalCount(8),
	datad => \UseTemp~regout\,
	combout => \dataout~9_combout\);

-- Location: LCFF_X24_Y26_N5
\dataout[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~9_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(8));

-- Location: LCCOMB_X25_Y26_N16
\TotalCount[9]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[9]~32_combout\ = (TotalCount(9) & (\TotalCount[8]~31\ $ (GND))) # (!TotalCount(9) & (!\TotalCount[8]~31\ & VCC))
-- \TotalCount[9]~33\ = CARRY((TotalCount(9) & !\TotalCount[8]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(9),
	datad => VCC,
	cin => \TotalCount[8]~31\,
	combout => \TotalCount[9]~32_combout\,
	cout => \TotalCount[9]~33\);

-- Location: LCFF_X25_Y26_N17
\TotalCount[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[9]~32_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(9));

-- Location: LCCOMB_X21_Y26_N14
\TempCount[7]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[7]~31_combout\ = (TempCount(7) & (!\TempCount[6]~30\)) # (!TempCount(7) & ((\TempCount[6]~30\) # (GND)))
-- \TempCount[7]~32\ = CARRY((!\TempCount[6]~30\) # (!TempCount(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(7),
	datad => VCC,
	cin => \TempCount[6]~30\,
	combout => \TempCount[7]~31_combout\,
	cout => \TempCount[7]~32\);

-- Location: LCFF_X21_Y26_N15
\TempCount[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[7]~31_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(7));

-- Location: LCCOMB_X21_Y26_N18
\TempCount[9]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[9]~35_combout\ = (TempCount(9) & (!\TempCount[8]~34\)) # (!TempCount(9) & ((\TempCount[8]~34\) # (GND)))
-- \TempCount[9]~36\ = CARRY((!\TempCount[8]~34\) # (!TempCount(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(9),
	datad => VCC,
	cin => \TempCount[8]~34\,
	combout => \TempCount[9]~35_combout\,
	cout => \TempCount[9]~36\);

-- Location: LCFF_X21_Y26_N19
\TempCount[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[9]~35_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(9));

-- Location: LCCOMB_X24_Y26_N6
\dataout~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~10_combout\ = (\output~combout\ & ((\UseTemp~regout\ & ((TempCount(9)))) # (!\UseTemp~regout\ & (TotalCount(9))))) # (!\output~combout\ & (((TotalCount(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TotalCount(9),
	datad => TempCount(9),
	combout => \dataout~10_combout\);

-- Location: LCFF_X24_Y26_N7
\dataout[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~10_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(9));

-- Location: LCCOMB_X21_Y26_N20
\TempCount[10]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[10]~37_combout\ = (TempCount(10) & (\TempCount[9]~36\ $ (GND))) # (!TempCount(10) & (!\TempCount[9]~36\ & VCC))
-- \TempCount[10]~38\ = CARRY((TempCount(10) & !\TempCount[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(10),
	datad => VCC,
	cin => \TempCount[9]~36\,
	combout => \TempCount[10]~37_combout\,
	cout => \TempCount[10]~38\);

-- Location: LCFF_X21_Y26_N21
\TempCount[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[10]~37_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(10));

-- Location: LCCOMB_X25_Y26_N18
\TotalCount[10]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[10]~34_combout\ = (TotalCount(10) & (!\TotalCount[9]~33\)) # (!TotalCount(10) & ((\TotalCount[9]~33\) # (GND)))
-- \TotalCount[10]~35\ = CARRY((!\TotalCount[9]~33\) # (!TotalCount(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(10),
	datad => VCC,
	cin => \TotalCount[9]~33\,
	combout => \TotalCount[10]~34_combout\,
	cout => \TotalCount[10]~35\);

-- Location: LCFF_X25_Y26_N19
\TotalCount[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[10]~34_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(10));

-- Location: LCCOMB_X24_Y26_N12
\dataout~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~11_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(10))) # (!\UseTemp~regout\ & ((TotalCount(10)))))) # (!\output~combout\ & (((TotalCount(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TempCount(10),
	datad => TotalCount(10),
	combout => \dataout~11_combout\);

-- Location: LCFF_X24_Y26_N13
\dataout[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~11_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(10));

-- Location: LCCOMB_X21_Y26_N22
\TempCount[11]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[11]~39_combout\ = (TempCount(11) & (!\TempCount[10]~38\)) # (!TempCount(11) & ((\TempCount[10]~38\) # (GND)))
-- \TempCount[11]~40\ = CARRY((!\TempCount[10]~38\) # (!TempCount(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(11),
	datad => VCC,
	cin => \TempCount[10]~38\,
	combout => \TempCount[11]~39_combout\,
	cout => \TempCount[11]~40\);

-- Location: LCFF_X21_Y26_N23
\TempCount[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[11]~39_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(11));

-- Location: LCCOMB_X25_Y26_N20
\TotalCount[11]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[11]~36_combout\ = (TotalCount(11) & (\TotalCount[10]~35\ $ (GND))) # (!TotalCount(11) & (!\TotalCount[10]~35\ & VCC))
-- \TotalCount[11]~37\ = CARRY((TotalCount(11) & !\TotalCount[10]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(11),
	datad => VCC,
	cin => \TotalCount[10]~35\,
	combout => \TotalCount[11]~36_combout\,
	cout => \TotalCount[11]~37\);

-- Location: LCFF_X25_Y26_N21
\TotalCount[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[11]~36_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(11));

-- Location: LCCOMB_X24_Y26_N18
\dataout~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~12_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(11))) # (!\UseTemp~regout\ & ((TotalCount(11)))))) # (!\output~combout\ & (((TotalCount(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TempCount(11),
	datad => TotalCount(11),
	combout => \dataout~12_combout\);

-- Location: LCFF_X24_Y26_N19
\dataout[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~12_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(11));

-- Location: LCCOMB_X21_Y26_N24
\TempCount[12]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[12]~41_combout\ = (TempCount(12) & (\TempCount[11]~40\ $ (GND))) # (!TempCount(12) & (!\TempCount[11]~40\ & VCC))
-- \TempCount[12]~42\ = CARRY((TempCount(12) & !\TempCount[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TempCount(12),
	datad => VCC,
	cin => \TempCount[11]~40\,
	combout => \TempCount[12]~41_combout\,
	cout => \TempCount[12]~42\);

-- Location: LCFF_X21_Y26_N25
\TempCount[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[12]~41_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(12));

-- Location: LCCOMB_X25_Y26_N22
\TotalCount[12]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[12]~38_combout\ = (TotalCount(12) & (!\TotalCount[11]~37\)) # (!TotalCount(12) & ((\TotalCount[11]~37\) # (GND)))
-- \TotalCount[12]~39\ = CARRY((!\TotalCount[11]~37\) # (!TotalCount(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(12),
	datad => VCC,
	cin => \TotalCount[11]~37\,
	combout => \TotalCount[12]~38_combout\,
	cout => \TotalCount[12]~39\);

-- Location: LCFF_X25_Y26_N23
\TotalCount[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[12]~38_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(12));

-- Location: LCCOMB_X24_Y26_N0
\dataout~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~13_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(12))) # (!\UseTemp~regout\ & ((TotalCount(12)))))) # (!\output~combout\ & (((TotalCount(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TempCount(12),
	datad => TotalCount(12),
	combout => \dataout~13_combout\);

-- Location: LCFF_X24_Y26_N1
\dataout[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~13_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(12));

-- Location: LCCOMB_X21_Y26_N26
\TempCount[13]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[13]~43_combout\ = (TempCount(13) & (!\TempCount[12]~42\)) # (!TempCount(13) & ((\TempCount[12]~42\) # (GND)))
-- \TempCount[13]~44\ = CARRY((!\TempCount[12]~42\) # (!TempCount(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(13),
	datad => VCC,
	cin => \TempCount[12]~42\,
	combout => \TempCount[13]~43_combout\,
	cout => \TempCount[13]~44\);

-- Location: LCFF_X21_Y26_N27
\TempCount[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[13]~43_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(13));

-- Location: LCCOMB_X25_Y26_N24
\TotalCount[13]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[13]~40_combout\ = (TotalCount(13) & (\TotalCount[12]~39\ $ (GND))) # (!TotalCount(13) & (!\TotalCount[12]~39\ & VCC))
-- \TotalCount[13]~41\ = CARRY((TotalCount(13) & !\TotalCount[12]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TotalCount(13),
	datad => VCC,
	cin => \TotalCount[12]~39\,
	combout => \TotalCount[13]~40_combout\,
	cout => \TotalCount[13]~41\);

-- Location: LCFF_X25_Y26_N25
\TotalCount[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[13]~40_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(13));

-- Location: LCCOMB_X24_Y26_N10
\dataout~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~14_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(13))) # (!\UseTemp~regout\ & ((TotalCount(13)))))) # (!\output~combout\ & (((TotalCount(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TempCount(13),
	datad => TotalCount(13),
	combout => \dataout~14_combout\);

-- Location: LCFF_X24_Y26_N11
\dataout[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~14_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(13));

-- Location: LCCOMB_X25_Y26_N26
\TotalCount[14]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[14]~42_combout\ = (TotalCount(14) & (!\TotalCount[13]~41\)) # (!TotalCount(14) & ((\TotalCount[13]~41\) # (GND)))
-- \TotalCount[14]~43\ = CARRY((!\TotalCount[13]~41\) # (!TotalCount(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TotalCount(14),
	datad => VCC,
	cin => \TotalCount[13]~41\,
	combout => \TotalCount[14]~42_combout\,
	cout => \TotalCount[14]~43\);

-- Location: LCFF_X25_Y26_N27
\TotalCount[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[14]~42_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(14));

-- Location: LCCOMB_X21_Y26_N28
\TempCount[14]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[14]~45_combout\ = (TempCount(14) & (\TempCount[13]~44\ $ (GND))) # (!TempCount(14) & (!\TempCount[13]~44\ & VCC))
-- \TempCount[14]~46\ = CARRY((TempCount(14) & !\TempCount[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TempCount(14),
	datad => VCC,
	cin => \TempCount[13]~44\,
	combout => \TempCount[14]~45_combout\,
	cout => \TempCount[14]~46\);

-- Location: LCFF_X21_Y26_N29
\TempCount[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[14]~45_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(14));

-- Location: LCCOMB_X24_Y26_N16
\dataout~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~15_combout\ = (\output~combout\ & ((\UseTemp~regout\ & ((TempCount(14)))) # (!\UseTemp~regout\ & (TotalCount(14))))) # (!\output~combout\ & (((TotalCount(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TotalCount(14),
	datad => TempCount(14),
	combout => \dataout~15_combout\);

-- Location: LCFF_X24_Y26_N17
\dataout[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~15_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(14));

-- Location: LCCOMB_X21_Y26_N30
\TempCount[15]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \TempCount[15]~47_combout\ = \TempCount[14]~46\ $ (TempCount(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => TempCount(15),
	cin => \TempCount[14]~46\,
	combout => \TempCount[15]~47_combout\);

-- Location: LCFF_X21_Y26_N31
\TempCount[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TempCount[15]~47_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \ALT_INV_state.Measure~regout\,
	ena => \TempCount[15]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TempCount(15));

-- Location: LCCOMB_X25_Y26_N28
\TotalCount[15]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \TotalCount[15]~44_combout\ = \TotalCount[14]~43\ $ (!TotalCount(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => TotalCount(15),
	cin => \TotalCount[14]~43\,
	combout => \TotalCount[15]~44_combout\);

-- Location: LCFF_X25_Y26_N29
\TotalCount[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \TotalCount[15]~44_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \state.Measure~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => TotalCount(15));

-- Location: LCCOMB_X24_Y26_N14
\dataout~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \dataout~16_combout\ = (\output~combout\ & ((\UseTemp~regout\ & (TempCount(15))) # (!\UseTemp~regout\ & ((TotalCount(15)))))) # (!\output~combout\ & (((TotalCount(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output~combout\,
	datab => \UseTemp~regout\,
	datac => TempCount(15),
	datad => TotalCount(15),
	combout => \dataout~16_combout\);

-- Location: LCFF_X24_Y26_N15
\dataout[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk_10k~clkctrl_outclk\,
	datain => \dataout~16_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \dataout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => dataout(15));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(0));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(1));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(2));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(3));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(4));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(5));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(6));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(7));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(8));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(9));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(10));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(11));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(12));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(13));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(14));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => dataout(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data(15));
END structure;


