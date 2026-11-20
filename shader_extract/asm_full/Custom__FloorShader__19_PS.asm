DCL_CONSTANT_BUFFER cb0[18].yz
DCL_CONSTANT_BUFFER cb1[47].yz
DCL_CONSTANT_BUFFER cb2[4].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_SAMPLER        sampl3.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_RESOURCE       resou3.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xz
ADD                temp0.y, cb0[14].yw, cb0[15].yw
MAD                temp0.y, cb0[14].yw, (0.58,0,0,0)
ADD                temp1.y, input2.yz, cb2[3].yz
MUL                temp0.y, temp1.yw, (600,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp2.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp2.yw, (300,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp2.y, temp0.yw, (0.005,0,0,0)
MUL                temp1.y, temp2.yz, (1.5,1.5,600,0)
SAMPLE             temp3.y, temp1.yz, resou0.yz, sampl3.-
MOV                temp3.y, temp3.yz
MOV                temp2.y, input2.yw
MOV                temp0.y, cb0[15].yw
ADD                temp1.y, temp0.yz, temp2.yz
MAX                temp1.y, temp1.yz, (0,0,0,0)
DP3                temp1.y, temp1.yz, temp1.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, cb0[15].yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
ADD                temp4.y, temp0.yz, (0.03,0.03,0.03,0)
ADD                temp0.y, cb0[15].yw, (0.03,0,0,0)
ADD                temp2.y, temp2.yz, temp4.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
DP3                temp0.y, temp2.yz, temp2.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1,0,0,0)
ROUND_NE           temp0.y, temp1.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yz, (0,0.005,0.002,0), input2.yz
MAD                temp0.y, temp0.yw, (0.002,0,0,0)
ADD                temp0.y, temp0.yw, (1,0,0,0)
GE                 temp0.y, (0.5,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp2.y, cb0[9].yz, (1,1,1,0)
MAD                temp2.y, temp0.yz, temp2.yz, cb0[9].yz
DERIV_RTX          temp0.y, temp1.yw
DERIV_RTY          temp0.y, temp1.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.5,0,0.5,0)
ADD                temp1.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, (0.5,-0,0,0)
ADD                temp0.y, temp0.yw, (0.5,0,0,0)
DIV                temp0.y, temp1.yw, temp0.yw
MAD                temp3.y, cb0[10].yz, temp3.yz, temp2.yz
MAD                temp2.y, temp0.yz, temp3.yz, temp2.yz
ADD                temp3.y, temp0.yz, (-0.9,-0.91,-0.89,0)
GE                 temp0.y, temp1.yw, temp3.yw
GE                 temp0.y, temp1.yw, (0.5,0,0,0)
AND                temp0.y, temp0.yz, (0,0,1,1)
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp4.y, temp2.yz, cb0[12].yz
MAD                temp2.y, temp0.yz, temp4.yz, temp2.yz
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
ADD                temp1.y, temp1.yz, temp3.yz
DIV                temp0.y, temp1.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yz, temp2.yz, temp2.yz
ADD                temp1.y, cb0[17].yw, (0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp1.yw, temp0.yw
DIV                temp1.y, temp1.yw, temp0.yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
DIV                temp0.y, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp0.yz, cb0[11].yz
MAD                temp0.y, temp0.yz, temp1.yz, temp0.yz
MUL                temp1.y, input2.yz, cb0[5].yz
MAD                temp1.y, cb0[4].yz, input2.yz, temp1.yz
MAD                temp1.y, cb0[6].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb0[7].yz
EQ                 temp0.y, cb3[0].yw, (1,0,0,0)
IF                 temp0.yw
EQ                 temp0.y, cb3[0].yw, (1,0,0,0)
MUL                temp2.y, input2.yz, cb3[2].yz
MAD                temp2.y, cb3[1].yz, input2.yz, temp2.yz
MAD                temp2.y, cb3[3].yz, input2.yz, temp2.yz
ADD                temp2.y, temp2.yz, cb3[4].yz
MOVC               temp2.y, temp0.yz, temp2.yz, input2.yz
ADD                temp2.y, temp2.yz, cb3[6].yz
MUL                temp2.y, temp2.yz, cb3[5].yz
MAD                temp0.y, temp2.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb3[0].yw, (0.5,0,0.75,0)
MAX                temp2.y, temp0.yw, temp2.yw
SAMPLE             temp2.y, temp2.yz, resou3.yz, sampl0.-
ELSE               
MOV                temp2.y, (1,1,1,1)
ENDIF              
DP4                temp0.y, temp2.yz, cb1[46].yz
LT                 temp2.y, (0,0,0,0)
AND                temp2.y, temp2.yw, (1,0,0,0)
DIV                temp2.y, temp1.yz, temp1.yz
ADD                temp2.y, temp2.yz, (0,0.5,0.5,0)
SAMPLE             temp3.y, temp2.yz, resou1.yz, sampl1.-
MUL                temp1.y, temp2.yw, temp3.yw
DP3                temp1.y, temp1.yz, temp1.yz
SAMPLE             temp2.y, temp1.yz, resou2.yz, sampl2.-
MUL                temp1.y, temp1.yw, temp2.yw
MUL                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yz, temp0.yz
MUL                outpu0.y, temp0.yz, cb0[2].yz
MOV                outpu0.y, ()
RET                
