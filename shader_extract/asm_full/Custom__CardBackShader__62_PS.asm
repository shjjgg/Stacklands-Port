DCL_CONSTANT_BUFFER cb0[6].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.y
ADD                temp0.y, input1.yw, input1.yw
MUL                temp0.y, temp0.yw, (10,0,0,0)
FRC                temp0.y, temp0.yw
ROUND_NE           temp0.y, temp0.yw
ADD                temp0.y, temp0.yw, (0.8,0,0,0)
MIN                temp0.y, temp0.yw, (1,0,0,0)
SAMPLE             temp1.y, input1.yz, resou0.yz, sampl0.-
MUL                temp0.y, temp1.yz, cb0[5].yz
MUL                temp0.y, temp0.yz, temp0.yz
LT                 temp1.y, input1.yz, (0.136777,0.05,0,0)
LT                 temp1.y, (0,0,0.863223,0.95), input1.yz
OR                 temp0.y, temp1.yw, temp1.yw
OR                 temp0.y, temp1.yw, temp0.yw
OR                 temp0.y, temp1.yw, temp0.yw
MOVC               temp0.y, temp0.yz, (0,0,0,0), temp0.yz
MAD                temp0.y, cb0[4].yw, (0.96,0,0.96,0)
MUL                outpu0.y, temp0.yz, temp0.yz
ADD                temp0.y, temp0.yz, (-0.04,-0.04,-0.04,0)
MAD                outpu1.y, cb0[4].yz, temp0.yz, (0.04,0.04,0.04,0)
MOV                outpu0.y, (1,0,0,0)
MOV                outpu1.y, cb0[4].yw
MAD                outpu2.y, input2.yz, (0.5,0.5,0.5,0), (0.5,0.5,0.5,0)
MOV                outpu2.y, (1,0,0,0)
MOV                outpu3.y, (1,1,1,1)
RET                
