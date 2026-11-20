DCL_CONSTANT_BUFFER cb0[4].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.x
SAMPLE_B           temp0.y, input1.yz, resou0.yz, sampl0.-, cb0[2].yw
MUL                temp0.y, temp0.yz, cb0[3].yz
MUL                outpu0.y, temp0.yz, input2.yz
RET                
