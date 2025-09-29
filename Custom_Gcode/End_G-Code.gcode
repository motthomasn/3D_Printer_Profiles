G4 ; wait
G91 ; switch to relative positioning
G1 E-3 F4800; retract quickly to avoid ooze
G0 Z10 F6000 ; Lift print head 10mm in Z to clear print
G90 ; switch back to absolute positioning
G0 X0 Y200 F10200; present bed
G91
;M109 R140 ; Reduce hot-end temperature and wait. Try to do a cold-pull
G1 E-30.0 F1200 ; retract filament
M220 S100 ; reset speed factor to 100%
M221 S100 ; reset extruder factor to 100%
M106 S0 ; turn off cooling fan
M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M84 ; disable motors
M300 S100 P10 ; chirp
