DCL_CONSTANT_BUFFER cb0[8].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[8].yz
DCL_CONSTANT_BUFFER cb4[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_INPUT_PS       input4.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.zw
ADD                temp0.y, input3.yz, cb1[4].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
ADD                temp1.y, input1.yw, (-0.5,0,0,0)
MUL                temp2.y, temp1.yz, (0.333333,150,0,0)
DERIV_RTX          temp1.y, temp2.yw
DERIV_RTY          temp2.y, temp2.yw
ADD                temp1.y, temp1.yw, temp2.yw
ROUND_NE           temp2.y, temp2.yw
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, (43758.5,0,0,0)
FRC                temp2.y, temp2.yw
ADD                temp2.y, temp2.yw, (-0.5,0,0,0)
MAD                temp3.y, temp2.yw, (0.005,0,0,0)
MUL                temp2.y, temp3.yw, (150,0,0,0)
ROUND_NE           temp2.y, temp2.yw
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, (43758.5,0,0,0)
FRC                temp2.y, temp2.yw
ADD                temp2.y, temp2.yw, (-0.5,0,0,0)
MAD                temp3.y, temp2.yw, (0.001667,0,0,0)
ADD                temp2.y, cb0[6].yz, cb0[7].yz
ADD                temp2.y, temp2.yz, temp3.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
DP2                temp2.y, temp2.yz, temp2.yz
SQRT               temp2.y, temp2.yw
DIV                temp1.y, temp2.yw, temp1.yw
MIN                temp1.y, temp1.yw, (1,0,0,0)
MAD                temp2.y, temp1.yz, cb0[5].yz, cb0[5].yz
EQ                 temp1.y, cb4[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp2.y, cb4[0].yw, (1,0,0,0)
MUL                temp3.y, input3.yz, cb4[2].yz
MAD                temp3.y, cb4[1].yz, input3.yz, temp3.yz
MAD                temp3.y, cb4[3].yz, input3.yz, temp3.yz
ADD                temp3.y, temp3.yz, cb4[4].yz
MOVC               temp3.y, temp2.yz, temp3.yz, input3.yz
ADD                temp3.y, temp3.yz, cb4[6].yz
MUL                temp3.y, temp3.yz, cb4[5].yz
MAD                temp2.y, temp3.yw, (0.25,0,0.75,0)
MAD                temp3.y, cb4[0].yw, (0.5,0,0.75,0)
MAX                temp3.y, temp2.yw, temp3.yw
SAMPLE             temp3.y, temp3.yz, resou2.yz, sampl1.-
ELSE               
MOV                temp3.y, (1,1,1,1)
ENDIF              
DP4                temp2.y, temp3.yz, cb2[46].yz
ADD                temp3.y, cb0[4].yw, (1,0,0,0)
DP3                temp3.y, temp1.yz, input2.yz
ADD                temp3.y, temp3.yw, temp3.yw
MAD                temp3.y, input2.yz, temp3.yz, temp1.yz
MUL                temp4.y, temp2.yz, cb0[2].yz
IF                 temp1.yw
EQ                 temp1.y, cb4[0].yw, (1,0,0,0)
MUL                temp5.y, input3.yz, cb4[2].yz
MAD                temp5.y, cb4[1].yz, input3.yz, temp5.yz
MAD                temp5.y, cb4[3].yz, input3.yz, temp5.yz
ADD                temp5.y, temp5.yz, cb4[4].yz
MOVC               temp5.y, temp1.yz, temp5.yz, input3.yz
ADD                temp5.y, temp5.yz, cb4[6].yz
MUL                temp5.y, temp5.yz, cb4[5].yz
MUL                temp1.y, temp5.yw, (0.25,0,0,0)
MUL                temp2.y, cb4[0].yw, (0.5,0,0,0)
MAD                temp4.y, cb4[0].yw, (0.5,0,0.25,0)
MAX                temp1.y, temp1.yw, temp2.yw
MIN                temp5.y, temp4.yw, temp1.yw
SAMPLE             temp6.y, temp5.yz, resou2.yz, sampl1.-
ADD                temp7.y, temp5.yz, (0.25,0,0,0)
SAMPLE             temp7.y, temp7.yz, resou2.yz, sampl1.-
ADD                temp5.y, temp5.yz, (0.5,0,0,0)
SAMPLE             temp5.y, temp5.yz, resou2.yz, sampl1.-
MOV                temp8.y, input2.yz
MOV                temp8.y, (1,0,0,0)
DP4                temp6.y, temp6.yz, temp8.yz
DP4                temp6.y, temp7.yz, temp8.yz
DP4                temp6.y, temp5.yz, temp8.yz
ELSE               
MOV                temp5.y, input2.yz
MOV                temp5.y, (1,0,0,0)
DP4                temp6.y, cb2[39].yz, temp5.yz
DP4                temp6.y, cb2[40].yz, temp5.yz
DP4                temp6.y, cb2[41].yz, temp5.yz
ENDIF              
ADD                temp5.y, temp6.yz, input4.yz
MAX                temp5.y, temp5.yz, (0,0,0,0)
LT                 temp1.y, (0,0,0,0)
IF                 temp1.yw
DP3                temp1.y, temp3.yz, temp3.yz
RSQ                temp1.y, temp1.yw
MUL                temp6.y, temp1.yz, temp3.yz
ADD                temp7.y, input3.yz, cb3[0].yz
DIV                temp7.y, temp7.yz, temp6.yz
ADD                temp8.y, input3.yz, cb3[1].yz
DIV                temp8.y, temp8.yz, temp6.yz
LT                 temp9.y, (0,0,0,0), temp6.yz
MOVC               temp7.y, temp9.yz, temp7.yz, temp8.yz
MIN                temp1.y, temp7.yw, temp7.yw
MIN                temp1.y, temp7.yw, temp1.yw
ADD                temp7.y, input3.yz, cb3[2].yz
MAD                temp6.y, temp6.yz, temp1.yz, temp7.yz
ELSE               
MOV                temp6.y, temp3.yz
ENDIF              
MAD                temp1.y, temp3.yw, (0.7,0,1.7,0)
MUL                temp1.y, temp1.yw, temp3.yw
MUL                temp1.y, temp1.yw, (6,0,0,0)
SAMPLE_LOD         temp6.y, temp6.yz, resou0.yz, sampl0.-, temp1.yw
ADD                temp2.y, temp6.yw, (-1,0,0,0)
MAD                temp2.y, cb3[3].yw, temp2.yw, (1,0,0,0)
LOG                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb3[3].yw
EXP                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb3[3].yw
MUL                temp7.y, temp6.yz, temp2.yz
LT                 temp4.y, cb3[1].yw, (0.99999,0,0,0)
IF                 temp4.yw
LT                 temp4.y, (0,0,0,0)
IF                 temp4.yw
DP3                temp4.y, temp3.yz, temp3.yz
RSQ                temp4.y, temp4.yw
MUL                temp8.y, temp3.yz, temp4.yz
ADD                temp9.y, input3.yz, cb3[4].yz
DIV                temp9.y, temp9.yz, temp8.yz
ADD                temp10.y, input3.yz, cb3[5].yz
DIV                temp10.y, temp10.yz, temp8.yz
LT                 temp11.y, (0,0,0,0), temp8.yz
MOVC               temp9.y, temp11.yz, temp9.yz, temp10.yz
MIN                temp4.y, temp9.yw, temp9.yw
MIN                temp4.y, temp9.yw, temp4.yw
ADD                temp9.y, input3.yz, cb3[6].yz
MAD                temp3.y, temp8.yz, temp4.yz, temp9.yz
ENDIF              
SAMPLE_LOD         temp8.y, temp3.yz, resou1.yz, sampl0.-, temp1.yw
ADD                temp1.y, temp8.yw, (-1,0,0,0)
MAD                temp1.y, cb3[7].yw, temp1.yw, (1,0,0,0)
LOG                temp1.y, temp1.yw
MUL                temp1.y, temp1.yw, cb3[7].yw
EXP                temp1.y, temp1.yw
MUL                temp1.y, temp1.yw, cb3[7].yw
MUL                temp3.y, temp8.yz, temp1.yz
MAD                temp6.y, temp2.yz, temp6.yz, temp3.yz
MAD                temp7.y, cb3[1].yz, temp6.yz, temp3.yz
ENDIF              
DP3                temp1.y, input2.yz, input2.yz
RSQ                temp1.y, temp1.yw
MUL                temp3.y, temp1.yz, input2.yz
ADD                temp6.y, temp2.yz, (-0.04,-0.04,-0.04,0)
MAD                temp6.y, cb0[4].yz, temp6.yz, (0.04,0.04,0.04,0)
MAD                temp1.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp2.y, temp1.yz, temp2.yz
MAD                temp0.y, temp0.yz, temp0.yz, cb2[0].yz
DP3                temp0.y, temp0.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0.001,0,0,0)
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
DP3                temp0.y, temp3.yz, temp1.yz
DP3                temp1.y, temp3.yz, cb2[0].yz
DP3                temp1.y, temp3.yz, temp0.yz
DP3                temp0.y, cb2[0].yz, temp0.yz
MUL                temp0.y, temp0.yw, temp0.yw
DP2                temp0.y, temp0.yz, temp3.yz
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
ADD                temp0.y, temp1.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
ADD                temp1.y, temp0.yw, (1,0,0,0)
MUL                temp2.y, temp1.yw, temp1.yw
MUL                temp2.y, temp2.yw, temp2.yw
MUL                temp1.y, temp1.yw, temp2.yw
MAD                temp0.y, temp0.yw, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp3.yw, temp3.yw
MAX                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp2.y, temp0.yw, (1,0,0,0)
MAD                temp3.y, temp0.yw, temp2.yw, temp0.yw
MAD                temp2.y, temp1.yw, temp2.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp2.yw
MAD                temp0.y, temp1.yw, temp3.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1e-05,0,0,0)
DIV                temp0.y, (0.5,0,0,0)
MUL                temp2.y, temp0.yw, temp0.yw
MAD                temp3.y, temp1.yw, temp2.yw, temp1.yw
MAD                temp1.y, temp3.yw, temp1.yw, (1,0,0,0)
MUL                temp2.y, temp2.yw, (0.31831,0,0,0)
MAD                temp1.y, temp1.yw, temp1.yw, (0,0,0,0)
DIV                temp1.y, temp2.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, (3.14159,0,0,0)
MUL                temp0.y, temp1.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0,0,0,0)
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
DIV                temp0.y, (1,1,1,1), temp0.yw
DP3                temp1.y, temp6.yz, temp6.yz
NE                 temp1.y, temp1.yw, (0,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp1.yw, cb0[4].yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
MAD                temp3.y, temp4.yz, temp0.yz, temp5.yz
MUL                temp4.y, temp4.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp5.y, temp6.yz, (1,1,1,0)
MAD                temp0.y, temp5.yz, temp0.yz, temp6.yz
MUL                temp0.y, temp0.yz, temp4.yz
MAD                temp0.y, temp2.yz, temp3.yz, temp0.yz
MUL                temp2.y, temp7.yz, temp0.yz
ADD                temp1.y, temp6.yz, temp1.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp6.yz
MAD                outpu0.y, temp2.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
