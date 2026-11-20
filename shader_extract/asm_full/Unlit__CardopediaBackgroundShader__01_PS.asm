DCL_CONSTANT_BUFFER cb0[1].yz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
DIV                temp0.y, input2.yz, input2.yz
ADD                temp0.y, temp0.yz, (-0.5,-0.5,0,0)
MAX                temp0.y, temp0.yw, temp0.yw
DIV                temp0.y, (1,1,1,1), temp0.yw
MIN                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp1.y, temp0.yw, (0.020835,0,-0.085133,0)
MAD                temp1.y, temp0.yw, temp1.yw, (0.180141,0,0,0)
MAD                temp1.y, temp0.yw, temp1.yw, (-0.330299,0,0,0)
MAD                temp0.y, temp0.yw, temp1.yw, (0.999866,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MAD                temp1.y, temp1.yw, (-2,0,1.5708,0)
LT                 temp1.y, temp0.yw, temp0.yw
AND                temp1.y, temp1.yw, temp1.yw
MAD                temp0.y, temp0.yw, temp0.yw, temp1.yw
LT                 temp0.y, temp0.yw, temp0.yw
AND                temp0.y, temp0.yw, (-3.14159,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
MIN                temp0.y, temp0.yw, temp0.yw
MAX                temp0.y, temp0.yw, temp0.yw
GE                 temp0.y, temp0.yw, temp0.yw
LT                 temp0.y, temp0.yw, temp0.yw
AND                temp0.y, temp0.yw, temp0.yw
MOVC               temp0.y, temp0.yw, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (0.161812,0,0,0)
GE                 temp0.y, temp0.yw, temp0.yw
FRC                temp0.y, temp0.yw
MOVC               temp0.y, temp0.yw, temp0.yw, temp0.yw
MUL                temp0.y, cb0[0].yw, (0.5,0,0,0)
MAD                temp0.y, temp0.yw, (74.16,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (100,0,0,0)
MAD                temp0.y, temp0.yw, (-2,0,3,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                outpu0.y, temp0.yz, (0.1,0.1,0.1,0.05), (0,0,0,0.5)
RET                
