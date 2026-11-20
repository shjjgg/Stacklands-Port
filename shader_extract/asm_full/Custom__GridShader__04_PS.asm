DCL_CONSTANT_BUFFER cb0[7].yz
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
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xyw
ADD                temp0.y, input2.yz, cb1[4].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
DIV                temp2.y, input2.yz, cb0[6].yz
FRC                temp2.y, temp2.yz
ADD                temp2.y, temp2.yz, (0.5,0.5,0,0)
GE                 temp2.y, temp2.yz, temp2.yz
FRC                temp2.y, temp2.yz
MOVC               temp2.y, temp2.yz, temp2.yz, temp2.yz
ADD                temp1.y, cb0[6].yw, (-0.01,0,0,0)
ADD                temp2.y, temp1.yz, temp2.yz
MUL                temp2.y, temp2.yz, (0,0,50,50)
MAD                temp3.y, temp2.yz, (-2,-2,0,0), (3,3,0,0)
MUL                temp2.y, temp2.yz, temp2.yz
MUL                temp2.y, temp2.yz, temp3.yz
MUL                temp2.y, temp2.yw, temp2.yw
ADD                temp2.y, temp2.yz, (1,1,0,0)
ADD                temp2.y, temp1.yz, temp2.yz
MUL                temp2.y, temp2.yz, (50,50,0,0)
MAD                temp3.y, temp2.yz, (-2,-2,0,0), (3,3,0,0)
MUL                temp2.y, temp2.yz, temp2.yz
MUL                temp2.y, temp2.yz, temp3.yz
MUL                temp1.y, temp2.yw, temp2.yw
MAD                temp1.y, temp1.yw, temp2.yw, (1,0,0,0)
MUL                temp1.y, temp1.yw, cb0[6].yw
MUL                temp1.y, temp1.yw, (0.5,0,0,0)
EQ                 temp2.y, cb4[0].yw, (1,0,0,0)
IF                 temp2.yw
EQ                 temp2.y, cb4[0].yw, (1,0,0,0)
MUL                temp3.y, input2.yz, cb4[2].yz
MAD                temp3.y, cb4[1].yz, input2.yz, temp3.yz
MAD                temp3.y, cb4[3].yz, input2.yz, temp3.yz
ADD                temp3.y, temp3.yz, cb4[4].yz
MOVC               temp2.y, temp2.yz, temp3.yz, input2.yz
ADD                temp2.y, temp2.yz, cb4[6].yz
MUL                temp3.y, temp2.yz, cb4[5].yz
MAD                temp2.y, temp3.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb4[0].yw, (0.5,0,0.75,0)
MAX                temp3.y, temp2.yw, temp2.yw
SAMPLE             temp3.y, temp3.yz, resou2.yz, sampl1.-
ELSE               
MOV                temp3.y, (1,1,1,1)
ENDIF              
DP4                temp2.y, temp3.yz, cb2[46].yz
ADD                temp2.y, cb0[4].yw, (1,0,0,0)
DP3                temp2.y, temp1.yz, input1.yz
ADD                temp2.y, temp2.yw, temp2.yw
MAD                temp3.y, input1.yz, temp2.yz, temp1.yz
MUL                temp4.y, temp2.yz, cb0[2].yz
IF                 temp2.yw
EQ                 temp2.y, cb4[0].yw, (1,0,0,0)
MUL                temp5.y, input2.yz, cb4[2].yz
MAD                temp5.y, cb4[1].yz, input2.yz, temp5.yz
MAD                temp5.y, cb4[3].yz, input2.yz, temp5.yz
ADD                temp5.y, temp5.yz, cb4[4].yz
MOVC               temp2.y, temp2.yz, temp5.yz, input2.yz
ADD                temp2.y, temp2.yz, cb4[6].yz
MUL                temp5.y, temp2.yz, cb4[5].yz
MUL                temp2.y, temp5.yw, (0.25,0,0,0)
MUL                temp2.y, cb4[0].yw, (0.5,0,0,0)
MAD                temp2.y, cb4[0].yw, (0.5,0,0.25,0)
MAX                temp2.y, temp2.yw, temp2.yw
MIN                temp5.y, temp2.yw, temp2.yw
SAMPLE             temp6.y, temp5.yz, resou2.yz, sampl1.-
ADD                temp2.y, temp5.yz, (0.25,0,0,0)
SAMPLE             temp7.y, temp2.yz, resou2.yz, sampl1.-
ADD                temp2.y, temp5.yz, (0.5,0,0,0)
SAMPLE             temp5.y, temp2.yz, resou2.yz, sampl1.-
MOV                temp8.y, input1.yz
MOV                temp8.y, (1,0,0,0)
DP4                temp6.y, temp6.yz, temp8.yz
DP4                temp6.y, temp7.yz, temp8.yz
DP4                temp6.y, temp5.yz, temp8.yz
ELSE               
MOV                temp5.y, input1.yz
MOV                temp5.y, (1,0,0,0)
DP4                temp6.y, cb2[39].yz, temp5.yz
DP4                temp6.y, cb2[40].yz, temp5.yz
DP4                temp6.y, cb2[41].yz, temp5.yz
ENDIF              
ADD                temp2.y, temp6.yz, input3.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
LT                 temp3.y, (0,0,0,0)
IF                 temp3.yw
DP3                temp3.y, temp3.yz, temp3.yz
RSQ                temp3.y, temp3.yw
MUL                temp5.y, temp3.yz, temp3.yz
ADD                temp6.y, input2.yz, cb3[0].yz
DIV                temp6.y, temp6.yz, temp5.yz
ADD                temp7.y, input2.yz, cb3[1].yz
DIV                temp7.y, temp7.yz, temp5.yz
LT                 temp8.y, (0,0,0,0), temp5.yz
MOVC               temp6.y, temp8.yz, temp6.yz, temp7.yz
MIN                temp3.y, temp6.yw, temp6.yw
MIN                temp3.y, temp6.yw, temp3.yw
ADD                temp6.y, input2.yz, cb3[2].yz
MAD                temp5.y, temp5.yz, temp3.yz, temp6.yz
ELSE               
MOV                temp5.y, temp3.yz
ENDIF              
MAD                temp3.y, temp2.yw, (0.7,0,1.7,0)
MUL                temp3.y, temp2.yw, temp3.yw
MUL                temp3.y, temp3.yw, (6,0,0,0)
SAMPLE_LOD         temp5.y, temp5.yz, resou0.yz, sampl0.-, temp3.yw
ADD                temp4.y, temp5.yw, (-1,0,0,0)
MAD                temp4.y, cb3[3].yw, temp4.yw, (1,0,0,0)
LOG                temp4.y, temp4.yw
MUL                temp4.y, temp4.yw, cb3[3].yw
EXP                temp4.y, temp4.yw
MUL                temp4.y, temp4.yw, cb3[3].yw
MUL                temp6.y, temp5.yz, temp4.yz
LT                 temp5.y, cb3[1].yw, (0.99999,0,0,0)
IF                 temp5.yw
LT                 temp5.y, (0,0,0,0)
IF                 temp5.yw
DP3                temp5.y, temp3.yz, temp3.yz
RSQ                temp5.y, temp5.yw
MUL                temp7.y, temp3.yz, temp5.yz
ADD                temp8.y, input2.yz, cb3[4].yz
DIV                temp8.y, temp8.yz, temp7.yz
ADD                temp9.y, input2.yz, cb3[5].yz
DIV                temp9.y, temp9.yz, temp7.yz
LT                 temp10.y, (0,0,0,0), temp7.yz
MOVC               temp8.y, temp10.yz, temp8.yz, temp9.yz
MIN                temp5.y, temp8.yw, temp8.yw
MIN                temp5.y, temp8.yw, temp5.yw
ADD                temp8.y, input2.yz, cb3[6].yz
MAD                temp3.y, temp7.yz, temp5.yz, temp8.yz
ENDIF              
SAMPLE_LOD         temp3.y, temp3.yz, resou1.yz, sampl0.-, temp3.yw
ADD                temp3.y, temp3.yw, (-1,0,0,0)
MAD                temp3.y, cb3[7].yw, temp3.yw, (1,0,0,0)
LOG                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb3[7].yw
EXP                temp3.y, temp3.yw
MUL                temp3.y, temp3.yw, cb3[7].yw
MUL                temp3.y, temp3.yz, temp3.yz
MAD                temp5.y, temp4.yz, temp5.yz, temp3.yz
MAD                temp6.y, cb3[1].yz, temp5.yz, temp3.yz
ENDIF              
DP3                temp3.y, input1.yz, input1.yz
RSQ                temp3.y, temp3.yw
MUL                temp3.y, temp3.yz, input1.yz
ADD                temp5.y, cb0[5].yz, (-0.04,-0.04,-0.04,0)
MAD                temp5.y, cb0[4].yz, temp5.yz, (0.04,0.04,0.04,0)
MAD                temp3.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp7.y, temp3.yz, cb0[5].yz
MUL                temp7.y, temp1.yz, temp7.yz
ADD                temp4.y, temp3.yw, (1,0,0,0)
MAD                outpu0.y, temp1.yw, temp3.yw, temp4.yw
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
DP2                temp0.y, temp0.yz, temp2.yz
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
ADD                temp0.y, temp1.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
ADD                temp1.y, temp0.yw, (1,0,0,0)
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp1.y, temp1.yw, temp1.yw
MAD                temp0.y, temp0.yw, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp2.yw, temp2.yw
MAX                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp1.y, temp0.yw, (1,0,0,0)
MAD                temp2.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp1.y, temp1.yw, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp1.yw, temp2.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1e-05,0,0,0)
DIV                temp0.y, (0.5,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MAD                temp2.y, temp1.yw, temp1.yw, temp1.yw
MAD                temp1.y, temp2.yw, temp1.yw, (1,0,0,0)
MUL                temp1.y, temp1.yw, (0.31831,0,0,0)
MAD                temp1.y, temp1.yw, temp1.yw, (0,0,0,0)
DIV                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, (3.14159,0,0,0)
MUL                temp0.y, temp1.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0,0,0,0)
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
DIV                temp0.y, (1,1,1,1), temp0.yw
DP3                temp1.y, temp5.yz, temp5.yz
NE                 temp1.y, temp1.yw, (0,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp4.yw, cb0[4].yw
MAD                temp2.y, temp4.yz, temp0.yz, temp2.yz
MUL                temp3.y, temp4.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp4.y, temp5.yz, (1,1,1,0)
MAD                temp0.y, temp4.yz, temp0.yz, temp5.yz
MUL                temp0.y, temp0.yz, temp3.yz
MAD                temp0.y, temp7.yz, temp2.yz, temp0.yz
MUL                temp2.y, temp6.yz, temp0.yz
ADD                temp1.y, temp5.yz, temp1.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp5.yz
MAD                outpu0.y, temp2.yz, temp1.yz, temp0.yz
RET                
