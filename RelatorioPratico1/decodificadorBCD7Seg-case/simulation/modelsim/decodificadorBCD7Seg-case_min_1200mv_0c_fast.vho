-- Copyright (C) 1991-2013 Altera Corporation
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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/18/2023 19:29:19"

-- 
-- Device: Altera EP3C5E144C7 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	decodificadorBCD7Seg IS
    PORT (
	bcd : IN std_logic_vector(3 DOWNTO 0);
	abcdefg : OUT std_logic_vector(6 DOWNTO 0)
	);
END decodificadorBCD7Seg;

-- Design Ports Information
-- abcdefg[0]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[1]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[2]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[3]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[4]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[5]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- abcdefg[6]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[0]	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[1]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[2]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[3]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decodificadorBCD7Seg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_bcd : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_abcdefg : std_logic_vector(6 DOWNTO 0);
SIGNAL \abcdefg[0]~output_o\ : std_logic;
SIGNAL \abcdefg[1]~output_o\ : std_logic;
SIGNAL \abcdefg[2]~output_o\ : std_logic;
SIGNAL \abcdefg[3]~output_o\ : std_logic;
SIGNAL \abcdefg[4]~output_o\ : std_logic;
SIGNAL \abcdefg[5]~output_o\ : std_logic;
SIGNAL \abcdefg[6]~output_o\ : std_logic;
SIGNAL \bcd[2]~input_o\ : std_logic;
SIGNAL \bcd[1]~input_o\ : std_logic;
SIGNAL \bcd[0]~input_o\ : std_logic;
SIGNAL \bcd[3]~input_o\ : std_logic;
SIGNAL \abcdefg~0_combout\ : std_logic;
SIGNAL \abcdefg~1_combout\ : std_logic;
SIGNAL \abcdefg~2_combout\ : std_logic;
SIGNAL \abcdefg~3_combout\ : std_logic;
SIGNAL \abcdefg~4_combout\ : std_logic;
SIGNAL \abcdefg~5_combout\ : std_logic;
SIGNAL \abcdefg~6_combout\ : std_logic;

BEGIN

ww_bcd <= bcd;
abcdefg <= ww_abcdefg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X13_Y0_N16
\abcdefg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~0_combout\,
	devoe => ww_devoe,
	o => \abcdefg[0]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\abcdefg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~1_combout\,
	devoe => ww_devoe,
	o => \abcdefg[1]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\abcdefg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~2_combout\,
	devoe => ww_devoe,
	o => \abcdefg[2]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\abcdefg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~3_combout\,
	devoe => ww_devoe,
	o => \abcdefg[3]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\abcdefg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~4_combout\,
	devoe => ww_devoe,
	o => \abcdefg[4]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\abcdefg[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~5_combout\,
	devoe => ww_devoe,
	o => \abcdefg[5]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\abcdefg[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \abcdefg~6_combout\,
	devoe => ww_devoe,
	o => \abcdefg[6]~output_o\);

-- Location: IOIBUF_X0_Y6_N22
\bcd[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd(2),
	o => \bcd[2]~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\bcd[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd(1),
	o => \bcd[1]~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\bcd[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd(0),
	o => \bcd[0]~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\bcd[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd(3),
	o => \bcd[3]~input_o\);

-- Location: LCCOMB_X1_Y4_N24
\abcdefg~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~0_combout\ = (!\bcd[3]~input_o\ & ((\bcd[2]~input_o\ & (\bcd[1]~input_o\ & \bcd[0]~input_o\)) # (!\bcd[2]~input_o\ & (!\bcd[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~0_combout\);

-- Location: LCCOMB_X1_Y4_N26
\abcdefg~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~1_combout\ = (!\bcd[3]~input_o\ & ((\bcd[2]~input_o\ & (\bcd[1]~input_o\ & \bcd[0]~input_o\)) # (!\bcd[2]~input_o\ & ((\bcd[1]~input_o\) # (\bcd[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~1_combout\);

-- Location: LCCOMB_X1_Y4_N4
\abcdefg~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~2_combout\ = (\bcd[1]~input_o\ & (((\bcd[0]~input_o\ & !\bcd[3]~input_o\)))) # (!\bcd[1]~input_o\ & ((\bcd[2]~input_o\ & ((!\bcd[3]~input_o\))) # (!\bcd[2]~input_o\ & (\bcd[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~2_combout\);

-- Location: LCCOMB_X1_Y4_N14
\abcdefg~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~3_combout\ = (!\bcd[3]~input_o\ & ((\bcd[2]~input_o\ & (\bcd[1]~input_o\ $ (!\bcd[0]~input_o\))) # (!\bcd[2]~input_o\ & (!\bcd[1]~input_o\ & \bcd[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~3_combout\);

-- Location: LCCOMB_X1_Y4_N16
\abcdefg~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~4_combout\ = (!\bcd[2]~input_o\ & (\bcd[1]~input_o\ & (!\bcd[0]~input_o\ & !\bcd[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~4_combout\);

-- Location: LCCOMB_X1_Y4_N10
\abcdefg~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~5_combout\ = (\bcd[2]~input_o\ & (!\bcd[3]~input_o\ & (\bcd[1]~input_o\ $ (\bcd[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~5_combout\);

-- Location: LCCOMB_X1_Y4_N12
\abcdefg~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \abcdefg~6_combout\ = (!\bcd[1]~input_o\ & (!\bcd[3]~input_o\ & (\bcd[2]~input_o\ $ (\bcd[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd[2]~input_o\,
	datab => \bcd[1]~input_o\,
	datac => \bcd[0]~input_o\,
	datad => \bcd[3]~input_o\,
	combout => \abcdefg~6_combout\);

ww_abcdefg(0) <= \abcdefg[0]~output_o\;

ww_abcdefg(1) <= \abcdefg[1]~output_o\;

ww_abcdefg(2) <= \abcdefg[2]~output_o\;

ww_abcdefg(3) <= \abcdefg[3]~output_o\;

ww_abcdefg(4) <= \abcdefg[4]~output_o\;

ww_abcdefg(5) <= \abcdefg[5]~output_o\;

ww_abcdefg(6) <= \abcdefg[6]~output_o\;
END structure;


