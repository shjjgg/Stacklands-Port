DCL_CONSTANT_BUFFER cb0[8].yz
DCL_CONSTANT_BUFFER cb1[42].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_INPUT_PS       input5.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.xz
ADD                temp0.y, input1.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yz, (0.333333,150,0,0)
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, temp0.yw
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp1.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MAD                temp1.y, temp0.yw, (0.001667,0,0,0)
ADD                temp0.y, cb0[6].yz, cb0[7].yz
ADD                temp0.y, temp0.yz, temp1.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
DIV                temp0.y, temp0.yw, temp0.yw
MIN                temp0.y, temp0.yw, (1,0,0,0)
MAD                temp0.y, temp0.yz, cb0[5].yz, cb0[5].yz
EQ                 temp0.y, cb2[0].yw, (1,0,0,0)
IF                 temp0.yw
EQ                 temp0.y, cb2[0].yw, (1,0,0,0)
MUL                temp1.y, input3.yz, cb2[2].yz
MAD                temp1.y, cb2[1].yz, input3.yz, temp1.yz
MAD                temp1.y, cb2[3].yz, input3.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb2[4].yz
MOVC               temp1.y, temp0.yz, temp1.yz, input3.yz
ADD                temp1.y, temp1.yz, cb2[6].yz
MUL                temp1.y, temp1.yz, cb2[5].yz
MUL                temp0.y, temp1.yw, (0.25,0,0,0)
MUL                temp1.y, cb2[0].yw, (0.5,0,0,0)
MAD                temp2.y, cb2[0].yw, (0.5,0,0.25,0)
MAX                temp0.y, temp0.yw, temp1.yw
MIN                temp1.y, temp2.yw, temp0.yw
SAMPLE             temp2.y, temp1.yz, resou0.yz, sampl0.-
ADD                temp3.y, temp1.yz, (0.25,0,0,0)
SAMPLE             temp3.y, temp3.yz, resou0.yz, sampl0.-
ADD                temp1.y, temp1.yz, (0.5,0,0,0)
SAMPLE             temp1.y, temp1.yz, resou0.yz, sampl0.-
MOV                temp4.y, input2.yz
MOV                temp4.y, (1,0,0,0)
DP4                temp2.y, temp2.yz, temp4.yz
DP4                temp2.y, temp3.yz, temp4.yz
DP4                temp2.y, temp1.yz, temp4.yz
ELSE               
MOV                temp1.y, input2.yz
MOV                temp1.y, (1,0,0,0)
DP4                temp2.y, cb1[39].yz, temp1.yz
DP4                temp2.y, cb1[40].yz, temp1.yz
DP4                temp2.y, cb1[41].yz, temp1.yz
ENDIF              
ADD                temp1.y, temp2.yz, input5.yz
MAX                temp1.y, temp1.yz, (0,0,0,0)
ADD                temp2.y, temp0.yz, (-0.04,-0.04,-0.04,0)
MAD                outpu1.y, cb0[4].yz, temp2.yz, (0.04,0.04,0.04,0)
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                temp0.y, temp0.yz, temp0.yz
MUL                temp1.y, temp1.yz, temp0.yz
EXP                outpu3.y, temp1.yz
MOV                outpu0.y, temp0.yz
MOV                outpu0.y, (1,0,0,0)
MOV                outpu1.y, cb0[4].yw
MAD                outpu2.y, input2.yz, (0.5,0.5,0.5,0), (0.5,0.5,0.5,0)
MOV                outpu2.y, (1,0,0,0)
MOV                outpu3.y, ()
RET                
