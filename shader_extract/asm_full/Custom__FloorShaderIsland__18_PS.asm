DCL_CONSTANT_BUFFER cb0[17].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[4].yz
DCL_CONSTANT_BUFFER cb4[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xz
ADD                temp0.y, cb0[10].yw, cb0[11].yw
MAD                temp0.y, cb0[10].yw, (0.58,0,0,0)
ADD                temp1.y, input2.yz, cb3[3].yz
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
MOV                temp2.y, input2.yw
MOV                temp0.y, cb0[11].yw
ADD                temp1.y, temp0.yz, temp2.yz
MAX                temp1.y, temp1.yz, (0,0,0,0)
DP3                temp1.y, temp1.yz, temp1.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, cb0[11].yw
ADD                temp1.y, temp0.yz, (0,0.03,0.03,0.03)
ADD                temp2.y, cb0[11].yw, (0.03,0,0,0)
ADD                temp1.y, temp1.yz, temp2.yz
MAX                temp1.y, temp1.yz, (0,0,0,0)
DP3                temp1.y, temp1.yz, temp1.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp2.yw, temp1.yw
ADD                temp1.y, temp1.yz, (1,1,0,0)
MUL                temp3.y, temp2.yz, (600,0.1,0.1,0)
ROUND_NE           temp1.y, temp3.yw
SINCOS             temp1.y, strea0.-, temp1.yw
MUL                temp1.y, temp1.yw, (43758.5,0,0,0)
FRC                temp1.y, temp1.yw
ADD                temp1.y, temp1.yw, (-0.5,0,0,0)
MAD                temp1.y, temp1.yz, (0,0,0.005,0.002), input2.yz
MAD                temp0.y, temp0.yw, (0.002,0,0,0)
MAD                temp2.y, cb1[0].yz, (0,0.2,0,0.2), temp3.yz
SAMPLE             temp3.y, temp2.yz, resou0.yz, sampl1.-
MAD                temp2.y, temp3.yz, (0,2,0,2), (0,-1,0,-1)
MAD                temp2.y, temp2.yz, (0.1,0,0.1,0), temp2.yz
ADD                temp3.y, temp0.yz, (1,0,1,0)
MOV                temp2.y, input2.yw
ADD                temp3.y, temp2.yz, temp3.yz
MAX                temp3.y, temp3.yz, (0,0,0,0)
DP3                temp2.y, temp3.yz, temp3.yz
SQRT               temp2.y, temp2.yw
ADD                temp2.y, temp2.yw, (-0.5,0,0,0)
GE                 temp2.y, (0.3,0,0,0)
AND                temp2.y, temp2.yw, (1,0,0,0)
ADD                temp3.y, cb0[16].yz, (-1,-0,-0,0)
MAD                temp3.y, temp2.yz, temp3.yz, (1,0,0,0)
ADD                temp4.y, temp0.yz, (0.7,0,0.7,0)
ADD                temp4.y, temp2.yz, temp4.yz
MAX                temp4.y, temp4.yz, (0,0,0,0)
DP3                temp2.y, temp4.yz, temp4.yz
SQRT               temp2.y, temp2.yw
GE                 temp2.y, (0.5,0,0,0)
AND                temp2.y, temp2.yw, (1,0,0,0)
ADD                temp4.y, temp3.yz, (1,1,1,0)
MAD                temp3.y, temp2.yz, temp4.yz, temp3.yz
ADD                temp4.y, temp0.yz, (0.6,0,0.6,0)
ADD                temp2.y, temp2.yz, temp4.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
DP3                temp0.y, temp2.yz, temp2.yz
SQRT               temp0.y, temp0.yw
GE                 temp0.y, (0.5,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp2.y, temp3.yz, cb0[6].yz
MAD                temp2.y, temp0.yz, temp2.yz, temp3.yz
ADD                temp0.y, temp1.yw, (1,0,0,0)
GE                 temp0.y, (0.5,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp3.y, temp2.yz, (1,1,1,0)
MAD                temp2.y, temp0.yz, temp3.yz, temp2.yz
DERIV_RTX          temp0.y, temp1.yw
DERIV_RTY          temp0.y, temp1.yw
ADD                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.5,0,0.5,0)
ADD                temp1.y, temp0.yw, temp1.yw
MAD                temp0.y, temp0.yw, (0.5,-0,0,0)
ADD                temp0.y, temp0.yw, (0.5,0,0,0)
DIV                temp0.y, temp1.yw, temp0.yw
ADD                temp3.y, temp2.yz, cb0[6].yz
MAD                temp2.y, temp0.yz, temp3.yz, temp2.yz
ADD                temp3.y, temp0.yz, (-0.9,-0.91,-0.89,0)
GE                 temp0.y, temp1.yw, temp3.yw
GE                 temp0.y, temp1.yw, (0.5,0,0,0)
AND                temp0.y, temp0.yz, (0,1,1,0)
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp4.y, temp2.yz, cb0[8].yz
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
ADD                temp1.y, cb0[13].yw, (0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp1.yw, temp0.yw
DIV                temp1.y, temp1.yw, temp0.yw
ADD                temp1.y, temp1.yw, (1,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
DIV                temp0.y, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp0.yz, cb0[7].yz
MAD                temp0.y, temp0.yz, temp1.yz, temp0.yz
EQ                 temp1.y, temp0.yz, (1,0,0,0)
AND                temp0.y, temp1.yw, temp1.yw
AND                temp0.y, temp1.yw, temp0.yw
DISCARD            temp0.yw
EQ                 temp0.y, cb4[0].yw, (1,0,0,0)
IF                 temp0.yw
EQ                 temp0.y, cb4[0].yw, (1,0,0,0)
MUL                temp1.y, input2.yz, cb4[2].yz
MAD                temp1.y, cb4[1].yz, input2.yz, temp1.yz
MAD                temp1.y, cb4[3].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb4[4].yz
MOVC               temp1.y, temp0.yz, temp1.yz, input2.yz
ADD                temp1.y, temp1.yz, cb4[6].yz
MUL                temp1.y, temp1.yz, cb4[5].yz
MAD                temp0.y, temp1.yw, (0.25,0,0.75,0)
MAD                temp1.y, cb4[0].yw, (0.5,0,0.75,0)
MAX                temp1.y, temp0.yw, temp1.yw
SAMPLE             temp1.y, temp1.yz, resou1.yz, sampl0.-
ELSE               
MOV                temp1.y, (1,1,1,1)
ENDIF              
DP4                temp0.y, temp1.yz, cb2[46].yz
MUL                temp0.y, temp0.yz, temp0.yz
MUL                outpu0.y, temp0.yz, cb0[2].yz
MOV                outpu0.y, ()
RET                
