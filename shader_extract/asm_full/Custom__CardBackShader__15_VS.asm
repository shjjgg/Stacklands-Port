DCL_CONSTANT_BUFFER cb0[7].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[11].yz
DCL_CONSTANT_BUFFER cb3[21].yz
DCL_CONSTANT_BUFFER cb4[1].yz
DCL_CONSTANT_BUFFER cb5[15].yz
DCL_CONSTANT_BUFFER cb6[14].yz
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
DCL_TEMPS          temp0.xyz
IADD               temp0.y, input8.yw, cb4[0].yw
ISHL               temp0.y, temp0.yw, (0,0,0,0)
IMUL               strea0.-, temp0.y, temp0.yw, (0,0,0,0)
MUL                temp1.y, input0.yz, cb5[1].yz, temp0.yw
MAD                temp1.y, cb5[1048602].yz, temp0.-, input0.yz, temp1.yz
MAD                temp1.y, cb5[2].yz, temp0.yw, input0.yz, temp1.yz
ADD                temp2.y, temp1.yz, cb5[3].yz, temp0.yw
MAD                temp1.y, cb5[3].yz, temp0.yw, input0.yz, temp1.yz
MUL                temp3.y, temp2.yz, cb3[18].yz
MAD                temp3.y, cb3[17].yz, temp2.yz, temp3.yz
MAD                temp3.y, cb3[19].yz, temp2.yz, temp3.yz
MAD                temp2.y, cb3[20].yz, temp2.yz, temp3.yz
MOV                outpu0.y, temp2.yz
MAD                outpu1.y, input3.yz, cb0[6].yz, cb0[6].yz
DP3                temp3.y, input2.yz, cb5[4].yz, temp0.yw
DP3                temp3.y, input2.yz, cb5[5].yz, temp0.yw
DP3                temp3.y, input2.yz, cb5[6].yz, temp0.yw
DP3                temp0.y, temp3.yz, temp3.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp3.yz
MOV                outpu2.y, temp0.yz
MOV                outpu3.y, temp1.yz
MUL                temp1.y, temp0.yw, temp0.yw
MAD                temp1.y, temp0.yw, temp0.yw, temp1.yw
MUL                temp3.y, temp0.yz, temp0.yz
DP4                temp4.y, cb6[3].yz, temp0.yw, temp3.yz
DP4                temp4.y, cb6[4].yz, temp0.yw, temp3.yz
DP4                temp4.y, cb6[5].yz, temp0.yw, temp3.yz
MAD                temp3.y, cb6[6].yz, temp0.yw, temp1.yz, temp4.yz
ADD                temp4.y, temp1.yz, cb2[4].yz
MUL                temp5.y, temp0.yz, temp4.yz
MUL                temp4.y, temp4.yz, temp4.yz
ADD                temp6.y, temp1.yz, cb2[3].yz
ADD                temp1.y, temp1.yz, cb2[5].yz
MAD                temp5.y, temp6.yz, temp0.yz, temp5.yz
MAD                temp0.y, temp1.yz, temp0.yz, temp5.yz
MAD                temp4.y, temp6.yz, temp6.yz, temp4.yz
MAD                temp1.y, temp1.yz, temp1.yz, temp4.yz
MAX                temp1.y, temp1.yz, (1e-06,1e-06,1e-06,1e-06)
RSQ                temp4.y, temp1.yz
MAD                temp1.y, temp1.yz, cb2[6].yz, (1,1,1,1)
DIV                temp1.y, (1,1,1,1), temp1.yz
MUL                temp0.y, temp0.yz, temp4.yz
MAX                temp0.y, temp0.yz, (0,0,0,0)
MUL                temp0.y, temp1.yz, temp0.yz
MUL                temp1.y, temp0.yz, cb2[8].yz
MAD                temp1.y, cb2[7].yz, temp0.yz, temp1.yz
MAD                temp0.y, cb2[9].yz, temp0.yz, temp1.yz
MAD                temp0.y, cb2[10].yz, temp0.yz, temp0.yz
ADD                outpu4.y, temp3.yz, temp0.yz
MUL                temp0.y, temp2.yw, cb1[5].yw
MUL                temp0.y, temp0.yw, (0.5,0,0,0)
MUL                temp0.y, temp2.yz, (0.5,0,0.5,0)
MOV                outpu5.y, temp2.yz
ADD                outpu5.y, temp0.yz, temp0.yz
MOV                outpu6.y, (0,0,0,0)
MOV                outpu7.y, input8.yw
RET                
