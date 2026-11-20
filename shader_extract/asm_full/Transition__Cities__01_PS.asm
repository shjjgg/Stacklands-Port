DCL_CONSTANT_BUFFER cb0[5].yz
DCL_CONSTANT_BUFFER cb1[7].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xy
DIV                temp0.y, cb1[6].yw, cb1[6].yw
ADD                temp0.y, input2.yw, (-0.5,0,0,0)
DIV                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, (0.5,0,0,0)
MUL                temp0.y, cb1[0].yw, (0.2,0,0,0)
MOV                temp0.y, input2.yw
MAD                temp0.y, temp0.yz, (0,0,0.2,0.2), temp0.yz
SAMPLE             temp1.y, temp0.yz, resou0.yz, sampl0.-
MAD                temp0.y, temp1.yz, (0.05,0.05,0,0), temp0.yz
MAD                temp0.y, cb1[0].yz, (0,0,0.2,0.2), temp0.yz
SAMPLE             temp1.y, temp0.yz, resou0.yz, sampl0.-
MAD                temp0.y, temp1.yz, (0.03,0.03,0,0), temp0.yz
MAD                temp1.y, cb0[4].yz, (0.075,-0.0875,0.4,0.4), (0.2,0.85,-0.1,-0.14)
ADD                temp0.y, temp0.yz, temp1.yz
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
MAD                temp2.y, cb0[4].yz, (0.1,0.075,-0.1,0.0625), (0.1,0.2,0.9,0.25)
ADD                temp2.y, temp0.yz, temp2.yz
DP2                temp0.y, temp2.yz, temp2.yz
DP2                temp1.y, temp2.yz, temp2.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, temp1.yw
MAX                temp1.y, temp1.yw, (0,0,0,0)
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
MAX                temp0.y, temp0.yz, (0,0,0,0)
ADD                temp1.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (25,0,0.5,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MUL                temp1.y, temp0.yw, (0.02,0,0,0)
ADD                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp1.yw, temp0.yw
MAD                temp1.y, temp1.yw, (25,0,0.5,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
MUL                temp0.y, temp1.yw, (0.02,0,0,0)
ADD                temp1.y, temp1.yw, (1,0,0,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp2.y, cb0[4].yz, (-0.1125,-0.1,0,0.1), (0.95,0.9,0.5,0.1)
ADD                temp2.y, temp0.yz, temp2.yz
DP2                temp0.y, temp2.yz, temp2.yz
DP2                temp1.y, temp2.yz, temp2.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, temp1.yw
MAX                temp1.y, temp1.yw, (0,0,0,0)
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
MAX                temp0.y, temp0.yw, (0,0,0,0)
ADD                temp1.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (25,0,0.5,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MUL                temp1.y, temp0.yw, (0.02,0,0,0)
ADD                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp1.yw, temp0.yw
MAD                temp1.y, temp1.yw, (25,0,0.5,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
MUL                temp0.y, temp1.yw, (0.02,0,0,0)
ADD                temp1.y, temp1.yw, (1,0,0,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp2.y, cb0[4].yz, (0,-0.1075,0.125,0), (0.5,0.93,0,0.5)
ADD                temp2.y, temp0.yz, temp2.yz
DP2                temp0.y, temp2.yz, temp2.yz
DP2                temp1.y, temp2.yz, temp2.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, temp1.yw
MAX                temp1.y, temp1.yw, (0,0,0,0)
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
MAX                temp0.y, temp0.yw, (0,0,0,0)
ADD                temp1.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (25,0,0.5,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MUL                temp1.y, temp0.yw, (0.02,0,0,0)
ADD                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp1.yw, temp0.yw
MAD                temp1.y, temp1.yw, (25,0,0.5,0)
MAD                temp0.y, temp1.yw, temp0.yw, temp0.yw
MUL                temp0.y, temp1.yw, (0.02,0,0,0)
ADD                temp1.y, temp1.yw, (1,0,0,0)
MAD                temp0.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp1.y, cb0[4].yz, (-0.125,0,0,0), (1,0.5,0,0)
ADD                temp0.y, temp0.yz, temp1.yz
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
MAX                temp0.y, temp0.yw, (0,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (25,0,0.5,0)
MAD                temp0.y, temp0.yw, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (0.02,0,0,0)
ADD                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp0.y, temp0.yw, temp0.yw, temp0.yw
LT                 temp0.y, (-0.1,0,0,0)
LT                 temp0.y, temp0.yz, (0.09,0,0.1,0)
AND                temp0.y, temp0.yw, temp0.yw
MOVC               outpu0.y, temp0.yz, (0,0,0,0), cb0[3].yz
AND                outpu0.y, temp0.yw, ()
RET                
