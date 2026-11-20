DCL_CONSTANT_BUFFER cb0[9].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[21].yz
DCL_CONSTANT_BUFFER cb3[1].yz
DCL_CONSTANT_BUFFER cb4[15].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT          input3.y
DCL_INPUT_SGV      input8.y, temp0.w
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_OUTPUT         outpu4.y
DCL_OUTPUT         outpu5.y
DCL_OUTPUT         outpu6.y
DCL_TEMPS          temp0.xy
IADD               temp0.y, input8.yw, cb3[0].yw
ISHL               temp0.y, temp0.yw, (0,0,0,0)
MUL                temp1.y, input0.yz, cb4[1].yz, temp0.yw
MAD                temp1.y, cb4[1048586].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb4[2].yz, temp0.yw, input0.yz, temp1.yz
ADD                temp2.y, temp1.yz, cb4[3].yz, temp0.yw
MAD                outpu3.y, cb4[3].yz, temp0.yw, input0.yz, temp1.yz
MUL                temp1.y, temp2.yz, cb2[18].yz
MAD                temp1.y, cb2[17].yz, temp2.yz, temp1.yz
MAD                temp1.y, cb2[19].yz, temp2.yz, temp1.yz
MAD                temp1.y, cb2[20].yz, temp2.yz, temp1.yz
MOV                outpu0.y, temp1.yz
MAD                outpu1.y, input3.yz, cb0[8].yz, cb0[8].yz
DP3                temp2.y, input2.yz, cb4[4].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[5].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[6].yz, temp0.yw
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                outpu2.y, temp0.yz, temp2.yz
MUL                temp0.y, temp1.yw, cb1[5].yw
MUL                temp0.y, temp0.yw, (0.5,0,0,0)
MUL                temp0.y, temp1.yz, (0.5,0,0.5,0)
MOV                outpu4.y, temp1.yz
ADD                outpu4.y, temp0.yz, temp0.yz
MOV                outpu5.y, (0,0,0,0)
MOV                outpu6.y, input8.yw
RET                
