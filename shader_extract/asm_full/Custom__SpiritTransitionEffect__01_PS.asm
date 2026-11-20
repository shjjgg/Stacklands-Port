DCL_CONSTANT_BUFFER cb0[3].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input0.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.y
MAD                temp0.y, cb0[2].yz, (0.002385,0.009711,0,0), input0.yz
SAMPLE             temp0.y, temp0.yz, resou0.yz, sampl0.-
MOV                outpu0.y, temp0.yw
SAMPLE             temp0.y, input0.yz, resou0.yz, sampl0.-
MOV                outpu0.y, temp0.yw
MAD                temp0.y, cb0[2].yz, (0.01,0,0.0079,0.006131), input0.yz
SAMPLE             temp1.y, temp0.yz, resou0.yz, sampl0.-
SAMPLE             temp0.y, temp0.yz, resou0.yz, sampl0.-
MOV                outpu0.y, temp0.yw
MOV                outpu0.y, temp1.yw
RET                
