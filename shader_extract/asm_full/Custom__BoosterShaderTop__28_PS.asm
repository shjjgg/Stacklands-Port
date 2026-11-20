DCL_CONSTANT_BUFFER cb0[7].yz
DCL_CONSTANT_BUFFER cb1[5].yz
DCL_SAMPLER        sampl0.-
DCL_SAMPLER        sampl1.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_RESOURCE       resou1.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_INPUT_PS       input3.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.z
MUL                temp0.y, input1.yz, (150,20,1,0)
ROUND_NE           temp0.y, temp0.yw
SAMPLE             temp1.y, temp0.yz, resou0.yz, sampl0.-
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
MUL                temp0.y, temp0.yw, (150,0,0,0)
ROUND_NE           temp0.y, temp0.yw
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, (43758.5,0,0,0)
FRC                temp0.y, temp0.yw
MAD                temp0.y, temp0.yw, (0.005,0,0,0)
DERIV_RTX          temp2.y, temp0.yz
DERIV_RTY          temp3.y, temp0.yz
ADD                temp0.y, temp2.yz, temp3.yz
ADD                temp1.y, temp0.yw, (-0.116777,0,0,0)
ADD                temp0.y, temp0.yw, (0.883223,0,0,0)
DIV                temp0.y, temp0.yw, temp0.yw
DIV                temp1.y, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp1.yw
ADD                temp1.y, temp0.yw, (-0.03,0,0,0)
ADD                temp0.y, temp0.yw, (0.97,0,0,0)
DIV                temp0.y, temp0.yw, temp0.yw
DIV                temp0.y, temp1.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, input1.yz, (0,0.5,0,0.55)
MAD                temp0.y, temp0.yz, (0,1.75,0,1.75), (0,0,0,-0.05)
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (-0.400391,0,0,0)
DIV                temp0.y, temp0.yw, temp0.yw
ADD                temp0.y, temp0.yw, (1,0,0,0)
MUL                temp2.y, temp1.yz, cb0[5].yz
MAD                temp1.y, cb0[5].yz, temp1.yz, cb0[6].yz
MAD                temp0.y, temp0.yz, temp1.yz, temp2.yz
ADD                temp1.y, input3.yz, cb1[4].yz
DP3                temp1.y, temp1.yz, temp1.yz
RSQ                temp1.y, temp1.yw
MUL                temp1.y, temp1.yz, temp1.yz
ADD                temp1.y, input1.yz, input1.yz
MAD                temp1.y, temp1.yz, (5,5,0,0), temp1.yz
MUL                temp1.y, temp1.yw, (10,0,0,0)
SINCOS             temp1.y, strea0.-, temp1.yw
MAD                temp2.y, temp1.yw, (0.02,0,0,0)
MUL                temp1.y, temp2.yw, (30,0,0,0)
SINCOS             strea0.-, temp1.y, temp1.yw
MAD                temp2.y, temp1.yw, (0.02,0,0,0)
SAMPLE             temp1.y, temp2.yz, resou1.yz, sampl1.-
MAD                temp0.y, temp1.yz, (0,0.5,0.5,0.5), temp0.yz
MUL                temp1.y, temp0.yz, temp0.yz
MAD                temp0.y, temp0.yz, temp0.yz, (-0.04,-0.04,-0.04,0)
MAD                outpu1.y, cb0[4].yz, temp0.yz, (0.04,0.04,0.04,0)
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                outpu0.y, temp0.yz, temp1.yz
MOV                outpu0.y, (1,0,0,0)
MOV                outpu1.y, cb0[4].yw
MAD                outpu2.y, input2.yz, (0.5,0.5,0.5,0), (0.5,0.5,0.5,0)
MOV                outpu2.y, (1,0,0,0)
MOV                outpu3.y, (0,0,0,1)
RET                
