@echo off
:W
If %time%==23:50:00.00 goto :X
:X
shutdown f/ t/ 120 /c "GO TO BED RIGHT NOW!!!"