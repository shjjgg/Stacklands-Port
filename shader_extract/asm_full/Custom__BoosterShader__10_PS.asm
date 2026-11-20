DCL_CONSTANT_BUFFER cb0[9].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[26].yz
DCL_CONSTANT_BUFFER cb4[12].yz
DCL_CONSTANT_BUFFER cb5[8].yz
DCL_CONSTANT_BUFFER cb6[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_SAMPLER        sampl3.-
DCL_SAMPLER        sampl4.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_RESOURCE       resou3.-, immed0.xz
DCL_RESOURCE       resou4.-, immed0.xz
DCL_RESOURCE       resou5.-, immed0.xz
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
MUL                temp1.y, input1.yw, (150,0,0,0)
ROUND_NE           temp1.y, temp1.yw
SINCOS             temp1.y, strea0.-, temp1.yw
MUL                temp1.y, temp1.yw, (43758.5,0,0,0)
FRC                temp1.y, temp1.yw
MAD                temp1.y, temp1.yw, (0.005,0,0,0)
MUL                temp2.y, temp1.yw, (150,0,0,0)
ROUND_NE           temp2.y, temp2.yw
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, (43758.5,0,0,0)
FRC                temp2.y, temp2.yw
MAD                temp2.y, temp2.yw, (0.005,0,0,0)
DERIV_RTX          temp3.y, temp1.yw
DERIV_RTX          temp3.y, temp2.yw
DERIV_RTY          temp4.y, temp1.yw
DERIV_RTY          temp4.y, temp2.yw
ADD                temp2.y, temp3.yz, temp4.yz
ADD                temp3.y, input1.yz, (-0.5,-0.4,-0.5,-0.4)
MAD                temp3.y, temp3.yz, (1.75,1.75,1.75,1.75), (0.5,0.4,0,-0.1)
GE                 temp4.y, temp3.yz, (0,0,0,0)
GE                 temp4.y, (0,0,1,1), temp3.yz
AND                temp4.y, temp4.yz, (1,1,1,1)
MUL                temp2.y, temp4.yw, temp4.yw
MUL                temp2.y, temp4.yw, temp2.yw
SAMPLE             temp5.y, temp3.yz, resou0.yz, sampl3.-
MAD                temp2.y, temp2.yw, temp4.yw, (1,0,0,0)
MAD                temp3.y, temp2.yz, temp5.yz, temp5.yz
ADD                temp4.y, input3.yz, cb1[4].yz
DP3                temp2.y, temp4.yz, temp4.yz
RSQ                temp2.y, temp2.yw
MUL                temp4.y, temp2.yz, temp4.yz
ADD                temp4.y, input1.yz, input1.yz
MAD                temp4.y, temp4.yz, (5,5,0,0), temp4.yz
MUL                temp2.y, temp4.yw, (10,0,0,0)
SINCOS             temp2.y, strea0.-, temp2.yw
MAD                temp5.y, temp2.yw, (0.02,0,0,0)
MUL                temp2.y, temp5.yw, (30,0,0,0)
SINCOS             strea0.-, temp2.y, temp2.yw
MAD                temp5.y, temp2.yw, (0.02,0,0,0)
SAMPLE             temp4.y, temp5.yz, resou1.yz, sampl4.-
DP2                temp2.y, temp3.yz, temp3.yz
SQRT               temp2.y, temp2.yw
ADD                temp2.y, temp2.yw, (-0.400391,0,0,0)
DIV                temp2.y, temp2.yw, temp2.yw
ADD                temp2.y, temp2.yw, (1,0,0,0)
ADD                temp5.y, cb0[5].yz, cb0[6].yz
MAD                temp5.y, temp2.yz, temp5.yz, cb0[5].yz
ADD                temp2.y, temp3.yw, (1,0,0,0)
ADD                temp3.y, cb0[5].yz, cb0[8].yz
MAD                temp3.y, temp2.yz, temp3.yz, cb0[5].yz
ADD                temp3.y, temp5.yz, temp3.yz
MAD                temp3.y, temp3.yz, temp3.yz, temp5.yz
ADD                temp2.y, temp1.yw, (-0.116777,0,0,0)
DIV                temp2.y, temp2.yw, temp2.yw
ADD                temp1.y, temp1.yw, (0.883223,0,0,0)
DIV                temp1.y, temp1.yw, temp2.yw
MUL                temp1.y, temp1.yw, temp2.yw
ADD                temp2.y, temp2.yw, (-0.03,0,0,0)
DIV                temp2.y, temp2.yw, temp2.yw
MUL                temp1.y, temp1.yw, temp2.yw
ADD                temp2.y, temp2.yw, (0.97,0,0,0)
DIV                temp2.y, temp2.yw, temp2.yw
MUL                temp1.y, temp1.yw, temp2.yw
MAD                temp2.y, temp4.yz, (0.5,0.5,0.5,0), temp3.yz
MUL                temp3.y, temp1.yz, temp2.yz
MOV                temp4.y, cb4[9].yw
MOV                temp4.y, cb4[10].yw
MOV                temp4.y, cb4[11].yw
DP3                temp2.y, temp0.yz, temp4.yz
ADD                temp4.y, input3.yz, cb3[25].yz
DP3                temp3.y, temp4.yz, temp4.yz
SQRT               temp3.y, temp3.yw
ADD                temp3.y, temp2.yw, temp3.yw
MAD                temp2.y, cb3[25].yw, temp3.yw, temp2.yw
MAD                temp2.y, temp2.yw, cb3[24].yw, cb3[24].yw
EQ                 temp3.y, cb6[0].yw, (1,0,0,0)
IF                 temp3.yw
EQ                 temp3.y, cb6[0].yw, (1,0,0,0)
MUL                temp4.y, input3.yz, cb6[2].yz
MAD                temp4.y, cb6[1].yz, input3.yz, temp4.yz
MAD                temp4.y, cb6[3].yz, input3.yz, temp4.yz
ADD                temp4.y, temp4.yz, cb6[4].yz
MOVC               temp4.y, temp3.yz, temp4.yz, input3.yz
ADD                temp4.y, temp4.yz, cb6[6].yz
MUL                temp4.y, temp4.yz, cb6[5].yz
MAD                temp3.y, temp4.yw, (0.25,0,0.75,0)
MAD                temp4.y, cb6[0].yw, (0.5,0,0.75,0)
MAX                temp4.y, temp3.yw, temp4.yw
SAMPLE             temp4.y, temp4.yz, resou5.yz, sampl1.-
ELSE               
MOV                temp4.y, (1,1,1,1)
ENDIF              
DP4                temp3.y, temp4.yz, cb2[46].yz
DIV                temp4.y, input4.yz, input4.yz
SAMPLE             temp4.y, temp4.yz, resou2.yz, sampl2.-
ADD                temp3.y, temp3.yw, temp4.yw
MAD                temp2.y, temp2.yw, temp3.yw, temp4.yw
ADD                temp3.y, cb0[4].yw, (1,0,0,0)
DP3                temp4.y, temp1.yz, input2.yz
ADD                temp4.y, temp4.yw, temp4.yw
MAD                temp4.y, input2.yz, temp4.yz, temp1.yz
MUL                temp5.y, temp2.yz, cb0[2].yz
LT                 temp2.y, (0,0,0,0)
IF                 temp2.yw
DP3                temp2.y, temp4.yz, temp4.yz
RSQ                temp2.y, temp2.yw
MUL                temp6.y, temp2.yz, temp4.yz
ADD                temp7.y, input3.yz, cb5[0].yz
DIV                temp7.y, temp7.yz, temp6.yz
ADD                temp8.y, input3.yz, cb5[1].yz
DIV                temp8.y, temp8.yz, temp6.yz
LT                 temp9.y, (0,0,0,0), temp6.yz
MOVC               temp7.y, temp9.yz, temp7.yz, temp8.yz
MIN                temp2.y, temp7.yw, temp7.yw
MIN                temp2.y, temp7.yw, temp2.yw
ADD                temp7.y, input3.yz, cb5[2].yz
MAD                temp6.y, temp6.yz, temp2.yz, temp7.yz
ELSE               
MOV                temp6.y, temp4.yz
ENDIF              
MAD                temp2.y, temp3.yw, (0.7,0,1.7,0)
MUL                temp2.y, temp2.yw, temp3.yw
MUL                temp2.y, temp2.yw, (6,0,0,0)
SAMPLE_LOD         temp6.y, temp6.yz, resou3.yz, sampl0.-, temp2.yw
ADD                temp4.y, temp6.yw, (-1,0,0,0)
MAD                temp4.y, cb5[3].yw, temp4.yw, (1,0,0,0)
LOG                temp4.y, temp4.yw
MUL                temp4.y, temp4.yw, cb5[3].yw
EXP                temp4.y, temp4.yw
MUL                temp4.y, temp4.yw, cb5[3].yw
MUL                temp7.y, temp6.yz, temp4.yz
LT                 temp5.y, cb5[1].yw, (0.99999,0,0,0)
IF                 temp5.yw
LT                 temp5.y, (0,0,0,0)
IF                 temp5.yw
DP3                temp5.y, temp4.yz, temp4.yz
RSQ                temp5.y, temp5.yw
MUL                temp8.y, temp4.yz, temp5.yz
ADD                temp9.y, input3.yz, cb5[4].yz
DIV                temp9.y, temp9.yz, temp8.yz
ADD                temp10.y, input3.yz, cb5[5].yz
DIV                temp10.y, temp10.yz, temp8.yz
LT                 temp11.y, (0,0,0,0), temp8.yz
MOVC               temp9.y, temp11.yz, temp9.yz, temp10.yz
MIN                temp5.y, temp9.yw, temp9.yw
MIN                temp5.y, temp9.yw, temp5.yw
ADD                temp9.y, input3.yz, cb5[6].yz
MAD                temp4.y, temp8.yz, temp5.yz, temp9.yz
ENDIF              
SAMPLE_LOD         temp8.y, temp4.yz, resou4.yz, sampl0.-, temp2.yw
ADD                temp2.y, temp8.yw, (-1,0,0,0)
MAD                temp2.y, cb5[7].yw, temp2.yw, (1,0,0,0)
LOG                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb5[7].yw
EXP                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb5[7].yw
MUL                temp4.y, temp8.yz, temp2.yz
MAD                temp6.y, temp4.yz, temp6.yz, temp4.yz
MAD                temp7.y, cb5[1].yz, temp6.yz, temp4.yz
ENDIF              
DP3                temp2.y, input2.yz, input2.yz
RSQ                temp2.y, temp2.yw
MUL                temp4.y, temp2.yz, input2.yz
MAD                temp2.y, temp1.yz, temp2.yz, (-0.04,-0.04,-0.04,0)
MAD                temp2.y, cb0[4].yz, temp2.yz, (0.04,0.04,0.04,0)
MAD                temp1.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp3.y, temp1.yz, temp3.yz
MAD                temp0.y, temp0.yz, temp0.yz, cb2[0].yz
DP3                temp0.y, temp0.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0.001,0,0,0)
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
DP3                temp0.y, temp4.yz, temp1.yz
DP3                temp1.y, temp4.yz, cb2[0].yz
DP3                temp1.y, temp4.yz, temp0.yz
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
DP3                temp1.y, temp2.yz, temp2.yz
NE                 temp1.y, temp1.yw, (0,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp1.yw, cb0[4].yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp4.y, temp0.yz, temp5.yz
MUL                temp5.y, temp5.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp6.y, temp2.yz, (1,1,1,0)
MAD                temp0.y, temp6.yz, temp0.yz, temp2.yz
MUL                temp0.y, temp0.yz, temp5.yz
MAD                temp0.y, temp3.yz, temp4.yz, temp0.yz
MUL                temp3.y, temp7.yz, temp0.yz
ADD                temp1.y, temp2.yz, temp1.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp2.yz
MAD                outpu0.y, temp3.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
