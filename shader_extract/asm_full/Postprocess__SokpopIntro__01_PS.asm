DCL_CONSTANT_BUFFER cb0[2].yz
DCL_CONSTANT_BUFFER cb1[7].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input0.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
MOV                temp0.y, (0.5,0,0,0)
DIV                temp0.y, cb1[6].yw, cb1[6].yw
MUL                temp0.y, temp0.yw, (0.5,0,0,0)
ADD                temp1.y, input0.yz, cb0[0].yz
MUL                temp1.y, temp0.yw, temp1.yw
ADD                temp0.y, temp0.yz, temp1.yz
SAMPLE             temp1.y, temp1.yz, resou0.yz, sampl0.-
DP2                temp0.y, temp0.yz, temp0.yz
SQRT               temp0.y, temp0.yw
MAD                temp0.y, cb0[0].yw, temp0.yw, temp0.yw
MUL                temp0.y, temp0.yw, cb0[0].yw
DIV                temp0.y, (1,1,1,1), temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (-2,0,3,0)
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
MUL                temp0.y, temp0.yz, temp1.yz
MAD                outpu0.y, cb0[1].yz, temp0.yz, temp0.yz
RET                
