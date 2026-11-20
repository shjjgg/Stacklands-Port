DCL_CONSTANT_BUFFER cb0[9].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.yz
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
SAMPLE             temp5.y, temp3.yz, resou0.yz, sampl1.-
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
SAMPLE             temp4.y, temp5.yz, resou1.yz, sampl2.-
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
EQ                 temp2.y, cb3[0].yw, (1,0,0,0)
IF                 temp2.yw
EQ                 temp2.y, cb3[0].yw, (1,0,0,0)
MUL                temp4.y, input3.yz, cb3[2].yz
MAD                temp4.y, cb3[1].yz, input3.yz, temp4.yz
MAD                temp4.y, cb3[3].yz, input3.yz, temp4.yz
ADD                temp4.y, temp4.yz, cb3[4].yz
MOVC               temp4.y, temp2.yz, temp4.yz, input3.yz
ADD                temp4.y, temp4.yz, cb3[6].yz
MUL                temp4.y, temp4.yz, cb3[5].yz
MAD                temp2.y, temp4.yw, (0.25,0,0.75,0)
MAD                temp3.y, cb3[0].yw, (0.5,0,0.75,0)
MAX                temp4.y, temp2.yw, temp3.yw
SAMPLE             temp4.y, temp4.yz, resou2.yz, sampl0.-
ELSE               
MOV                temp4.y, (1,1,1,1)
ENDIF              
DP4                temp2.y, temp4.yz, cb2[46].yz
MUL                temp4.y, temp2.yz, cb0[2].yz
DP3                temp2.y, input2.yz, input2.yz
RSQ                temp2.y, temp2.yw
MUL                temp5.y, temp2.yz, input2.yz
MAD                temp2.y, temp1.yz, temp2.yz, (-0.04,-0.04,-0.04,0)
MAD                temp2.y, cb0[4].yz, temp2.yz, (0.04,0.04,0.04,0)
MAD                temp1.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp3.y, temp1.yz, temp3.yz
ADD                temp1.y, cb0[4].yw, (1,0,0,0)
MAD                temp0.y, temp0.yz, temp0.yz, cb2[0].yz
DP3                temp0.y, temp0.yz, temp0.yz
MAX                temp0.y, temp0.yw, (0.001,0,0,0)
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
DP3                temp0.y, temp5.yz, temp1.yz
DP3                temp1.y, temp5.yz, cb2[0].yz
DP3                temp1.y, temp5.yz, temp0.yz
DP3                temp0.y, cb2[0].yz, temp0.yz
MUL                temp0.y, temp0.yw, temp0.yw
DP2                temp0.y, temp0.yz, temp1.yz
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
DP3                temp0.y, temp2.yz, temp2.yz
NE                 temp0.y, temp0.yw, (0,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp1.y, temp0.yz, temp4.yz
MUL                temp0.y, temp4.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp4.y, temp2.yz, (1,1,1,0)
MAD                temp2.y, temp4.yz, temp0.yz, temp2.yz
MUL                temp0.y, temp0.yz, temp2.yz
MAD                outpu0.y, temp3.yz, temp1.yz, temp0.yz
MOV                outpu0.y, ()
RET                
