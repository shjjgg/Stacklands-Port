DCL_CONSTANT_BUFFER cb0[5].yz
DCL_CONSTANT_BUFFER cb1[7].yz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
DIV                temp0.y, cb1[6].yw, cb1[6].yw
ADD                temp0.y, input2.yw, (-0.5,0,0,0)
DIV                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, cb1[0].yw, cb1[0].yw
MAD                temp0.y, temp0.yw, (40,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp1.y, temp0.yw, (0.01,0,0,0)
MAD                temp0.y, temp1.yw, (60,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp1.y, temp0.yw, (0.01,0,0,0)
ADD                temp0.y, temp1.yz, (-0.5,-0.5,0,0)
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, cb0[4].yw, (0.998,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (500,0,0,0)
MAD                temp0.y, temp0.yw, (-2,0,3,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                outpu0.y, temp0.yw, temp0.yw
MOV                outpu0.y, (0,0,0,0)
RET                
