DCL_CONSTANT_BUFFER cb0[17].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_SAMPLER        sampl3.-
DCL_SAMPLER        sampl4.-
DCL_SAMPLER        sampl5.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_RESOURCE       resou3.-, immed0.xz
DCL_RESOURCE       resou4.-, immed0.xz
DCL_RESOURCE       resou5.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.yw
ADD                temp0.y, input3.yz, cb1[4].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
MUL                temp1.y, input1.yw, (150,0,0,0)
ROUND_NE           temp1.y, temp1.yw
SINCOS             temp1.y, strea0.-, temp1.yw
MUL                temp1.y, temp1.yw, (43758.5,0,0,0)
FRC                temp1.y, temp1.yw
MAD                temp2.y, temp1.yw, (0.005,0,0,0)
MUL                temp2.y, temp2.yz, (0,0,150,10)
ROUND_NE           temp1.y, temp2.yw
SINCOS             temp1.y, strea0.-, temp1.yw
MUL                temp1.y, temp1.yw, (43758.5,0,0,0)
FRC                temp1.y, temp1.yw
MAD                temp2.y, temp1.yw, (0.005,0,0,0)
DERIV_RTX          temp3.y, temp2.yz
DERIV_RTY          temp3.y, temp2.yz
ADD                temp3.y, temp3.yz, temp3.yz
ADD                temp3.y, input1.yz, (0,0,1,1)
LT                 temp4.y, (0.5,0.5,0,0), cb0[16].yz
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
MUL                temp1.y, temp3.yw, temp4.yw
MUL                temp1.y, temp3.yw, temp1.yw
SAMPLE             temp5.y, temp6.yz, resou0.yz, sampl2.-
SAMPLE             temp7.y, temp6.yz, resou1.yz, sampl4.-
MAD                temp1.y, temp1.yw, temp4.yw, (1,0,0,0)
MAD                temp3.y, temp1.yz, temp5.yz, temp5.yz
MAD                temp4.y, temp1.yz, temp7.yz, temp7.yz
ADD                temp5.y, input3.yz, cb1[4].yz
DP3                temp1.y, temp5.yz, temp5.yz
RSQ                temp1.y, temp1.yw
MUL                temp5.y, temp1.yz, temp5.yz
ADD                temp5.y, input1.yz, input1.yz
MAD                temp5.y, temp5.yz, (5,5,0,0), temp5.yz
MUL                temp1.y, temp5.yw, (10,0,0,0)
SINCOS             temp1.y, strea0.-, temp1.yw
MAD                temp7.y, temp1.yw, (0.02,0,0,0)
MUL                temp1.y, temp7.yw, (30,0,0,0)
SINCOS             strea0.-, temp1.y, temp1.yw
MAD                temp7.y, temp1.yw, (0.02,0,0,0)
SAMPLE             temp7.y, temp7.yz, resou2.yz, sampl3.-
MAD                temp1.y, cb1[0].yw, (2,0,0,0)
MUL                temp1.y, temp1.yw, (0.02,0,0,0)
FRC                temp1.y, temp1.yw
GE                 temp1.y, temp1.yw, (0.99,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
LT                 temp5.y, (0.5,0.5,0,0), cb0[14].yz
MAD                temp8.y, temp1.yz, cb0[16].yz, cb0[9].yz
MOVC               temp8.y, temp5.yz, temp8.yz, cb0[9].yz
ADD                temp5.y, temp6.yz, (0,0,0,-0.5)
DP2                temp1.y, temp5.yz, temp5.yz
SQRT               temp1.y, temp1.yw
MAX                temp2.y, temp5.yw, temp5.yw
MOVC               temp1.y, temp4.yw, temp2.yw, temp1.yw
ADD                temp1.y, temp1.yw, (-0.400391,0,0,0)
DIV                temp1.y, temp1.yw, temp3.yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
ADD                temp6.y, temp8.yz, cb0[10].yz
MAD                temp6.y, temp1.yz, temp6.yz, temp8.yz
GE                 temp1.y, temp2.yw, (0.2,0,0,0)
MOVC               temp1.y, temp1.yw, (0,0,1,0)
ADD                temp8.y, temp6.yz, cb0[10].yz
MAD                temp6.y, temp1.yz, temp8.yz, temp6.yz
ADD                temp1.y, temp3.yw, (1,0,0,0)
ADD                temp8.y, cb0[9].yz, cb0[13].yz
MAD                temp9.y, temp1.yz, temp8.yz, cb0[9].yz
ADD                temp9.y, temp6.yz, temp9.yz
MAD                temp6.y, temp3.yz, temp9.yz, temp6.yz
NE                 temp3.y, (0,0,0,0), cb0[16].yz
OR                 temp1.y, temp3.yw, temp3.yw
ADD                temp2.y, temp4.yw, (1,0,0,0)
MAD                temp4.y, temp2.yz, temp8.yz, cb0[9].yz
ADD                temp4.y, temp6.yz, temp4.yz
MAD                temp4.y, temp4.yz, temp4.yz, temp6.yz
MOVC               temp4.y, temp1.yz, temp4.yz, temp6.yz
MAD                temp3.y, temp3.yz, (0,0,0.5,0.5), (0,0,0.19,0.21)
ADD                temp5.y, temp2.yz, temp3.yz
MAD                temp3.y, temp3.yz, (0,0,0.5,0.5), temp3.yz
ADD                temp3.y, temp3.yz, (0,0,0.19,0.21)
DIV                temp3.y, temp5.yz, temp3.yz
ADD                temp1.y, temp3.yw, (1,0,0,0)
MAD                temp1.y, temp3.yw, temp1.yw, (1,0,0,0)
ADD                temp3.y, temp2.yz, (0,0,-0.116777,-0.03)
DIV                temp3.y, temp3.yz, temp3.yz
ADD                temp5.y, temp2.yz, (0,0,0.883223,0.97)
DIV                temp5.y, temp5.yz, temp3.yz
MUL                temp2.y, temp3.yw, temp5.yw
MUL                temp2.y, temp3.yw, temp2.yw
MUL                temp2.y, temp5.yw, temp2.yw
MUL                temp1.y, temp1.yw, temp2.yw
MUL                temp2.y, temp2.yw, (10,0,0,0)
FRC                temp3.y, temp2.yw
MAD                temp3.y, temp3.yw, (2,0,-1,0)
ADD                temp3.y, temp3.yw, (-0.5,0,0,0)
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, temp3.yw
FRC                temp3.y, temp2.yw
MAD                temp3.y, temp3.yw, (2,0,-1,0)
ADD                temp3.y, temp3.yw, (-0.5,0,0,0)
SINCOS             temp2.y, strea0.-, temp2.yw
MUL                temp2.y, temp2.yw, temp3.yw
MAD                temp6.y, temp2.yw, (0.02,0,0,0)
MAD                temp6.y, temp2.yw, (0.02,0,0,0)
ADD                temp2.y, temp6.yz, (0,0,-0.089777,-0.003)
DIV                temp2.y, temp2.yz, temp3.yz
ADD                temp3.y, temp6.yz, (0,0,0.910223,0.997)
DIV                temp3.y, temp3.yz, temp3.yz
MUL                temp2.y, temp2.yw, temp3.yw
MUL                temp2.y, temp2.yw, temp2.yw
MAD                temp2.y, temp2.yw, temp3.yw, (-0.1,0,0,0)
LT                 temp2.y, temp2.yw, (0,0,0,0)
AND                temp2.y, temp5.yw, temp2.yw
DISCARD            temp2.yw
MAD                temp3.y, temp7.yz, cb0[16].yz, temp4.yz
MOVC               temp3.y, temp5.yz, temp3.yz, temp4.yz
ADD                temp3.y, temp3.yz, cb0[11].yz
MAD                temp3.y, temp1.yz, temp3.yz, cb0[11].yz
NE                 temp1.y, (0,0,0,0), cb0[14].yw
IF                 temp1.yw
MOVC               temp2.y, temp5.yz, temp6.yz, temp2.yz
SAMPLE             temp2.y, temp2.yz, resou3.yz, sampl5.-
GE                 temp1.y, temp2.yw, (0.5,0,0,0)
AND                temp1.y, temp1.yw, (1,0,0,0)
MUL                temp2.y, temp3.yz, (-0.4,-0.4,-0.4,0)
MAD                temp3.y, temp1.yz, temp2.yz, temp3.yz
ENDIF              
MUL                temp2.y, input3.yz, cb0[5].yz
MAD                temp2.y, cb0[4].yz, input3.yz, temp2.yz
MAD                temp2.y, cb0[6].yz, input3.yz, temp2.yz
ADD                temp2.y, temp2.yz, cb0[7].yz
EQ                 temp1.y, cb3[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp1.y, cb3[0].yw, (1,0,0,0)
MUL                temp4.y, input3.yz, cb3[2].yz
MAD                temp4.y, cb3[1].yz, input3.yz, temp4.yz
MAD                temp4.y, cb3[3].yz, input3.yz, temp4.yz
ADD                temp4.y, temp4.yz, cb3[4].yz
MOVC               temp4.y, temp1.yz, temp4.yz, input3.yz
ADD                temp4.y, temp4.yz, cb3[6].yz
MUL                temp4.y, temp4.yz, cb3[5].yz
MAD                temp1.y, temp4.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb3[0].yw, (0.5,0,0.75,0)
MAX                temp4.y, temp1.yw, temp2.yw
SAMPLE             temp4.y, temp4.yz, resou5.yz, sampl0.-
ELSE               
MOV                temp4.y, (1,1,1,1)
ENDIF              
DP4                temp1.y, temp4.yz, cb2[46].yz
SAMPLE             temp2.y, temp2.yz, resou4.yz, sampl1.-
MUL                temp1.y, temp1.yw, temp2.yw
MUL                temp2.y, temp1.yz, cb0[2].yz
DP3                temp1.y, input2.yz, input2.yz
RSQ                temp1.y, temp1.yw
MUL                temp4.y, temp1.yz, input2.yz
ADD                temp5.y, temp3.yz, (-0.04,-0.04,-0.04,0)
MAD                temp5.y, cb0[8].yz, temp5.yz, (0.04,0.04,0.04,0)
MAD                temp1.y, cb0[8].yw, (0.96,0,0.96,0)
MUL                temp3.y, temp1.yz, temp3.yz
ADD                temp1.y, cb0[8].yw, (1,0,0,0)
MAD                temp0.y, temp0.yz, temp0.yz, cb2[0].yz
DP3                temp0.y, temp0.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0.001,0,0,0)
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
DP3                temp0.y, temp4.yz, temp1.yz
DP3                temp1.y, temp4.yz, cb2[0].yz
DP3                temp1.y, temp4.yz, temp0.yz
DP3                temp0.y, cb2[0].yz, temp0.yz
ADD                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp1.yw, (-0.5,0,0,0)
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
MUL                temp0.y, temp1.yw, temp1.yw
MAX                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp1.y, temp0.yw, (1,0,0,0)
MAD                temp1.y, temp0.yw, temp1.yw, temp0.yw
MAD                temp1.y, temp1.yw, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
MAD                temp0.y, temp1.yw, temp1.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1e-05,0,0,0)
DIV                temp0.y, (0.5,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp1.y, temp1.yw, temp0.yw, temp1.yw
MAD                temp1.y, temp1.yw, temp1.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, (0.31831,0,0,0)
MAD                temp1.y, temp1.yw, temp1.yw, (0,0,0,0)
DIV                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, (3.14159,0,0,0)
MUL                temp0.y, temp1.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0,0,0,0)
DP3                temp0.y, temp5.yz, temp5.yz
NE                 temp0.y, temp0.yw, (0,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp1.y, temp0.yz, temp2.yz
MUL                temp0.y, temp2.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp2.y, temp5.yz, (1,1,1,0)
MAD                temp2.y, temp2.yz, temp0.yz, temp5.yz
MUL                temp0.y, temp0.yz, temp2.yz
MAD                outpu0.y, temp3.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
