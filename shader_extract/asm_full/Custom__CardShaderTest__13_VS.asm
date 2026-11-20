DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[11].yz
DCL_CONSTANT_BUFFER cb2[21].yz
DCL_CONSTANT_BUFFER cb3[1].yz
DCL_CONSTANT_BUFFER cb4[15].yz
DCL_CONSTANT_BUFFER cb5[14].yz
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
DCL_OUTPUT         outpu7.y
DCL_TEMPS          temp0.yz
IADD               temp0.y, input8.yw, cb3[0].yw
ISHL               temp0.y, temp0.yw, (0,0,0,0)
IMUL               strea0.-, temp0.y, temp0.yw, (0,0,0,0)
MUL                temp1.y, input0.yz, cb4[1].yz, temp0.yw
MAD                temp1.y, cb4[1048602].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb4[2].yz, temp0.yw, input0.yz, temp1.yz
ADD                temp2.y, temp1.yz, cb4[3].yz, temp0.yw
MAD                temp1.y, cb4[3].yz, temp0.yw, input0.yz, temp1.yz
MUL                temp3.y, temp2.yz, cb2[18].yz
MAD                temp3.y, cb2[17].yz, temp2.yz, temp3.yz
MAD                temp3.y, cb2[19].yz, temp2.yz, temp3.yz
MAD                outpu0.y, cb2[20].yz, temp2.yz, temp3.yz
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
DP3                temp2.y, input2.yz, cb4[4].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[5].yz, temp0.yw
DP3                temp2.y, input2.yz, cb4[6].yz, temp0.yw
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp2.yz
MOV                outpu2.y, temp0.yz
MOV                outpu3.y, temp1.yz
MUL                temp1.y, temp0.yw, temp0.yw
MAD                temp1.y, temp0.yw, temp0.yw, temp1.yw
MUL                temp2.y, temp0.yz, temp0.yz
DP4                temp3.y, cb5[3].yz, temp0.yw, temp2.yz
DP4                temp3.y, cb5[4].yz, temp0.yw, temp2.yz
DP4                temp3.y, cb5[5].yz, temp0.yw, temp2.yz
MAD                temp2.y, cb5[6].yz, temp0.yw, temp1.yz, temp3.yz
ADD                temp3.y, temp1.yz, cb1[4].yz
MUL                temp4.y, temp0.yz, temp3.yz
MUL                temp3.y, temp3.yz, temp3.yz
ADD                temp5.y, temp1.yz, cb1[3].yz
ADD                temp1.y, temp1.yz, cb1[5].yz
MAD                temp4.y, temp5.yz, temp0.yz, temp4.yz
MAD                temp0.y, temp1.yz, temp0.yz, temp4.yz
MAD                temp3.y, temp5.yz, temp5.yz, temp3.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp3.yz
MAX                temp1.y, temp1.yz, (1e-06,1e-06,1e-06,1e-06)
RSQ                temp3.y, temp1.yz
MAD                temp1.y, temp1.yz, cb1[6].yz, (1,1,1,1)
DIV                temp1.y, (1,1,1,1), temp1.yz
MUL                temp0.y, temp0.yz, temp3.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
MUL                temp0.y, temp1.yz, temp0.yz
MUL                temp1.y, temp0.yz, cb1[8].yz
MAD                temp1.y, cb1[7].yz, temp0.yz, temp1.yz
MAD                temp0.y, cb1[9].yz, temp0.yz, temp1.yz
MAD                temp0.y, cb1[10].yz, temp0.yz, temp0.yz
ADD                outpu4.y, temp2.yz, temp0.yz
MOV                outpu5.y, (0,0,0,0)
MOV                outpu6.y, (0,0,0,0)
MOV                outpu7.y, input8.yw
RET                
