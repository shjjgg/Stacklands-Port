DCL_CONSTANT_BUFFER cb0[11].yz
DCL_CONSTANT_BUFFER cb1[47].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.xz
MUL                temp0.y, input2.yw, (1000,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, cb0[10].yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yw, (500,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.5,0,0,0)
MUL                temp0.y, temp0.yw, cb0[10].yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
ADD                temp0.y, cb0[7].yw, cb0[8].yw
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
MOV                temp1.y, cb0[7].yw
MOV                temp2.y, cb0[8].yz
MOV                temp0.y, (0,0,0,100000)
MOV                temp1.y, (0,0,0,0)
LOOP               
IGE                temp3.y, temp1.yw, (0,0,0,0)
BREAKC             temp3.yw
IEQ                temp3.y, temp1.yz, (0,0,0,0)
MOVC               temp2.y, temp3.yw, temp1.yw, cb0[8].yw
MOVC               temp3.y, temp3.yz, temp1.yz, temp2.yz
MOVC               temp3.y, temp1.yz, temp3.yz, cb0[7].yz
IADD               temp1.y, temp1.yw, (0,0,0,0)
IEQ                temp3.y, temp1.yz, (0,0,0,0)
MOVC               temp2.y, temp3.yw, temp1.yw, cb0[8].yw
MOVC               temp2.y, temp3.yz, temp1.yz, temp2.yz
ADD                temp4.y, temp3.yz, temp2.yz
ADD                temp2.y, temp0.yz, temp3.yz
DP2                temp3.y, temp2.yz, temp4.yz
DP2                temp3.y, temp4.yz, temp4.yz
DIV                temp3.y, temp3.yw, temp3.yw
MOV                temp4.y, temp4.yw
DP2                temp3.y, temp4.yz, temp2.yz
LT                 temp3.y, (0,0,0,0)
MOVC               temp3.y, temp3.yw, (1,0,-1,0)
MAD                temp2.y, temp3.yz, temp4.yz, temp2.yz
DP2                temp2.y, temp2.yz, temp2.yz
SQRT               temp2.y, temp2.yw
MUL                temp4.y, temp2.yw, temp3.yw
SQRT               temp2.y, temp3.yw
LT                 temp2.y, temp4.yw, temp0.yw
MAD                temp4.y, temp3.yw, temp2.yw, temp1.yw
MOVC               temp0.y, temp2.yz, temp4.yz, temp0.yz
ADD                temp1.y, temp1.yw, temp2.yw
ENDLOOP            
MOV                temp0.y, temp0.yw
DERIV_RTX          temp0.y, temp0.yw
DERIV_RTY          temp1.y, temp0.yw
ADD                temp0.y, temp0.yw, temp1.yw
MUL                temp0.y, temp0.yw, (3.5,0,0,0)
FRC                temp0.y, temp0.yw
LT                 temp0.y, (0.8,0,0,0)
MUL                temp1.y, temp0.yw, (0.8,0,0,0)
MOVC               temp0.y, temp0.yw, temp1.yw, temp0.yw
ADD                temp1.y, cb0[10].yw, cb0[10].yw
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, temp0.yw, temp1.yw
MAD                temp1.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, temp1.yw, temp1.yw
DIV                temp1.y, temp1.yw, temp1.yw
MOVC               temp2.y, temp0.yz, cb0[6].yz, cb0[4].yz
MUL                temp3.y, temp1.yz, (0.3,0.8,0.5,1.1)
LT                 temp1.y, temp3.yz, temp0.yz
LT                 temp3.y, temp0.yz, temp3.yz
AND                temp1.y, temp1.yz, temp3.yz
MUL                temp3.y, temp2.yz, cb0[10].yz
MOVC               temp4.y, temp1.yz, temp3.yz, temp2.yz
MOVC               temp1.y, temp1.yz, temp3.yz, temp2.yz
MOVC               temp2.y, temp0.yz, temp1.yz, temp4.yz
MOV                temp2.y, cb0[4].yw
ADD                temp3.y, temp2.yz, cb0[5].yz
MAD                temp1.y, temp1.yz, temp3.yz, temp2.yz
MAD                temp0.y, cb0[10].yw, (2,0,0,0)
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
MAD                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp0.y, temp0.yz, temp0.yz
DIV                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yz, temp1.yz, temp1.yz
EQ                 temp1.y, cb2[0].yw, (1,0,0,0)
IF                 temp1.yw
EQ                 temp1.y, cb2[0].yw, (1,0,0,0)
MUL                temp1.y, input2.yz, cb2[2].yz
MAD                temp1.y, cb2[1].yz, input2.yz, temp1.yz
MAD                temp1.y, cb2[3].yz, input2.yz, temp1.yz
ADD                temp1.y, temp1.yz, cb2[4].yz
MOVC               temp1.y, temp1.yz, temp1.yz, input2.yz
ADD                temp1.y, temp1.yz, cb2[6].yz
MUL                temp1.y, temp1.yz, cb2[5].yz
MAD                temp1.y, temp1.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb2[0].yw, (0.5,0,0.75,0)
MAX                temp1.y, temp1.yw, temp2.yw
SAMPLE             temp1.y, temp1.yz, resou0.yz, sampl0.-
ELSE               
MOV                temp1.y, (1,1,1,1)
ENDIF              
DP4                temp1.y, temp1.yz, cb1[46].yz
MUL                temp2.y, temp0.yz, input3.yz
MUL                temp0.y, temp0.yz, temp1.yz
MOV                temp2.y, (0,0,0,0)
MAD                outpu0.y, temp0.yz, cb0[2].yz, temp2.yz
RET                
