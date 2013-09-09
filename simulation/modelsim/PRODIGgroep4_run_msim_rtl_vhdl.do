transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/School/Github/PRODIG/ADC.vhd}

do "C:/School/Github/PRODIG/Test.txt"
