DCL_CONSTANT_BUFFER cb0[11].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_CONSTANT_BUFFER cb2[47].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.yz
ADD                temp0.y, input2.yz, cb1[4].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
DIV                temp2.y, input2.yz, cb0[10].yz
FRC                temp2.y, temp2.yz
ADD                temp2.y, temp2.yz, (0.5,0.5,0,0)
GE                 temp2.y, temp2.yz, temp2.yz
FRC                temp2.y, temp2.yz
MOVC               temp2.y, temp2.yz, temp2.yz, temp2.yz
ADD                temp1.y, cb0[10].yw, (-0.01,0,0,0)
ADD                temp2.y, temp1.yz, temp2.yz
MUL                temp2.y, temp2.yz, (0,0,50,50)
MAD                temp3.y, temp2.yz, (-2,-2,0,0), (3,3,0,0)
MUL                temp2.y, temp2.yz, temp2.yz
MUL                temp2.y, temp2.yz, temp3.yz
MUL                temp2.y, temp2.yw, temp2.yw
ADD                temp2.y, temp2.yz, temp1.yz
ADD                temp2.y, temp2.yz, (1,1,0,0)
MUL                temp2.y, temp2.yz, (50,50,0,0)
MAD                temp3.y, temp2.yz, (-2,-2,0,0), (3,3,0,0)
MUL                temp2.y, temp2.yz, temp2.yz
MUL                temp2.y, temp2.yz, temp3.yz
MUL                temp1.y, temp2.yw, temp2.yw
MAD                temp1.y, temp1.yw, temp2.yw, (1,0,0,0)
MUL                temp1.y, temp1.yw, cb0[10].yw
MUL                temp1.y, temp1.yw, (0.5,0,0,0)
MUL                temp2.y, input2.yz, cb0[5].yz
MAD                temp2.y, cb0[4].yz, input2.yz, temp2.yz
MAD                temp2.y, cb0[6].yz, input2.yz, temp2.yz
ADD                temp2.y, temp2.yz, cb0[7].yz
EQ                 temp2.y, cb3[0].yw, (1,0,0,0)
IF                 temp2.yw
EQ                 temp2.y, cb3[0].yw, (1,0,0,0)
MUL                temp3.y, input2.yz, cb3[2].yz
MAD                temp3.y, cb3[1].yz, input2.yz, temp3.yz
MAD                temp3.y, cb3[3].yz, input2.yz, temp3.yz
ADD                temp3.y, temp3.yz, cb3[4].yz
MOVC               temp3.y, temp2.yz, temp3.yz, input2.yz
ADD                temp3.y, temp3.yz, cb3[6].yz
MUL                temp3.y, temp3.yz, cb3[5].yz
MAD                temp2.y, temp3.yw, (0.25,0,0.75,0)
MAD                temp2.y, cb3[0].yw, (0.5,0,0.75,0)
MAX                temp3.y, temp2.yw, temp2.yw
SAMPLE             temp3.y, temp3.yz, resou1.yz, sampl0.-
ELSE               
MOV                temp3.y, (1,1,1,1)
ENDIF              
DP4                temp2.y, temp3.yz, cb2[46].yz
SAMPLE             temp3.y, temp2.yz, resou0.yz, sampl1.-
MUL                temp2.y, temp2.yw, temp3.yw
MUL                temp2.y, temp2.yz, cb0[2].yz
DP3                temp2.y, input1.yz, input1.yz
RSQ                temp2.y, temp2.yw
MUL                temp3.y, temp2.yz, input1.yz
ADD                temp4.y, cb0[9].yz, (-0.04,-0.04,-0.04,0)
MAD                temp4.y, cb0[8].yz, temp4.yz, (0.04,0.04,0.04,0)
MAD                temp2.y, cb0[8].yw, (0.96,0,0.96,0)
MUL                temp5.y, temp2.yz, cb0[9].yz
MUL                temp5.y, temp1.yz, temp5.yz
ADD                temp3.y, temp2.yw, (1,0,0,0)
MAD                outpu0.y, temp1.yw, temp2.yw, temp3.yw
ADD                temp1.y, cb0[8].yw, (1,0,0,0)
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
DP3                temp0.y, temp4.yz, temp4.yz
NE                 temp0.y, temp0.yw, (0,0,0,0)
AND                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp1.y, temp0.yz, temp2.yz
MUL                temp0.y, temp2.yz, temp0.yz
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp1.y, temp0.yw, temp0.yw
MUL                temp1.y, temp1.yw, temp1.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp2.y, temp4.yz, (1,1,1,0)
MAD                temp2.y, temp2.yz, temp0.yz, temp4.yz
MUL                temp0.y, temp0.yz, temp2.yz
MAD                outpu0.y, temp5.yz, temp1.yz, temp0.yz
RET                
