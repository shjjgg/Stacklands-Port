DCL_CONSTANT_BUFFER cb0[8].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[4].yz
DCL_CONSTANT_BUFFER cb4[7].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xy
MUL                temp0.y, input2.yw, (800,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.007,0,0,0)
MUL                temp0.y, temp0.yz, (0,400,10,0)
ROUND_NE           temp0.y, temp0.yz
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.007,0,0,0)
ADD                temp0.y, temp0.yw, cb1[0].yw
MUL                temp0.y, temp0.yw, (200,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.01,0,0,0)
MUL                temp0.y, temp1.yw, (10,0,0,0)
ROUND_NE           temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, cb1[0].yw
MUL                temp0.y, temp0.yw, (200,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.01,0,0,0)
ADD                temp0.y, temp1.yz, cb3[3].yz
MAD                temp0.y, cb0[6].yz, (0.5,0.5,0,0), temp0.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yw, temp1.yw
DIV                temp0.y, temp0.yw, temp0.yw
ADD                temp1.y, cb0[4].yz, cb0[5].yz
MAD                temp1.y, temp0.yz, temp1.yz, cb0[4].yz
ADD                temp0.y, cb0[7].yw, cb0[7].yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yz, temp0.yz
DIV                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yz, temp1.yz, temp1.yz
EQ                 temp1.y, cb4[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp1.y, cb4[0].yw, (1,0,0,0)
MUL                temp1.y, input2.yz, cb4[2].yz
MAD                temp1.y, cb4[1].yz, input2.yz, temp1.yz
MAD                temp1.y, cb4[3].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb4[4].yz
MOVC               temp1.y, temp1.yz, temp1.yz, input2.yz
ADD                temp1.y, temp1.yz, cb4[6].yz
MUL                temp1.y, temp1.yz, cb4[5].yz
MAD                temp1.y, temp1.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb4[0].yw, (0.5,0,0.75,0)
MAX                temp1.y, temp1.yw, temp2.yw
SAMPLE             temp1.y, temp1.yz, resou0.yz, sampl0.-
ELSE               
MOV                temp1.y, (1,1,1,1)
ENDIF              
DP4                temp1.y, temp1.yz, cb2[46].yz
MUL                temp2.y, temp0.yz, input3.yz
MUL                temp0.y, temp0.yz, temp1.yz
MOV                temp2.y, (0,0,0,0)
MAD                outpu0.y, temp0.yz, cb0[2].yz, temp2.yz
RET                
