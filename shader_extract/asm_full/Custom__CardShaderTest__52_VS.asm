DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_CONSTANT_BUFFER cb2[6].yz
DCL_CONSTANT_BUFFER cb3[21].yz
DCL_CONSTANT_BUFFER cb4[1].yz
DCL_CONSTANT_BUFFER cb5[15].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT          input3.y
DCL_INPUT_SGV      input8.y, temp0.w
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_TEMPS          temp0.xy
IADD               temp0.y, input8.yw, cb4[0].yw
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
ISHL               temp0.y, temp0.yw, (0,0,0,0)
MUL                temp0.y, input0.yz, cb5[1].yz, temp0.yw
MAD                temp0.y, cb5[1048586].yz, temp0.-, input0.yz, temp0.yz
MAD                temp0.y, cb5[2].yz, temp0.yw, input0.yz, temp0.yz
MAD                outpu2.y, cb5[3].yz, temp0.yw, input0.yz, temp0.yz
MUL                temp1.y, input0.yz, cb5[1].yz, temp0.yw
MAD                temp1.y, cb5[1048586].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb5[2].yz, temp0.yw, input0.yz, temp1.yz
MAD                temp1.y, cb5[3].yz, temp0.yw, input0.yz, temp1.yz
NE                 temp0.y, cb2[5].yw, (0,0,0,0)
IF                 temp0.yw
DP3                temp2.y, input2.yz, cb5[4].yz, temp0.yw
DP3                temp2.y, input2.yz, cb5[5].yz, temp0.yw
DP3                temp2.y, input2.yz, cb5[6].yz, temp0.yw
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp2.yz
MAD                temp2.y, temp1.yz, cb1[0].yz, cb1[0].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
DP3                temp0.y, temp0.yz, temp2.yz
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
SQRT               temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb2[5].yw
MAD                temp1.y, temp0.yz, temp0.yz, temp1.yz
ENDIF              
MUL                temp0.y, temp1.yz, cb3[18].yz
MAD                temp0.y, cb3[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb3[19].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb3[20].yz, temp1.yz, temp0.yz
DIV                temp1.y, cb2[5].yw, temp0.yw
MIN                temp1.y, temp1.yw, (0,0,0,0)
MAX                temp1.y, temp1.yw, (-1,0,0,0)
ADD                temp0.y, temp0.yw, temp1.yw
MIN                temp1.y, temp0.yw, temp0.yw
ADD                temp1.y, temp0.yw, temp1.yw
MAD                outpu0.y, cb2[5].yw, temp1.yw, temp0.yw
MOV                outpu0.y, temp0.yz
MOV                outpu3.y, input8.yw
RET                
