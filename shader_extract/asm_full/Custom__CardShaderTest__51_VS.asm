DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[1].yz
DCL_CONSTANT_BUFFER cb2[6].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_CONSTANT_BUFFER cb4[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT          input3.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_TEMPS          temp0.xy
DP3                temp0.y, input2.yz, cb3[4].yz
DP3                temp0.y, input2.yz, cb3[5].yz
DP3                temp0.y, input2.yz, cb3[6].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
MUL                temp1.y, input0.yz, cb3[1].yz
MAD                temp1.y, cb3[0].yz, input0.yz, temp1.yz
MAD                temp1.y, cb3[2].yz, input0.yz, temp1.yz
MAD                temp1.y, cb3[3].yz, input0.yz, temp1.yz
MAD                temp2.y, temp1.yz, cb1[0].yz, cb1[0].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
DP3                temp0.y, temp0.yz, temp2.yz
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
SQRT               temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb2[5].yw
MAD                temp0.y, temp0.yz, temp0.yz, temp1.yz
NE                 temp0.y, cb2[5].yw, (0,0,0,0)
MOVC               temp0.y, temp0.yz, temp0.yz, temp1.yz
MUL                temp2.y, temp0.yz, cb4[18].yz
MAD                temp2.y, cb4[17].yz, temp0.yz, temp2.yz
MAD                temp0.y, cb4[19].yz, temp0.yz, temp2.yz
MAD                temp0.y, cb4[20].yz, temp1.yz, temp0.yz
MIN                temp1.y, temp0.yw, temp0.yw
ADD                temp1.y, temp0.yw, temp1.yw
MAD                outpu0.y, cb2[5].yw, temp1.yw, temp0.yw
MOV                outpu0.y, temp0.yz
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
MUL                temp0.y, input0.yz, cb3[1].yz
MAD                temp0.y, cb3[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb3[2].yz, input0.yz, temp0.yz
MAD                outpu2.y, cb3[3].yz, input0.yz, temp0.yz
RET                
