DCL_CONSTANT_BUFFER cb0[1].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[21].yz
DCL_CONSTANT_BUFFER cb3[1].yz
DCL_CONSTANT_BUFFER cb4[15].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT_SGV      input8.y, temp0.w
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_TEMPS          temp0.xy
IADD               temp0.y, input8.yw, cb3[0].yw
ISHL               temp0.y, temp0.yw, (0,0,0,0)
MUL                temp0.y, input0.yz, cb4[1].yz, temp0.yw
MAD                temp0.y, cb4[1048586].yz, temp0.-, input0.yz, temp0.yz
MAD                temp0.y, cb4[2].yz, temp0.yw, input0.yz, temp0.yz
MAD                outpu1.y, cb4[3].yz, temp0.yw, input0.yz, temp0.yz
MUL                temp1.y, input0.yz, cb4[1].yz, temp0.yw
MAD                temp1.y, cb4[1048586].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb4[2].yz, temp0.yw, input0.yz, temp1.yz
MAD                temp1.y, cb4[3].yz, temp0.yw, input0.yz, temp1.yz
NE                 temp0.y, cb1[5].yw, (0,0,0,0)
IF                 temp0.yw
DP3                temp2.y, input2.yz, cb4[4].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[5].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[6].yz, temp0.yw
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp2.yz
MAD                temp2.y, temp1.yz, cb0[0].yz, cb0[0].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
DP3                temp0.y, temp0.yz, temp2.yz
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
SQRT               temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb1[5].yw
MAD                temp1.y, temp0.yz, temp0.yz, temp1.yz
ENDIF              
MUL                temp0.y, temp1.yz, cb2[18].yz
MAD                temp0.y, cb2[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb2[19].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb2[20].yz, temp1.yz, temp0.yz
MIN                temp1.y, temp0.yw, temp0.yw
ADD                temp1.y, temp0.yw, temp1.yw
MAD                outpu0.y, cb1[5].yw, temp1.yw, temp0.yw
MOV                outpu0.y, temp0.yz
MOV                outpu2.y, input8.yw
RET                
