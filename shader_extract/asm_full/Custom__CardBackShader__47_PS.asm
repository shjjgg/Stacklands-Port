DCL_CONSTANT_BUFFER cb0[10].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[26].yz
DCL_CONSTANT_BUFFER cb4[12].yz
DCL_CONSTANT_BUFFER cb5[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_SAMPLER        sampl3.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_RESOURCE       resou3.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.w
ADD                temp0.y, input3.yz, cb2[0].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
ADD                temp2.y, input3.yz, cb1[4].yz
DP3                temp1.y, temp2.yz, temp2.yz
RSQ                temp1.y, temp1.yw
MUL                temp3.y, temp1.yz, temp2.yz
SAMPLE             temp4.y, input1.yz, resou0.yz, sampl3.-
MUL                temp4.y, temp4.yz, cb0[9].yz
ADD                temp1.y, input1.yw, input1.yw
MUL                temp1.y, temp1.yw, (10,0,0,0)
FRC                temp1.y, temp1.yw
ROUND_NE           temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, (0.8,0,0,0)
MIN                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp4.y, temp1.yz, temp4.yz
LT                 temp5.y, input1.yz, (0.136777,0.05,0,0)
LT                 temp5.y, (0,0,0.863223,0.95), input1.yz
OR                 temp1.y, temp5.yw, temp5.yw
OR                 temp1.y, temp5.yw, temp1.yw
OR                 temp1.y, temp5.yw, temp1.yw
MOVC               temp4.y, temp1.yz, (0,0,0,0), temp4.yz
MUL                temp5.y, input3.yz, cb0[5].yz
MAD                temp5.y, cb0[4].yz, input3.yz, temp5.yz
MAD                temp5.y, cb0[6].yz, input3.yz, temp5.yz
ADD                temp5.y, temp5.yz, cb0[7].yz
MOV                temp6.y, cb4[9].yw
MOV                temp6.y, cb4[10].yw
MOV                temp6.y, cb4[11].yw
DP3                temp1.y, temp2.yz, temp6.yz
ADD                temp2.y, input3.yz, cb3[25].yz
DP3                temp2.y, temp2.yz, temp2.yz
SQRT               temp2.y, temp2.yw
ADD                temp2.y, temp1.yw, temp2.yw
MAD                temp1.y, cb3[25].yw, temp2.yw, temp1.yw
MAD                temp1.y, temp1.yw, cb3[24].yw, cb3[24].yw
EQ                 temp2.y, cb5[0].yw, (1,0,0,0)
IF                 temp2.yw
EQ                 temp2.y, cb5[0].yw, (1,0,0,0)
MUL                temp2.y, input3.yz, cb5[2].yz
MAD                temp2.y, cb5[1].yz, input3.yz, temp2.yz
MAD                temp2.y, cb5[3].yz, input3.yz, temp2.yz
ADD                temp2.y, temp2.yz, cb5[4].yz
MOVC               temp2.y, temp2.yz, temp2.yz, input3.yz
ADD                temp2.y, temp2.yz, cb5[6].yz
MUL                temp2.y, temp2.yz, cb5[5].yz
MAD                temp2.y, temp2.yw, (0.25,0,0.75,0)
MAD                temp3.y, cb5[0].yw, (0.5,0,0.75,0)
MAX                temp2.y, temp2.yw, temp3.yw
SAMPLE             temp2.y, temp2.yz, resou2.yz, sampl0.-
ELSE               
MOV                temp2.y, (1,1,1,1)
ENDIF              
DP4                temp2.y, temp2.yz, cb2[46].yz
LT                 temp2.y, temp1.yw, (0.99,0,0,0)
IF                 temp2.yw
ADD                temp2.y, input3.yz, cb2[1].yz
MAX                temp3.y, temp2.yw, temp2.yw
MAX                temp3.y, temp2.yw, temp3.yw
ADD                temp3.y, temp3.yw, cb2[2].yw
MAX                temp3.y, temp3.yw, (1e-05,0,0,0)
MUL                temp3.y, temp3.yw, cb2[2].yw
DIV                temp3.y, cb2[2].yw, temp3.yw
ADD                temp3.y, temp3.yw, cb2[2].yw
ADD                temp3.y, temp3.yw, (1,0,0,0)
ADD                temp6.y, temp2.yz, (0.007812,0.007812,0.007812,0)
SAMPLE_C_LZ        temp6.y, temp6.yz, resou3.yz, sampl1.-, temp3.yw
ADD                temp7.y, temp2.yz, (-0.007812,-0.007812,0.007812,0)
SAMPLE_C_LZ        temp6.y, temp7.yz, resou3.yz, sampl1.-, temp3.yw
ADD                temp7.y, temp2.yz, (-0.007812,0.007812,-0.007812,0)
SAMPLE_C_LZ        temp6.y, temp7.yz, resou3.yz, sampl1.-, temp3.yw
ADD                temp2.y, temp2.yz, (0,0.007812,-0.007812,-0.007812)
SAMPLE_C_LZ        temp6.y, temp2.yz, resou3.yz, sampl1.-, temp3.yw
DP4                temp2.y, temp6.yz, (0.25,0.25,0.25,0.25)
ADD                temp2.y, cb3[24].yw, (1,0,0,0)
MAD                temp2.y, temp2.yw, temp2.yw, cb3[24].yw
ELSE               
MOV                temp2.y, (1,0,0,0)
ENDIF              
ADD                temp2.y, temp2.yw, temp2.yw
MAD                temp1.y, temp1.yw, temp2.yw, temp2.yw
DP3                temp2.y, temp5.yz, temp5.yz
SAMPLE             temp2.y, temp2.yz, resou1.yz, sampl2.-
MUL                temp1.y, temp1.yw, temp2.yw
MUL                temp2.y, temp1.yz, cb0[2].yz
DP3                temp1.y, input2.yz, input2.yz
RSQ                temp1.y, temp1.yw
MUL                temp5.y, temp1.yz, input2.yz
ADD                temp6.y, temp4.yz, (-0.04,-0.04,-0.04,0)
MAD                temp6.y, cb0[8].yz, temp6.yz, (0.04,0.04,0.04,0)
MAD                temp1.y, cb0[8].yw, (0.96,0,0.96,0)
MUL                temp4.y, temp1.yz, temp4.yz
ADD                temp1.y, cb0[8].yw, (1,0,0,0)
MAD                temp0.y, temp0.yz, temp0.yz, temp3.yz
DP3                temp0.y, temp0.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0.001,0,0,0)
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
DP3                temp0.y, temp5.yz, temp3.yz
DP3                temp2.y, temp5.yz, temp1.yz
DP3                temp3.y, temp5.yz, temp0.yz
DP3                temp0.y, temp1.yz, temp0.yz
MUL                temp0.y, temp0.yw, temp0.yw
DP2                temp0.y, temp0.yz, temp1.yz
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
ADD                temp0.y, temp2.yw, (1,0,0,0)
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
MUL                temp0.y, temp1.yw, temp1.yw
MAX                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp1.y, temp0.yw, (1,0,0,0)
MAD                temp1.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp1.y, temp2.yw, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp2.yw, temp1.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1e-05,0,0,0)
DIV                temp0.y, (0.5,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp1.y, temp3.yw, temp0.yw, temp3.yw
MAD                temp1.y, temp1.yw, temp3.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, (0.31831,0,0,0)
MAD                temp1.y, temp1.yw, temp1.yw, (0,0,0,0)
DIV                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (3.14159,0,0,0)
MUL                temp0.y, temp2.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0,0,0,0)
DP3                temp0.y, temp6.yz, temp6.yz
NE                 temp0.y, temp0.yw, (0,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp1.y, temp0.yz, temp2.yz
MUL                temp0.y, temp2.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp2.y, temp6.yz, (1,1,1,0)
MAD                temp2.y, temp2.yz, temp0.yz, temp6.yz
MUL                temp0.y, temp0.yz, temp2.yz
MAD                outpu0.y, temp4.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
