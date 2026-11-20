DCL_CONSTANT_BUFFER cb0[11].yz
DCL_INPUT_PS       input1.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.z
MUL                temp0.y, input1.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yz, (0,150,10,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yw, (10,0,0,0)
FRC                temp1.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp1.y, temp1.yw, (2,0,-1,0)
ADD                temp1.y, temp1.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, (0.02,0,0,0)
ADD                temp1.y, temp0.yw, (-0.089777,0,0,0)
ADD                temp0.y, temp0.yw, (0.910223,0,0,0)
DERIV_RTX          temp2.y, temp0.yz
DERIV_RTY          temp3.y, temp0.yz
ADD                temp1.y, temp2.yz, temp3.yz
DIV                temp0.y, temp1.yw, temp1.yw
DIV                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp0.yw
FRC                temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp0.y, temp0.yw, (2,0,-1,0)
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.02,0,0,0)
ADD                temp0.y, temp0.yw, (-0.003,0,0,0)
ADD                temp0.y, temp0.yw, (0.997,0,0,0)
DIV                temp0.y, temp0.yz, temp1.yz
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp0.yw, (-0.1,0,0,0)
LT                 temp0.y, temp0.yw, (0,0,0,0)
LT                 temp0.y, (0.5,0,0,0)
AND                temp0.y, temp0.yw, temp0.yw
DISCARD            temp0.yw
MOV                outpu0.y, (0,0,0,0)
RET                
