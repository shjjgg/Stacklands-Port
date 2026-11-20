DCL_CONSTANT_BUFFER cb0[6].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
MAD                temp0.y, input2.yw, (10,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MAD                temp0.y, temp0.yw, (0.02,0,0,0)
GE                 temp0.y, cb0[5].yw, temp0.yw
MOVC               temp0.y, temp0.yw, (0,0,1,0)
SAMPLE             temp1.y, input2.yz, resou0.yz, sampl0.-
ADD                temp0.y, temp1.yw, (1,0,0,0)
ADD                temp1.y, cb0[3].yz, cb0[4].yz
MAD                temp1.y, temp0.yz, temp1.yz, cb0[3].yz
MUL                temp1.y, temp1.yz, input1.yz
MUL                temp0.y, temp1.yz, (0,-0.7,-0.7,-0.7)
MAD                temp0.y, temp0.yz, temp0.yz, temp1.yz
MUL                outpu0.y, temp1.yz, temp0.yz
MOV                outpu0.y, temp1.yw
RET                
