DCL_CONSTANT_BUFFER cb0[13].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.z
MUL                temp0.y, input2.yw, (1000,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, cb0[12].yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yz, (0,500,10,0)
ROUND_NE           temp0.y, temp0.yz
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, cb0[12].yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
ADD                temp0.y, temp0.yw, cb1[0].yw
MUL                temp0.y, temp0.yw, (250,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp1.yw, (10,0,0,0)
ROUND_NE           temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, cb1[0].yw
MUL                temp0.y, temp0.yw, (250,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.005,0,0,0)
ADD                temp0.y, cb0[10].yz, cb0[11].yz
DP2                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp0.yz
MOV                temp2.y, (0,0,0,0)
ADD                temp1.y, temp2.yz, temp2.yz
MAD                temp2.y, temp0.yz, temp0.yz, temp1.yz
MUL                temp2.y, temp2.yz, cb0[12].yz
MAD                temp1.y, temp0.yz, temp0.yz, temp1.yz
MUL                temp1.y, temp1.yz, cb0[12].yz
ADD                temp2.y, temp1.yz, cb0[10].yz
DP2                temp0.y, temp2.yz, temp0.yz
DIV                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yz, temp0.yz, temp2.yz
DP2                temp0.y, temp0.yz, temp0.yz
ADD                temp0.y, temp1.yz, cb0[11].yz
DP2                temp0.y, temp0.yz, temp2.yz
DP2                temp1.y, temp2.yz, temp2.yz
DIV                temp0.y, temp0.yw, temp1.yw
MAD                temp1.y, temp0.yz, temp2.yz, temp0.yz
DP2                temp0.y, temp1.yz, temp1.yz
SQRT               temp0.y, temp0.yz
MIN                temp0.y, temp0.yw, temp0.yw
DP2                temp0.y, temp0.yz, temp1.yz
DP2                temp1.y, temp1.yz, temp1.yz
DIV                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yz, temp1.yz, temp0.yz
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
MIN                temp0.y, temp0.yw, temp0.yw
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, cb0[12].yw, cb0[12].yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yw, temp0.yw
DIV                temp0.y, temp1.yw, temp0.yw
ADD                temp1.y, cb0[8].yz, cb0[9].yz
MAD                temp1.y, temp0.yz, temp1.yz, cb0[8].yz
MAD                temp0.y, cb0[12].yw, (2,0,0,0)
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yz, temp0.yz
DIV                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yz, temp1.yz, temp1.yz
MUL                temp1.y, input2.yz, cb0[5].yz
MAD                temp1.y, cb0[4].yz, input2.yz, temp1.yz
MAD                temp1.y, cb0[6].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb0[7].yz
EQ                 temp1.y, cb3[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp1.y, cb3[0].yw, (1,0,0,0)
MUL                temp2.y, input2.yz, cb3[2].yz
MAD                temp2.y, cb3[1].yz, input2.yz, temp2.yz
MAD                temp2.y, cb3[3].yz, input2.yz, temp2.yz
ADD                temp2.y, temp2.yz, cb3[4].yz
MOVC               temp2.y, temp1.yz, temp2.yz, input2.yz
ADD                temp2.y, temp2.yz, cb3[6].yz
MUL                temp2.y, temp2.yz, cb3[5].yz
MAD                temp1.y, temp2.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb3[0].yw, (0.5,0,0.75,0)
MAX                temp2.y, temp1.yw, temp2.yw
SAMPLE             temp2.y, temp2.yz, resou2.yz, sampl0.-
ELSE               
MOV                temp2.y, (1,1,1,1)
ENDIF              
DP4                temp1.y, temp2.yz, cb2[46].yz
DP3                temp2.y, temp1.yz, temp1.yz
SAMPLE             temp2.y, temp2.yz, resou0.yz, sampl2.-
SAMPLE             temp3.y, temp1.yz, resou1.yz, sampl1.-
MUL                temp1.y, temp2.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yz, temp1.yz
MUL                outpu0.y, temp0.yz, cb0[2].yz
RET                
