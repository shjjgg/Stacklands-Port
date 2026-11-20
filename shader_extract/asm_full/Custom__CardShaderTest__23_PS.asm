DCL_CONSTANT_BUFFER cb0[13].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[26].yz
DCL_CONSTANT_BUFFER cb4[12].yz
DCL_CONSTANT_BUFFER cb5[8].yz
DCL_CONSTANT_BUFFER cb6[7].yz
DCL_CONSTANT_BUFFER cb7[1].yz
DCL_CONSTANT_BUFFER cb8[14].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_SAMPLER        sampl3.-
DCL_SAMPLER        sampl4.-
DCL_SAMPLER        sampl5.-
DCL_SAMPLER        sampl6.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_RESOURCE       resou3.-, immed0.xz
DCL_RESOURCE       resou4.-, immed0.xz
DCL_RESOURCE       resou5.-, immed0.xz
DCL_RESOURCE       resou6.-, immed0.xz
DCL_RESOURCE       resou7.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_INPUT_PS       input4.y
DCL_INPUT_PS       input5.y
DCL_INPUT_PS       input7.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.zw
IADD               temp0.y, input7.yw, cb7[0].yw
ADD                temp0.y, input3.yz, cb1[4].yz
DP3                temp1.y, temp0.yz, temp0.yz
RSQ                temp1.y, temp1.yw
MUL                temp1.y, temp0.yz, temp1.yz
MUL                temp2.y, input1.yw, (150,0,0,0)
ROUND_NE           temp2.y, temp2.yw
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, (43758.5,0,0,0)
FRC                temp2.y, temp2.yw
MAD                temp2.y, temp2.yw, (0.005,0,0,0)
MUL                temp2.y, temp2.yz, (0,0,150,10)
ROUND_NE           temp2.y, temp2.yw
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, (43758.5,0,0,0)
FRC                temp2.y, temp2.yw
MAD                temp2.y, temp2.yw, (0.005,0,0,0)
DERIV_RTX          temp3.y, temp2.yz
DERIV_RTY          temp3.y, temp2.yz
ADD                temp3.y, temp3.yz, temp3.yz
ADD                temp3.y, input1.yz, (0,0,1,1)
LT                 temp4.y, (0.5,0.5,0,0), cb0[12].yz
MOVC               temp5.y, temp4.yz, (0.5,2,0.55,0), (0.45,1.75,0.5,0)
MOV                temp5.y, (2,0,0,0)
MOVC               temp5.y, temp4.yz, temp5.yz, temp5.yz
MOV                temp5.y, (0.5,0,0,0)
ADD                temp3.y, temp3.yz, temp5.yz
MUL                temp6.y, temp5.yw, temp3.yw
MAD                temp6.y, temp3.yz, temp5.yz, temp5.yz
GE                 temp3.y, temp6.yz, (0,0,0,0)
AND                temp3.y, temp3.yz, (0,0,1,1)
GE                 temp4.y, (0,1,1,0), temp6.yz
AND                temp4.y, temp4.yz, (0,1,1,0)
MUL                temp2.y, temp3.yw, temp4.yw
MUL                temp2.y, temp3.yw, temp2.yw
SAMPLE             temp5.y, temp6.yz, resou0.yz, sampl3.-
SAMPLE             temp7.y, temp6.yz, resou1.yz, sampl5.-
MAD                temp2.y, temp2.yw, temp4.yw, (1,0,0,0)
MAD                temp3.y, temp2.yz, temp5.yz, temp5.yz
MAD                temp4.y, temp2.yz, temp7.yz, temp7.yz
ADD                temp5.y, input3.yz, cb1[4].yz
DP3                temp2.y, temp5.yz, temp5.yz
RSQ                temp2.y, temp2.yw
MUL                temp5.y, temp2.yz, temp5.yz
ADD                temp5.y, input1.yz, input1.yz
MAD                temp5.y, temp5.yz, (5,5,0,0), temp5.yz
MUL                temp2.y, temp5.yw, (10,0,0,0)
SINCOS             temp2.y, strea0.-, temp2.yw
MAD                temp7.y, temp2.yw, (0.02,0,0,0)
MUL                temp2.y, temp7.yw, (30,0,0,0)
SINCOS             strea0.-, temp2.y, temp2.yw
MAD                temp7.y, temp2.yw, (0.02,0,0,0)
SAMPLE             temp7.y, temp7.yz, resou2.yz, sampl4.-
MAD                temp2.y, cb1[0].yw, (2,0,0,0)
MUL                temp2.y, temp2.yw, (0.02,0,0,0)
FRC                temp2.y, temp2.yw
GE                 temp2.y, temp2.yw, (0.99,0,0,0)
AND                temp2.y, temp2.yw, (1,0,0,0)
LT                 temp5.y, (0.5,0.5,0,0), cb0[10].yz
MAD                temp8.y, temp2.yz, cb0[12].yz, cb0[5].yz
MOVC               temp8.y, temp5.yz, temp8.yz, cb0[5].yz
ADD                temp5.y, temp6.yz, (0,0,0,-0.5)
DP2                temp2.y, temp5.yz, temp5.yz
SQRT               temp2.y, temp2.yw
MAX                temp4.y, temp5.yw, temp5.yw
MOVC               temp2.y, temp4.yw, temp4.yw, temp2.yw
ADD                temp2.y, temp2.yw, (-0.400391,0,0,0)
DIV                temp2.y, temp2.yw, temp3.yw
ADD                temp2.y, temp2.yw, (1,0,0,0)
ADD                temp6.y, temp8.yz, cb0[6].yz
MAD                temp6.y, temp2.yz, temp6.yz, temp8.yz
GE                 temp2.y, temp2.yw, (0.2,0,0,0)
MOVC               temp2.y, temp2.yw, (0,0,1,0)
ADD                temp8.y, temp6.yz, cb0[6].yz
MAD                temp6.y, temp2.yz, temp8.yz, temp6.yz
ADD                temp2.y, temp3.yw, (1,0,0,0)
ADD                temp8.y, cb0[5].yz, cb0[9].yz
MAD                temp9.y, temp2.yz, temp8.yz, cb0[5].yz
ADD                temp9.y, temp6.yz, temp9.yz
MAD                temp6.y, temp3.yz, temp9.yz, temp6.yz
NE                 temp3.y, (0,0,0,0), cb0[12].yz
OR                 temp2.y, temp3.yw, temp3.yw
ADD                temp3.y, temp4.yw, (1,0,0,0)
MAD                temp4.y, temp3.yz, temp8.yz, cb0[5].yz
ADD                temp4.y, temp6.yz, temp4.yz
MAD                temp4.y, temp4.yz, temp4.yz, temp6.yz
MOVC               temp4.y, temp2.yz, temp4.yz, temp6.yz
MAD                temp3.y, temp3.yz, (0,0,0.5,0.5), (0,0,0.19,0.21)
ADD                temp5.y, temp2.yz, temp3.yz
MAD                temp3.y, temp3.yz, (0,0,0.5,0.5), temp3.yz
ADD                temp3.y, temp3.yz, (0,0,0.19,0.21)
DIV                temp3.y, temp5.yz, temp3.yz
ADD                temp2.y, temp3.yw, (1,0,0,0)
MAD                temp2.y, temp3.yw, temp2.yw, (1,0,0,0)
ADD                temp3.y, temp2.yz, (0,0,-0.116777,-0.03)
DIV                temp3.y, temp3.yz, temp3.yz
ADD                temp5.y, temp2.yz, (0,0,0.883223,0.97)
DIV                temp5.y, temp5.yz, temp3.yz
MUL                temp3.y, temp3.yw, temp5.yw
MUL                temp3.y, temp3.yw, temp3.yw
MUL                temp3.y, temp5.yw, temp3.yw
MUL                temp2.y, temp2.yw, temp3.yw
MUL                temp3.y, temp2.yw, (10,0,0,0)
FRC                temp3.y, temp3.yw
MAD                temp3.y, temp3.yw, (2,0,-1,0)
ADD                temp3.y, temp3.yw, (-0.5,0,0,0)
SINCOS             temp3.y, strea0.-, temp3.yw
MUL                temp3.y, temp3.yw, temp3.yw
FRC                temp3.y, temp2.yw
MAD                temp3.y, temp3.yw, (2,0,-1,0)
ADD                temp3.y, temp3.yw, (-0.5,0,0,0)
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, temp3.yw
MAD                temp6.y, temp3.yw, (0.02,0,0,0)
MAD                temp6.y, temp2.yw, (0.02,0,0,0)
ADD                temp3.y, temp6.yz, (0,0,-0.089777,-0.003)
DIV                temp3.y, temp3.yz, temp3.yz
ADD                temp5.y, temp6.yz, (0,0,0.910223,0.997)
DIV                temp3.y, temp5.yz, temp3.yz
MUL                temp2.y, temp3.yw, temp3.yw
MUL                temp2.y, temp3.yw, temp2.yw
MAD                temp2.y, temp2.yw, temp3.yw, (-0.1,0,0,0)
LT                 temp2.y, temp2.yw, (0,0,0,0)
AND                temp2.y, temp5.yw, temp2.yw
DISCARD            temp2.yw
MAD                temp3.y, temp7.yz, cb0[12].yz, temp4.yz
MOVC               temp3.y, temp5.yz, temp3.yz, temp4.yz
ADD                temp3.y, temp3.yz, cb0[7].yz
MAD                temp3.y, temp2.yz, temp3.yz, cb0[7].yz
NE                 temp2.y, (0,0,0,0), cb0[10].yw
IF                 temp2.yw
MOVC               temp2.y, temp5.yz, temp6.yz, temp2.yz
SAMPLE             temp2.y, temp2.yz, resou3.yz, sampl6.-
GE                 temp2.y, temp2.yw, (0.5,0,0,0)
AND                temp2.y, temp2.yw, (1,0,0,0)
MUL                temp2.y, temp3.yz, (0,-0.4,-0.4,-0.4)
MAD                temp3.y, temp2.yz, temp2.yz, temp3.yz
ENDIF              
MOV                temp2.y, cb4[9].yw
MOV                temp2.y, cb4[10].yw
MOV                temp2.y, cb4[11].yw
DP3                temp2.y, temp0.yz, temp2.yz
ADD                temp2.y, input3.yz, cb3[25].yz
DP3                temp2.y, temp2.yz, temp2.yz
SQRT               temp2.y, temp2.yw
ADD                temp2.y, temp2.yw, temp2.yw
MAD                temp2.y, cb3[25].yw, temp2.yw, temp2.yw
MAD                temp2.y, temp2.yw, cb3[24].yw, cb3[24].yw
IMUL               strea0.-, temp0.y, temp0.yw, (0,0,0,0)
EQ                 temp2.y, cb6[0].yw, (1,0,0,0)
IF                 temp2.yw
EQ                 temp2.y, cb6[0].yw, (1,0,0,0)
MUL                temp4.y, input3.yz, cb6[2].yz
MAD                temp4.y, cb6[1].yz, input3.yz, temp4.yz
MAD                temp4.y, cb6[3].yz, input3.yz, temp4.yz
ADD                temp4.y, temp4.yz, cb6[4].yz
MOVC               temp4.y, temp2.yz, temp4.yz, input3.yz
ADD                temp4.y, temp4.yz, cb6[6].yz
MUL                temp4.y, temp4.yz, cb6[5].yz
MAD                temp2.y, temp4.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb6[0].yw, (0.5,0,0.75,0)
MAX                temp4.y, temp2.yw, temp2.yw
SAMPLE             temp4.y, temp4.yz, resou7.yz, sampl1.-
ELSE               
MOV                temp4.y, cb8[6].yz, temp0.yw
ENDIF              
DP4                temp2.y, temp4.yz, cb2[46].yz
DIV                temp4.y, input5.yz, input5.yz
SAMPLE             temp4.y, temp4.yz, resou4.yz, sampl2.-
ADD                temp2.y, temp2.yw, temp4.yw
MAD                temp2.y, temp2.yw, temp2.yw, temp4.yw
ADD                temp2.y, cb0[4].yw, (1,0,0,0)
DP3                temp2.y, temp1.yz, input2.yz
ADD                temp2.y, temp2.yw, temp2.yw
MAD                temp4.y, input2.yz, temp2.yz, temp1.yz
MUL                temp5.y, temp2.yz, cb0[2].yz
IF                 temp2.yw
EQ                 temp2.y, cb6[0].yw, (1,0,0,0)
MUL                temp6.y, input3.yz, cb6[2].yz
MAD                temp6.y, cb6[1].yz, input3.yz, temp6.yz
MAD                temp6.y, cb6[3].yz, input3.yz, temp6.yz
ADD                temp6.y, temp6.yz, cb6[4].yz
MOVC               temp2.y, temp2.yz, temp6.yz, input3.yz
ADD                temp2.y, temp2.yz, cb6[6].yz
MUL                temp6.y, temp2.yz, cb6[5].yz
MUL                temp2.y, temp6.yw, (0.25,0,0,0)
MUL                temp2.y, cb6[0].yw, (0.5,0,0,0)
MAD                temp2.y, cb6[0].yw, (0.5,0,0.25,0)
MAX                temp2.y, temp2.yw, temp2.yw
MIN                temp6.y, temp2.yw, temp2.yw
SAMPLE             temp7.y, temp6.yz, resou7.yz, sampl1.-
ADD                temp2.y, temp6.yz, (0.25,0,0,0)
SAMPLE             temp8.y, temp2.yz, resou7.yz, sampl1.-
ADD                temp2.y, temp6.yz, (0.5,0,0,0)
SAMPLE             temp6.y, temp2.yz, resou7.yz, sampl1.-
MOV                temp9.y, input2.yz
MOV                temp9.y, (1,0,0,0)
DP4                temp7.y, temp7.yz, temp9.yz
DP4                temp7.y, temp8.yz, temp9.yz
DP4                temp7.y, temp6.yz, temp9.yz
ELSE               
MOV                temp6.y, input2.yz
MOV                temp6.y, (1,0,0,0)
DP4                temp7.y, cb8[1048586].yz, temp0.-, temp6.yz
DP4                temp7.y, cb8[1].yz, temp0.yw, temp6.yz
DP4                temp7.y, cb8[2].yz, temp0.yw, temp6.yz
ENDIF              
ADD                temp2.y, temp7.yz, input4.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
LT                 temp0.y, (0,0,0,0)
IF                 temp0.yw
DP3                temp0.y, temp4.yz, temp4.yz
RSQ                temp0.y, temp0.yw
MUL                temp6.y, temp0.yz, temp4.yz
ADD                temp7.y, input3.yz, cb5[0].yz
DIV                temp7.y, temp7.yz, temp6.yz
ADD                temp8.y, input3.yz, cb5[1].yz
DIV                temp8.y, temp8.yz, temp6.yz
LT                 temp9.y, (0,0,0,0), temp6.yz
MOVC               temp7.y, temp9.yz, temp7.yz, temp8.yz
MIN                temp0.y, temp7.yw, temp7.yw
MIN                temp0.y, temp7.yw, temp0.yw
ADD                temp7.y, input3.yz, cb5[2].yz
MAD                temp6.y, temp6.yz, temp0.yz, temp7.yz
ELSE               
MOV                temp6.y, temp4.yz
ENDIF              
MAD                temp0.y, temp2.yw, (0.7,0,1.7,0)
MUL                temp0.y, temp0.yw, temp2.yw
MUL                temp0.y, temp0.yw, (6,0,0,0)
SAMPLE_LOD         temp6.y, temp6.yz, resou5.yz, sampl0.-, temp0.yw
ADD                temp3.y, temp6.yw, (-1,0,0,0)
MAD                temp3.y, cb5[3].yw, temp3.yw, (1,0,0,0)
LOG                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb5[3].yw
EXP                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb5[3].yw
MUL                temp7.y, temp6.yz, temp3.yz
LT                 temp4.y, cb5[1].yw, (0.99999,0,0,0)
IF                 temp4.yw
LT                 temp4.y, (0,0,0,0)
IF                 temp4.yw
DP3                temp4.y, temp4.yz, temp4.yz
RSQ                temp4.y, temp4.yw
MUL                temp8.y, temp4.yz, temp4.yz
ADD                temp9.y, input3.yz, cb5[4].yz
DIV                temp9.y, temp9.yz, temp8.yz
ADD                temp10.y, input3.yz, cb5[5].yz
DIV                temp10.y, temp10.yz, temp8.yz
LT                 temp11.y, (0,0,0,0), temp8.yz
MOVC               temp9.y, temp11.yz, temp9.yz, temp10.yz
MIN                temp4.y, temp9.yw, temp9.yw
MIN                temp4.y, temp9.yw, temp4.yw
ADD                temp9.y, input3.yz, cb5[6].yz
MAD                temp4.y, temp8.yz, temp4.yz, temp9.yz
ENDIF              
SAMPLE_LOD         temp4.y, temp4.yz, resou6.yz, sampl0.-, temp0.yw
ADD                temp0.y, temp4.yw, (-1,0,0,0)
MAD                temp0.y, cb5[7].yw, temp0.yw, (1,0,0,0)
LOG                temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb5[7].yw
EXP                temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb5[7].yw
MUL                temp4.y, temp4.yz, temp0.yz
MAD                temp6.y, temp3.yz, temp6.yz, temp4.yz
MAD                temp7.y, cb5[1].yz, temp6.yz, temp4.yz
ENDIF              
DP3                temp0.y, input2.yz, input2.yz
RSQ                temp0.y, temp0.yw
MUL                temp4.y, temp0.yz, input2.yz
ADD                temp6.y, temp3.yz, (-0.04,-0.04,-0.04,0)
MAD                temp6.y, cb0[4].yz, temp6.yz, (0.04,0.04,0.04,0)
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp3.y, temp0.yz, temp3.yz
MAD                temp0.y, temp0.yz, temp1.yz, cb2[0].yz
DP3                temp1.y, temp0.yz, temp0.yz
MAX                temp1.y, temp1.yw, (0.001,0,0,0)
RSQ                temp1.y, temp1.yw
MUL                temp0.y, temp0.yz, temp1.yz
DP3                temp1.y, temp4.yz, temp1.yz
DP3                temp1.y, temp4.yz, cb2[0].yz
DP3                temp1.y, temp4.yz, temp0.yz
DP3                temp0.y, cb2[0].yz, temp0.yz
ADD                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp2.yw, (-0.5,0,0,0)
ADD                temp0.y, temp1.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
ADD                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp3.y, temp1.yw, temp1.yw
MUL                temp3.y, temp3.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp3.yw
MAD                temp0.y, temp0.yw, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp1.yw, temp0.yw
MUL                temp0.y, temp2.yw, temp2.yw
MAX                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp2.y, temp0.yw, (1,0,0,0)
MAD                temp3.y, temp1.yw, temp2.yw, temp0.yw
MAD                temp2.y, temp1.yw, temp2.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp2.yw
MAD                temp1.y, temp1.yw, temp3.yw, temp1.yw
ADD                temp1.y, temp1.yw, (1e-05,0,0,0)
DIV                temp1.y, (0.5,0,0,0)
MUL                temp2.y, temp0.yw, temp0.yw
MAD                temp3.y, temp1.yw, temp2.yw, temp1.yw
MAD                temp1.y, temp3.yw, temp1.yw, (1,0,0,0)
MUL                temp2.y, temp2.yw, (0.31831,0,0,0)
MAD                temp1.y, temp1.yw, temp1.yw, (0,0,0,0)
DIV                temp1.y, temp2.yw, temp1.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp1.y, temp1.yw, (3.14159,0,0,0)
MUL                temp1.y, temp1.yw, temp1.yw
MAX                temp1.y, temp1.yw, (0,0,0,0)
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
DIV                temp0.y, (1,1,1,1), temp0.yw
DP3                temp1.y, temp6.yz, temp6.yz
NE                 temp1.y, temp1.yw, (0,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp1.y, temp1.yw, temp1.yw
ADD                temp0.y, temp0.yw, cb0[4].yw
ADD                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp2.y, temp5.yz, temp0.yz, temp2.yz
MUL                temp1.y, temp5.yz, temp1.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp4.y, temp6.yz, (1,1,1,0)
MAD                temp4.y, temp4.yz, temp0.yz, temp6.yz
MUL                temp1.y, temp1.yz, temp4.yz
MAD                temp1.y, temp3.yz, temp2.yz, temp1.yz
MUL                temp0.y, temp7.yz, temp0.yz
ADD                temp2.y, temp6.yz, temp0.yz
MAD                temp2.y, temp1.yz, temp2.yz, temp6.yz
MAD                outpu0.y, temp0.yz, temp2.yz, temp1.yz
MOV                outpu0.y, ()
RET                
