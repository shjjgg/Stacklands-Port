DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[26].yz
DCL_CONSTANT_BUFFER cb4[4].yz
DCL_CONSTANT_BUFFER cb5[12].yz
DCL_CONSTANT_BUFFER cb6[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_SAMPLER        sampl2.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_RESOURCE       resou2.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_INPUT_PS       input4.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.z
ADD                temp0.y, cb0[10].yw, cb0[11].yw
MAD                temp0.y, cb0[10].yw, (0.58,0,0,0)
ADD                temp1.y, input2.yz, cb4[3].yz
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
MUL                temp1.y, temp2.yz, (1.5,1.5,0,0)
SAMPLE             temp1.y, temp1.yz, resou0.yz, sampl2.-
MOV                temp1.y, temp1.yz
MOV                temp2.y, input2.yw
MOV                temp0.y, cb0[11].yw
ADD                temp3.y, temp0.yz, temp2.yz
MAX                temp3.y, temp3.yz, (0,0,0,0)
DP3                temp0.y, temp3.yz, temp3.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, cb0[11].yw
ADD                temp0.y, temp0.yz, (0.03,0.03,0.03,0)
ADD                temp1.y, cb0[11].yw, (0.03,0,0,0)
ADD                temp0.y, temp0.yz, temp2.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
DP3                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp1.yw, temp0.yw
ADD                temp0.y, temp0.yz, (1,0,0,1)
ADD                temp0.y, temp0.yw, (1,0,0,0)
GE                 temp0.y, (0.5,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp2.y, cb0[5].yz, (1,1,1,0)
MAD                temp0.y, temp0.yz, temp2.yz, cb0[5].yz
DERIV_RTX          temp1.y, temp0.yw
DERIV_RTY          temp2.y, temp0.yw
ADD                temp1.y, temp1.yw, temp2.yw
MAD                temp2.y, temp1.yw, (0.5,0,0.5,0)
ADD                temp2.y, temp0.yw, temp2.yw
MAD                temp2.y, temp1.yw, (0.5,-0,0,0)
ADD                temp2.y, temp2.yw, (0.5,0,0,0)
DIV                temp2.y, temp2.yw, temp2.yw
MAD                temp1.y, cb0[6].yz, temp1.yz, temp0.yz
MAD                temp0.y, temp2.yz, temp1.yz, temp0.yz
ADD                temp1.y, cb0[13].yw, (0.5,0,0,0)
MAD                temp1.y, temp1.yw, (0.5,0,0,0)
ADD                temp1.y, temp0.yw, temp1.yw
MAD                temp1.y, temp1.yw, (0.5,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
DIV                temp1.y, temp1.yw, temp1.yw
ADD                temp0.y, temp0.yw, (1,0,0,0)
ADD                temp0.y, temp1.yw, temp0.yw
DIV                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp0.yz, cb0[7].yz
MAD                temp0.y, temp0.yz, temp1.yz, temp0.yz
ADD                temp1.y, input2.yz, cb1[4].yz
MOV                temp2.y, cb5[9].yw
MOV                temp2.y, cb5[10].yw
MOV                temp2.y, cb5[11].yw
DP3                temp0.y, temp1.yz, temp2.yz
ADD                temp1.y, input2.yz, cb3[25].yz
DP3                temp1.y, temp1.yz, temp1.yz
SQRT               temp1.y, temp1.yw
ADD                temp1.y, temp0.yw, temp1.yw
MAD                temp0.y, cb3[25].yw, temp1.yw, temp0.yw
MAD                temp0.y, temp0.yw, cb3[24].yw, cb3[24].yw
EQ                 temp1.y, cb6[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp1.y, cb6[0].yw, (1,0,0,0)
MUL                temp1.y, input2.yz, cb6[2].yz
MAD                temp1.y, cb6[1].yz, input2.yz, temp1.yz
MAD                temp1.y, cb6[3].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb6[4].yz
MOVC               temp1.y, temp1.yz, temp1.yz, input2.yz
ADD                temp1.y, temp1.yz, cb6[6].yz
MUL                temp1.y, temp1.yz, cb6[5].yz
MAD                temp1.y, temp1.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb6[0].yw, (0.5,0,0.75,0)
MAX                temp1.y, temp1.yw, temp2.yw
SAMPLE             temp1.y, temp1.yz, resou2.yz, sampl0.-
ELSE               
MOV                temp1.y, (1,1,1,1)
ENDIF              
DP4                temp1.y, temp1.yz, cb2[46].yz
DIV                temp1.y, input4.yz, input4.yz
SAMPLE             temp2.y, temp1.yz, resou1.yz, sampl1.-
ADD                temp1.y, temp1.yw, temp2.yw
MAD                temp0.y, temp0.yw, temp1.yw, temp2.yw
MUL                temp1.y, temp0.yz, temp0.yz
MUL                temp1.y, temp1.yz, cb0[2].yz
MAD                outpu0.y, temp0.yz, input3.yz, temp1.yz
MOV                outpu0.y, ()
RET                
