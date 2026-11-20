DCL_CONSTANT_BUFFER cb0[9].yz
DCL_CONSTANT_BUFFER cb1[21].yz
DCL_CONSTANT_BUFFER cb2[1].yz
DCL_CONSTANT_BUFFER cb3[15].yz
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
IADD               temp0.y, input8.yw, cb2[0].yw
ISHL               temp0.y, temp0.yw, (0,0,0,0)
MUL                temp1.y, input0.yz, cb3[1].yz, temp0.yw
MAD                temp1.y, cb3[1048586].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb3[2].yz, temp0.yw, input0.yz, temp1.yz
ADD                temp2.y, temp1.yz, cb3[3].yz, temp0.yw
MAD                outpu3.y, cb3[3].yz, temp0.yw, input0.yz, temp1.yz
MUL                temp1.y, temp2.yz, cb1[18].yz
MAD                temp1.y, cb1[17].yz, temp2.yz, temp1.yz
MAD                temp1.y, cb1[19].yz, temp2.yz, temp1.yz
MAD                outpu0.y, cb1[20].yz, temp2.yz, temp1.yz
MAD                outpu1.y, input3.yz, cb0[8].yz, cb0[8].yz
DP3                temp1.y, input2.yz, cb3[4].yz, temp0.yw
DP3                temp1.y, input2.yz, cb3[5].yz, temp0.yw
DP3                temp1.y, input2.yz, cb3[6].yz, temp0.yw
DP3                temp0.y, temp1.yz, temp1.yz
RSQ                temp0.y, temp0.yw
MUL                outpu2.y, temp0.yz, temp1.yz
MOV                outpu4.y, (0,0,0,0)
MOV                outpu5.y, (0,0,0,0)
MOV                outpu6.y, input8.yw
RET                
