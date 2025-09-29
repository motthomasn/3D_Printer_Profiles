M115 U3.7.0 ; tell printer latest fw version
M204 R1250 ; sets retract acceleration (R) mm/sec^2

; Set initial warmup temps
M104 S160 ; set extruder no-ooze temp
M140 S65  ; set bed PINDA warmup temp
G21 ; set units to millimeters
G90 ; use absolute positioning

; Nozzle warmup routine
M109 ; wait for extruder no-ooze warmup temp before mesh bed leveling
M300 S40 P10 ; chirp
G28 W ; home all without mesh bed level

; PINDA warmup routine
M300 S40 P10 ; chirp
G0 Z3; Raise nozzle before move
G0 X125 Y210 F10200; Move nozzle to PINDA warming position
G0 Z0.10 F10200; Lower nozzle to PINDA warming position
M860 S35 ; wait for PINDA temp to stabilize
G0 Z3; Raise nozzle before move
M300 S40 P10 ; chirp
G80 ; mesh bed leveling
G0 Z3; Raise nozzle to avoid denting bed while nozzle heats
M140 S{first_layer_bed_temperature[0]} ; set bed final temp, Prusa Slicer
M140 S[bed0_temperature] ; set bed final temp, Simplify 3D

; Final warmup routine
M190 S{first_layer_bed_temperature[0]} ; wait for bed final temp, Prusa Slicer
M104 S{first_layer_temperature[0]} T0 ; set extruder final temp, Prusa Slicer
M109 S{first_layer_temperature[0]} T0 ; wait for extruder final temp, Prusa Slicer
M190 S[bed0_temperature] ; wait for bed final temp, Simplify 3D
M104 S[extruder0_temperature] T0 ; set extruder final temp, Simplify 3D
M109 S[extruder0_temperature] T0 ; wait for extruder final temp, Simplify 3D

; Prime line routine
M300 S25 P10 ; chirp
G0 Z-3; Restore nozzle position
M82  ; extruder absolute mode
G92 E0.0 ; reset extrusion distance
G1 Y-3.0 F1000.0 ; go outside print area
G1 X60.0 E9.0  F1000.0 ; priming
G1 X100.0 E12.5  F1000.0 ; priming

; Final print adjustments
M900 K32 ; Linear advance K factor for PLA 0.2mm layer height
