DCL_CONSTANT_BUFFER cb0[3].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input0.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.x
MAD                temp0.y, input0.yw, (20,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
MUL                temp0.y, temp0.yw, cb0[2].yw
MAD                temp0.y, temp0.yw, (0.001,0,0,0)
MAD                temp0.y, temp0.yw, (15,0,0,0)
SINCOS             strea0.-, temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb0[2].yw
MAD                temp0.y, temp0.yw, (0.001,0,0,0)
SAMPLE             outpu0.y, temp0.yz, resou0.yz, sampl0.-
RET                
