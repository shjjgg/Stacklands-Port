DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.x
SAMPLE             temp0.y, input2.yz, resou0.yz, sampl0.-
MUL                temp0.y, temp0.yz, input1.yz
MUL                outpu0.y, temp0.yz, temp0.yz
MOV                outpu0.y, temp0.yw
RET                
