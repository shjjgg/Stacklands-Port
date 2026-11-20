DCL_CONSTANT_BUFFER cb0[1].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.x
MUL                temp0.y, cb0[0].yw, (0.3,0,0,0)
MAD                temp0.y, input2.yw, (0.318319,0,0,0)
SINCOS             temp0.y, strea0.-, temp0.yw
LOG                temp0.y, input2.yw
MUL                temp0.y, temp0.yw, (1.4,0,0,0)
EXP                temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, (0.02,0,0,0)
MOV                temp0.y, input2.yw
SAMPLE             temp0.y, temp0.yz, resou0.yz, sampl0.-
MUL                temp0.y, temp0.yz, input1.yz
MUL                outpu0.y, temp0.yz, temp0.yz
MOV                outpu0.y, temp0.yw
RET                
