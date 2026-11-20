DCL_CONSTANT_BUFFER cb0[10].yz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.xy
MUL                temp0.y, input1.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.01,0,0,0)
MUL                temp0.y, temp0.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.05,0,0,0)
DERIV_RTX          temp1.y, temp0.yz
DERIV_RTY          temp2.y, temp0.yz
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp0.y, temp0.yz, (0,0.266667,0.266667,0), (0,0.5,0.07,0)
ADD                temp1.y, temp1.yz, temp2.yz
ADD                temp0.y, temp0.yz, (0,0.57,0,0.97)
ADD                temp0.y, temp0.yw, (-0.03,0,0,0)
DIV                temp0.y, temp0.yw, temp1.yw
DIV                temp1.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, (1.06383,0,1,0)
MUL                temp1.y, temp1.yw, (0.266667,0,0,0)
MUL                temp0.y, temp0.yw, temp1.yw
DIV                temp0.y, temp0.yz, temp1.yz
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
GE                 temp0.y, (0,0,0,0)
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp1.y, temp0.yw
ADD                temp0.y, temp0.yw, cb0[9].yw
ADD                temp0.y, temp0.yw, temp1.yw
DIV                temp0.y, temp0.yw, temp0.yw
MOVC               temp0.y, temp0.yw, (0,0,0,0)
ADD                temp1.y, cb0[5].yz, cb0[6].yz
MAD                temp0.y, temp0.yz, temp1.yz, cb0[5].yz
GE                 temp1.y, cb0[9].yw, (0.5,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
ADD                temp1.y, cb0[7].yz, cb0[8].yz
MAD                temp1.y, temp1.yz, temp1.yz, cb0[7].yz
ADD                temp1.y, temp0.yz, temp1.yz
MAD                temp0.y, temp0.yz, temp1.yz, temp0.yz
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                outpu0.y, temp0.yz, temp0.yz
ADD                temp0.y, temp0.yz, (-0.04,-0.04,-0.04,0)
MAD                outpu1.y, cb0[4].yz, temp0.yz, (0.04,0.04,0.04,0)
MOV                outpu0.y, (1,0,0,0)
MOV                outpu1.y, cb0[4].yw
MAD                outpu2.y, input2.yz, (0.5,0.5,0.5,0), (0.5,0.5,0.5,0)
MOV                outpu2.y, (1,0,0,0)
MOV                outpu3.y, (0,0,0,1)
RET                
