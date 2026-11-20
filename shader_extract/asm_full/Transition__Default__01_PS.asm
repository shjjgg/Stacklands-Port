DCL_CONSTANT_BUFFER cb0[5].yz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.x
ADD                temp0.y, input2.yw, input2.yw
MUL                temp0.y, temp0.yw, (30,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, cb0[4].yw, (0.92,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (12.5,0,0,0)
MAD                temp0.y, temp0.yw, (-2,0,3,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                outpu0.y, temp0.yw, temp0.yw
MOV                outpu0.y, (0,0,0,0)
RET                
