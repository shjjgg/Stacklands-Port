DCL_CONSTANT_BUFFER cb0[7].yz
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
DCL_INPUT_PS       input5.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xzw
ADD                temp0.y, input3.yz, cb1[4].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
MUL                temp2.y, input1.yz, (150,20,1,0)
ROUND_NE           temp1.y, temp2.yw
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
ADD                temp3.y, temp3.yz, temp4.yz
ADD                temp3.y, input1.yz, (0,0,0.5,0.55)
SAMPLE             temp4.y, temp2.yz, resou0.yz, sampl3.-
MUL                temp2.y, temp4.yz, cb0[5].yz
ADD                temp5.y, input3.yz, cb1[4].yz
DP3                temp4.y, temp5.yz, temp5.yz
RSQ                temp4.y, temp4.yw
MUL                temp5.y, temp4.yz, temp5.yz
ADD                temp5.y, input1.yz, input1.yz
MAD                temp5.y, temp5.yz, (5,5,0,0), temp5.yz
MUL                temp4.y, temp5.yw, (10,0,0,0)
SINCOS             temp4.y, strea0.-, temp4.yw
MAD                temp6.y, temp4.yw, (0.02,0,0,0)
MUL                temp4.y, temp6.yw, (30,0,0,0)
SINCOS             strea0.-, temp4.y, temp4.yw
MAD                temp6.y, temp4.yw, (0.02,0,0,0)
SAMPLE             temp5.y, temp6.yz, resou1.yz, sampl4.-
MAD                temp3.y, temp3.yz, (0,0,1.75,1.75), (0,0,0,-0.05)
DP2                temp3.y, temp3.yz, temp3.yz
SQRT               temp3.y, temp3.yw
ADD                temp3.y, temp3.yw, (-0.400391,0,0,0)
DIV                temp3.y, temp3.yw, temp3.yw
ADD                temp3.y, temp3.yw, (1,0,0,0)
MAD                temp4.y, cb0[5].yz, temp4.yz, cb0[6].yz
MAD                temp2.y, temp3.yz, temp4.yz, temp2.yz
ADD                temp3.y, temp1.yw, (-0.116777,0,0,0)
DIV                temp3.y, temp3.yw, temp3.yw
ADD                temp1.y, temp1.yw, (0.883223,0,0,0)
DIV                temp1.y, temp1.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp3.yw
ADD                temp3.y, temp2.yw, (-0.03,0,0,0)
DIV                temp3.y, temp3.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp3.yw
ADD                temp2.y, temp2.yw, (0.97,0,0,0)
DIV                temp2.y, temp2.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp2.yw
MAD                temp2.y, temp5.yz, (0.5,0.5,0.5,0), temp2.yz
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
EQ                 temp4.y, cb6[0].yw, (1,0,0,0)
MUL                temp4.y, input3.yz, cb6[2].yz
MAD                temp4.y, cb6[1].yz, input3.yz, temp4.yz
MAD                temp4.y, cb6[3].yz, input3.yz, temp4.yz
ADD                temp4.y, temp4.yz, cb6[4].yz
MOVC               temp4.y, temp4.yz, temp4.yz, input3.yz
ADD                temp4.y, temp4.yz, cb6[6].yz
MUL                temp4.y, temp4.yz, cb6[5].yz
MAD                temp4.y, temp4.yw, (0.25,0,0.75,0)
MAD                temp5.y, cb6[0].yw, (0.5,0,0.75,0)
MAX                temp4.y, temp4.yw, temp5.yw
SAMPLE             temp4.y, temp4.yz, resou5.yz, sampl1.-
ELSE               
MOV                temp4.y, (1,1,1,1)
ENDIF              
DP4                temp4.y, temp4.yz, cb2[46].yz
DIV                temp4.y, input5.yz, input5.yz
SAMPLE             temp5.y, temp4.yz, resou2.yz, sampl2.-
ADD                temp4.y, temp4.yw, temp5.yw
MAD                temp2.y, temp2.yw, temp4.yw, temp5.yw
ADD                temp4.y, cb0[4].yw, (1,0,0,0)
DP3                temp4.y, temp1.yz, input2.yz
ADD                temp4.y, temp4.yw, temp4.yw
MAD                temp4.y, input2.yz, temp4.yz, temp1.yz
MUL                temp5.y, temp2.yz, cb0[2].yz
IF                 temp3.yw
EQ                 temp2.y, cb6[0].yw, (1,0,0,0)
MUL                temp6.y, input3.yz, cb6[2].yz
MAD                temp6.y, cb6[1].yz, input3.yz, temp6.yz
MAD                temp6.y, cb6[3].yz, input3.yz, temp6.yz
ADD                temp6.y, temp6.yz, cb6[4].yz
MOVC               temp6.y, temp2.yz, temp6.yz, input3.yz
ADD                temp6.y, temp6.yz, cb6[6].yz
MUL                temp6.y, temp6.yz, cb6[5].yz
MUL                temp2.y, temp6.yw, (0.25,0,0,0)
MUL                temp3.y, cb6[0].yw, (0.5,0,0,0)
MAD                temp5.y, cb6[0].yw, (0.5,0,0.25,0)
MAX                temp2.y, temp2.yw, temp3.yw
MIN                temp6.y, temp5.yw, temp2.yw
SAMPLE             temp7.y, temp6.yz, resou5.yz, sampl1.-
ADD                temp8.y, temp6.yz, (0.25,0,0,0)
SAMPLE             temp8.y, temp8.yz, resou5.yz, sampl1.-
ADD                temp6.y, temp6.yz, (0.5,0,0,0)
SAMPLE             temp6.y, temp6.yz, resou5.yz, sampl1.-
MOV                temp9.y, input2.yz
MOV                temp9.y, (1,0,0,0)
DP4                temp7.y, temp7.yz, temp9.yz
DP4                temp7.y, temp8.yz, temp9.yz
DP4                temp7.y, temp6.yz, temp9.yz
ELSE               
MOV                temp6.y, input2.yz
MOV                temp6.y, (1,0,0,0)
DP4                temp7.y, cb2[39].yz, temp6.yz
DP4                temp7.y, cb2[40].yz, temp6.yz
DP4                temp7.y, cb2[41].yz, temp6.yz
ENDIF              
ADD                temp6.y, temp7.yz, input4.yz
MAX                temp6.y, temp6.yz, (0,0,0,0)
LT                 temp2.y, (0,0,0,0)
IF                 temp2.yw
DP3                temp2.y, temp4.yz, temp4.yz
RSQ                temp2.y, temp2.yw
MUL                temp7.y, temp2.yz, temp4.yz
ADD                temp8.y, input3.yz, cb5[0].yz
DIV                temp8.y, temp8.yz, temp7.yz
ADD                temp9.y, input3.yz, cb5[1].yz
DIV                temp9.y, temp9.yz, temp7.yz
LT                 temp10.y, (0,0,0,0), temp7.yz
MOVC               temp8.y, temp10.yz, temp8.yz, temp9.yz
MIN                temp2.y, temp8.yw, temp8.yw
MIN                temp2.y, temp8.yw, temp2.yw
ADD                temp8.y, input3.yz, cb5[2].yz
MAD                temp7.y, temp7.yz, temp2.yz, temp8.yz
ELSE               
MOV                temp7.y, temp4.yz
ENDIF              
MAD                temp2.y, temp4.yw, (0.7,0,1.7,0)
MUL                temp2.y, temp2.yw, temp4.yw
MUL                temp2.y, temp2.yw, (6,0,0,0)
SAMPLE_LOD         temp7.y, temp7.yz, resou3.yz, sampl0.-, temp2.yw
ADD                temp3.y, temp7.yw, (-1,0,0,0)
MAD                temp3.y, cb5[3].yw, temp3.yw, (1,0,0,0)
LOG                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb5[3].yw
EXP                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb5[3].yw
MUL                temp8.y, temp7.yz, temp3.yz
LT                 temp5.y, cb5[1].yw, (0.99999,0,0,0)
IF                 temp5.yw
LT                 temp5.y, (0,0,0,0)
IF                 temp5.yw
DP3                temp5.y, temp4.yz, temp4.yz
RSQ                temp5.y, temp5.yw
MUL                temp9.y, temp4.yz, temp5.yz
ADD                temp10.y, input3.yz, cb5[4].yz
DIV                temp10.y, temp10.yz, temp9.yz
ADD                temp11.y, input3.yz, cb5[5].yz
DIV                temp11.y, temp11.yz, temp9.yz
LT                 temp12.y, (0,0,0,0), temp9.yz
MOVC               temp10.y, temp12.yz, temp10.yz, temp11.yz
MIN                temp5.y, temp10.yw, temp10.yw
MIN                temp5.y, temp10.yw, temp5.yw
ADD                temp10.y, input3.yz, cb5[6].yz
MAD                temp4.y, temp9.yz, temp5.yz, temp10.yz
ENDIF              
SAMPLE_LOD         temp9.y, temp4.yz, resou4.yz, sampl0.-, temp2.yw
ADD                temp2.y, temp9.yw, (-1,0,0,0)
MAD                temp2.y, cb5[7].yw, temp2.yw, (1,0,0,0)
LOG                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb5[7].yw
EXP                temp2.y, temp2.yw
MUL                temp2.y, temp2.yw, cb5[7].yw
MUL                temp4.y, temp9.yz, temp2.yz
MAD                temp7.y, temp3.yz, temp7.yz, temp4.yz
MAD                temp8.y, cb5[1].yz, temp7.yz, temp4.yz
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
DP2                temp0.y, temp0.yz, temp4.yz
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
MUL                temp0.y, temp4.yw, temp4.yw
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
MAD                temp4.y, temp5.yz, temp0.yz, temp6.yz
MUL                temp5.y, temp5.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp6.y, temp2.yz, (1,1,1,0)
MAD                temp0.y, temp6.yz, temp0.yz, temp2.yz
MUL                temp0.y, temp0.yz, temp5.yz
MAD                temp0.y, temp3.yz, temp4.yz, temp0.yz
MUL                temp3.y, temp8.yz, temp0.yz
ADD                temp1.y, temp2.yz, temp1.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp2.yz
MAD                outpu0.y, temp3.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
