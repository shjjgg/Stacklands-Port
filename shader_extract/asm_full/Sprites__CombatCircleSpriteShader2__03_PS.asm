DCL_CONSTANT_BUFFER cb0[5].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
SAMPLE             temp0.y, input2.yz, resou0.yz, sampl0.-
MUL                temp0.y, temp0.yz, input1.yz
MUL                temp1.y, temp0.yz, (0.7,0.7,0.7,0)
MUL                temp1.y, temp1.yz, cb0[4].yz
MAD                temp0.y, temp0.yz, (0.3,0.3,0.3,0), temp1.yz
MUL                outpu0.y, temp0.yz, temp0.yz
MOV                outpu0.y, temp0.yw
RET                
