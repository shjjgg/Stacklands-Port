DCL_CONSTANT_BUFFER cb0[13].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_CONSTANT_BUFFER cb3[1].yz
DCL_CONSTANT_BUFFER cb4[14].yz
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
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_INPUT_PS       input5.y
DCL_INPUT_PS       input6.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.w
MUL                temp0.y, input1.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yz, (0,0,150,10)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
DERIV_RTX          temp1.y, temp0.yz
DERIV_RTY          temp1.y, temp0.yz
ADD                temp1.y, temp1.yz, temp1.yz
ADD                temp1.y, input1.yz, (0,0,1,1)
LT                 temp2.y, (0.5,0.5,0,0), cb0[12].yz
MOVC               temp3.y, temp2.yz, (0.5,2,0.55,0), (0.45,1.75,0.5,0)
MOV                temp3.y, (2,0,0,0)
MOVC               temp3.y, temp2.yz, temp3.yz, temp3.yz
MOV                temp3.y, (0.5,0,0,0)
ADD                temp1.y, temp1.yz, temp3.yz
MUL                temp4.y, temp3.yw, temp1.yw
MAD                temp4.y, temp1.yz, temp3.yz, temp3.yz
GE                 temp1.y, temp4.yz, (0,0,0,0)
AND                temp1.y, temp1.yz, (0,0,1,1)
GE                 temp2.y, (0,1,1,0), temp4.yz
AND                temp2.y, temp2.yz, (0,1,1,0)
MUL                temp0.y, temp1.yw, temp2.yw
MUL                temp0.y, temp1.yw, temp0.yw
SAMPLE             temp3.y, temp4.yz, resou0.yz, sampl1.-
SAMPLE             temp5.y, temp4.yz, resou1.yz, sampl3.-
MAD                temp0.y, temp0.yw, temp2.yw, (1,0,0,0)
MAD                temp1.y, temp0.yz, temp3.yz, temp3.yz
MAD                temp2.y, temp0.yz, temp5.yz, temp5.yz
ADD                temp3.y, input3.yz, cb1[4].yz
DP3                temp0.y, temp3.yz, temp3.yz
RSQ                temp0.y, temp0.yw
MUL                temp3.y, temp0.yz, temp3.yz
ADD                temp3.y, input1.yz, input1.yz
MAD                temp3.y, temp3.yz, (5,5,0,0), temp3.yz
MUL                temp0.y, temp3.yw, (10,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp5.y, temp0.yw, (0.02,0,0,0)
MUL                temp0.y, temp5.yw, (30,0,0,0)
SINCOS             strea0.-, temp0.y, temp0.yw
MAD                temp5.y, temp0.yw, (0.02,0,0,0)
SAMPLE             temp5.y, temp5.yz, resou2.yz, sampl2.-
MAD                temp0.y, cb1[0].yw, (2,0,0,0)
MUL                temp0.y, temp0.yw, (0.02,0,0,0)
FRC                temp0.y, temp0.yw
GE                 temp0.y, temp0.yw, (0.99,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
LT                 temp3.y, (0.5,0.5,0,0), cb0[10].yz
MAD                temp6.y, temp0.yz, cb0[12].yz, cb0[5].yz
MOVC               temp6.y, temp3.yz, temp6.yz, cb0[5].yz
ADD                temp3.y, temp4.yz, (0,0,0,-0.5)
DP2                temp0.y, temp3.yz, temp3.yz
SQRT               temp0.y, temp0.yw
MAX                temp2.y, temp3.yw, temp3.yw
MOVC               temp0.y, temp2.yw, temp2.yw, temp0.yw
ADD                temp0.y, temp0.yw, (-0.400391,0,0,0)
DIV                temp0.y, temp0.yw, temp1.yw
ADD                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp4.y, temp6.yz, cb0[6].yz
MAD                temp4.y, temp0.yz, temp4.yz, temp6.yz
GE                 temp0.y, temp0.yw, (0.2,0,0,0)
MOVC               temp0.y, temp0.yw, (0,0,1,0)
ADD                temp6.y, temp4.yz, cb0[6].yz
MAD                temp4.y, temp0.yz, temp6.yz, temp4.yz
ADD                temp0.y, temp1.yw, (1,0,0,0)
ADD                temp6.y, cb0[5].yz, cb0[9].yz
MAD                temp7.y, temp0.yz, temp6.yz, cb0[5].yz
ADD                temp7.y, temp4.yz, temp7.yz
MAD                temp4.y, temp1.yz, temp7.yz, temp4.yz
NE                 temp1.y, (0,0,0,0), cb0[12].yz
OR                 temp0.y, temp1.yw, temp1.yw
ADD                temp1.y, temp2.yw, (1,0,0,0)
MAD                temp2.y, temp1.yz, temp6.yz, cb0[5].yz
ADD                temp2.y, temp4.yz, temp2.yz
MAD                temp2.y, temp2.yz, temp2.yz, temp4.yz
MOVC               temp2.y, temp0.yz, temp2.yz, temp4.yz
MAD                temp1.y, temp1.yz, (0,0,0.5,0.5), (0,0,0.19,0.21)
ADD                temp3.y, temp0.yz, temp1.yz
MAD                temp1.y, temp1.yz, (0,0,0.5,0.5), temp1.yz
ADD                temp1.y, temp1.yz, (0,0,0.19,0.21)
DIV                temp1.y, temp3.yz, temp1.yz
ADD                temp0.y, temp1.yw, (1,0,0,0)
MAD                temp0.y, temp1.yw, temp0.yw, (1,0,0,0)
ADD                temp1.y, temp0.yz, (0,0,-0.116777,-0.03)
DIV                temp1.y, temp1.yz, temp1.yz
ADD                temp3.y, temp0.yz, (0,0,0.883223,0.97)
DIV                temp3.y, temp3.yz, temp1.yz
MUL                temp1.y, temp1.yw, temp3.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp1.y, temp3.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
MUL                temp1.y, temp0.yw, (10,0,0,0)
FRC                temp1.y, temp1.yw
MAD                temp1.y, temp1.yw, (2,0,-1,0)
ADD                temp1.y, temp1.yw, (-0.5,0,0,0)
SINCOS             temp1.y, strea0.-, temp1.yw
MUL                temp1.y, temp1.yw, temp1.yw
FRC                temp1.y, temp0.yw
MAD                temp1.y, temp1.yw, (2,0,-1,0)
ADD                temp1.y, temp1.yw, (-0.5,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp4.y, temp1.yw, (0.02,0,0,0)
MAD                temp4.y, temp0.yw, (0.02,0,0,0)
ADD                temp1.y, temp4.yz, (0,0,-0.089777,-0.003)
DIV                temp1.y, temp1.yz, temp1.yz
ADD                temp3.y, temp4.yz, (0,0,0.910223,0.997)
DIV                temp1.y, temp3.yz, temp1.yz
MUL                temp0.y, temp1.yw, temp1.yw
MUL                temp0.y, temp1.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp1.yw, (-0.1,0,0,0)
LT                 temp0.y, temp0.yw, (0,0,0,0)
AND                temp0.y, temp3.yw, temp0.yw
DISCARD            temp0.yw
MAD                temp1.y, temp5.yz, cb0[12].yz, temp2.yz
MOVC               temp1.y, temp3.yz, temp1.yz, temp2.yz
ADD                temp1.y, temp1.yz, cb0[7].yz
MAD                temp1.y, temp0.yz, temp1.yz, cb0[7].yz
NE                 temp0.y, (0,0,0,0), cb0[10].yw
IF                 temp0.yw
MOVC               temp0.y, temp3.yz, temp4.yz, temp0.yz
SAMPLE             temp0.y, temp0.yz, resou3.yz, sampl4.-
GE                 temp0.y, temp0.yw, (0.5,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp1.yz, (0,-0.4,-0.4,-0.4)
MAD                temp1.y, temp0.yz, temp0.yz, temp1.yz
ENDIF              
EQ                 temp0.y, cb2[0].yw, (1,0,0,0)
IF                 temp0.yw
EQ                 temp0.y, cb2[0].yw, (1,0,0,0)
MUL                temp0.y, input3.yz, cb2[2].yz
MAD                temp0.y, cb2[1].yz, input3.yz, temp0.yz
MAD                temp0.y, cb2[3].yz, input3.yz, temp0.yz
ADD                temp0.y, temp0.yz, cb2[4].yz
MOVC               temp0.y, temp0.yz, temp0.yz, input3.yz
ADD                temp0.y, temp0.yz, cb2[6].yz
MUL                temp0.y, temp0.yz, cb2[5].yz
MUL                temp0.y, temp0.yw, (0.25,0,0,0)
MUL                temp1.y, cb2[0].yw, (0.5,0,0,0)
MAD                temp2.y, cb2[0].yw, (0.5,0,0.25,0)
MAX                temp0.y, temp0.yw, temp1.yw
MIN                temp0.y, temp2.yw, temp0.yw
SAMPLE             temp2.y, temp0.yz, resou4.yz, sampl0.-
ADD                temp3.y, temp0.yz, (0.25,0,0,0)
SAMPLE             temp3.y, temp3.yz, resou4.yz, sampl0.-
ADD                temp0.y, temp0.yz, (0.5,0,0,0)
SAMPLE             temp0.y, temp0.yz, resou4.yz, sampl0.-
MOV                temp4.y, input2.yz
MOV                temp4.y, (1,0,0,0)
DP4                temp2.y, temp2.yz, temp4.yz
DP4                temp2.y, temp3.yz, temp4.yz
DP4                temp2.y, temp0.yz, temp4.yz
ELSE               
IADD               temp0.y, input6.yw, cb3[0].yw
IMUL               strea0.-, temp0.y, temp0.yw, (0,0,0,0)
MOV                temp3.y, input2.yz
MOV                temp3.y, (1,0,0,0)
DP4                temp2.y, cb4[1048586].yz, temp0.-, temp3.yz
DP4                temp2.y, cb4[1].yz, temp0.yw, temp3.yz
DP4                temp2.y, cb4[2].yz, temp0.yw, temp3.yz
ENDIF              
ADD                temp0.y, temp2.yz, input5.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
ADD                temp2.y, temp1.yz, (-0.04,-0.04,-0.04,0)
MAD                outpu1.y, cb0[4].yz, temp2.yz, (0.04,0.04,0.04,0)
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp1.y, temp0.yz, temp1.yz
MUL                outpu3.y, temp0.yz, temp1.yz
MOV                outpu0.y, temp1.yz
MOV                outpu0.y, (1,0,0,0)
MOV                outpu1.y, cb0[4].yw
MAD                outpu2.y, input2.yz, (0.5,0.5,0.5,0), (0.5,0.5,0.5,0)
MOV                outpu2.y, (1,0,0,0)
MOV                outpu3.y, ()
RET                
