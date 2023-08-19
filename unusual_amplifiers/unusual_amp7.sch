v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {A common Source amplifier gain stage, with an PMOS input.
} 500 -180 0 0 0.4 0.4 {}
N -100 -350 -100 -330 {
lab=GND}
N -100 -450 -100 -410 {
lab=VDD}
N 430 -590 430 -550 {
lab=VDD}
N -20 -350 -20 -330 {
lab=GND}
N -20 -450 -20 -410 {
lab=VIN}
N -20 -330 -20 -310 {
lab=GND}
N 100 270 100 300 {
lab=GND}
N 700 -350 740 -350 {
lab=VOUT}
N 100 190 150 190 {
lab=VINT}
N 100 190 100 210 {
lab=VINT}
N 210 190 280 190 {
lab=#net1}
N 270 110 270 190 {
lab=#net1}
N 270 30 270 50 {
lab=VIN}
N 700 150 740 150 {
lab=VOUTT}
N 700 210 700 230 {
lab=GND}
N 660 150 700 150 {
lab=VOUTT}
N 430 -360 430 -340 {
lab=VOUT}
N 430 -370 430 -360 {
lab=VOUT}
N 590 -350 700 -350 {
lab=VOUT}
N 640 -370 640 -350 {
lab=VOUT}
N 430 -310 470 -310 {
lab=GND}
N 360 -310 390 -310 {
lab=VB}
N 620 150 660 150 {
lab=VOUTT}
N 430 -280 430 -260 {
lab=GND}
N 430 -260 430 -240 {
lab=GND}
N 430 -390 430 -370 {
lab=VOUT}
N 430 -480 430 -450 {
lab=#net2}
N 430 -490 430 -480 {
lab=#net2}
N 430 -420 480 -420 {
lab=VDD}
N 430 -390 570 -390 {
lab=VOUT}
N 430 -350 590 -350 {
lab=VOUT}
N 80 -350 80 -310 {
lab=GND}
N 80 -460 80 -410 {
lab=VB}
N 370 -420 390 -420 {
lab=VIN}
N 430 -570 570 -570 {
lab=VDD}
N 570 -570 570 -450 {
lab=VDD}
N 570 150 620 150 {
lab=VOUTT}
N 500 150 510 150 {
lab=#net3}
N 280 190 310 190 {
lab=#net1}
N 370 20 370 60 {
lab=VDD}
N 370 250 370 270 {
lab=#net3}
N 370 240 370 250 {
lab=#net3}
N 370 300 410 300 {
lab=GND}
N 300 300 330 300 {
lab=VB}
N 370 330 370 350 {
lab=GND}
N 370 350 370 370 {
lab=GND}
N 370 220 370 240 {
lab=#net3}
N 370 130 370 160 {
lab=#net4}
N 370 120 370 130 {
lab=#net4}
N 370 190 420 190 {
lab=VDD}
N 310 190 330 190 {
lab=#net1}
N 500 150 500 250 {
lab=#net3}
N 370 250 500 250 {
lab=#net3}
N 370 140 480 140 {
lab=#net4}
N 480 200 480 220 {
lab=#net3}
N 370 220 480 220 {
lab=#net3}
C {devices/code.sym} 10 -160 0 0 {name=spice only_toplevel=false
format="tcleval( @value )"
value="	
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
*LIBs*********************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.include $::180MCU_MODELS/design.ngspice
*.lib $::180MCU_MODELS/sm141064.ngspice statistical *use statistical if you want global and parameter mismatch
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
*Corners/montecarlo options***********************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.TEMP 27
.param
+  sw_stat_global = 1
+  sw_stat_mism = 1
+ mc_skew = 3
+ res_mc_skew = 3
+ cap_mc_skew = 3
+ fnoicor = 1
**************************************************************
**************************************************************
**************************************************************
**************************************************************  
*SIMULATION and Plots*****************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.control
save all
dc V2 0 6 0.01 
*dc simulation
plot v(VOUT) v(VIN) deriv(v(VOUT))  
*ploting VIN VOUT and the voltage gain
plot i(Vmeas) 
*ploting the current for curiosity
tran 100ns 2m 
*transient simulation
plot (v(VINT)) (v(VOUTT))
*simple plot to exemplify the gain
fft v(VOUTT) v(VINT) 
*fast fourier transfor
plot mag(v(VOUTT)) mag(v(VINT)) 
* analyse the frequency spectrum of the transient waves, to detect distortion
ac dec 20 1 50G 
*simple ac simulation
plot v(VOUTT) 
*gain in function of the input frequency
.endc
"}
C {devices/ammeter.sym} 430 -520 0 0 {name=Vmeas}
C {devices/lab_pin.sym} -100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -100 -380 0 0 {name=V1 value=6
}
C {devices/vsource.sym} -20 -380 0 0 {name=V2 value=4.88}
C {devices/gnd.sym} -100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -580 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 100 300 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -20 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 640 -370 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 100 240 0 0 {name=V3 value="ac 1.0 sin (0 1m 1k)"}
C {devices/gnd.sym} -20 -310 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 270 30 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 270 80 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 700 180 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 700 230 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 740 150 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 110 190 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/res.sym} 740 -320 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 740 -290 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 180 190 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {symbols/nfet_06v0.sym} 410 -310 0 0 {name=M1
L=2u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {devices/res.sym} 570 -420 0 0 {name=R2
value=50k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 470 -310 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 370 -420 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 430 -240 0 0 {name=l2 lab=GND}
C {symbols/pfet_06v0.sym} 410 -420 0 0 {name=M3
L=0.5u
W=70u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {devices/lab_pin.sym} 480 -420 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 80 -380 0 0 {name=V4 value=2
}
C {devices/gnd.sym} 80 -310 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 80 -460 0 0 {name=p11 sig_type=std_logic lab=VB
}
C {devices/lab_pin.sym} 360 -310 0 0 {name=p12 sig_type=std_logic lab=VB
}
C {devices/capa.sym} 540 150 3 0 {name=C2
m=1
value=10m
footprint=1206
device="ceramic capacitor"}
C {devices/ammeter.sym} 370 90 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 370 30 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {symbols/nfet_06v0.sym} 350 300 0 0 {name=M2
L=2u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {devices/gnd.sym} 410 300 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 370 370 0 0 {name=l8 lab=GND}
C {symbols/pfet_06v0.sym} 350 190 0 0 {name=M4
L=0.5u
W=70u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {devices/lab_pin.sym} 420 190 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 300 300 0 0 {name=p15 sig_type=std_logic lab=VB
}
C {devices/res.sym} 480 170 0 0 {name=R4
value=50k
footprint=1206
device=resistor
m=1}
