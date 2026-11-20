DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[46].yz
DCL_CONSTANT_BUFFER cb3[7].yz
DCL_CONSTANT_BUFFER cb4[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT          input3.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_OUTPUT         outpu4.y
DCL_OUTPUT         outpu5.y
DCL_OUTPUT         outpu6.y
DCL_TEMPS          temp0.yz
MUL                temp0.y, input0.yz, cb3[1].yz
MAD                temp0.y, cb3[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb3[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb3[3].yz
MAD                temp0.y, cb3[3].yz, input0.yz, temp0.yz
MUL                temp2.y, temp1.yz, cb4[18].yz
MAD                temp2.y, cb4[17].yz, temp1.yz, temp2.yz
MAD                temp2.y, cb4[19].yz, temp1.yz, temp2.yz
MAD                temp1.y, cb4[20].yz, temp1.yz, temp2.yz
MOV                outpu0.y, temp1.yz
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
DP3                temp2.y, input2.yz, cb3[4].yz
DP3                temp2.y, input2.yz, cb3[5].yz
DP3                temp2.y, input2.yz, cb3[6].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
MOV                outpu2.y, temp2.yz
MOV                outpu3.y, temp0.yz
ADD                temp3.y, temp0.yz, cb2[3].yz
ADD                temp4.y, temp0.yz, cb2[4].yz
ADD                temp0.y, temp0.yz, cb2[5].yz
MUL                temp5.y, temp2.yz, temp4.yz
MUL                temp4.y, temp4.yz, temp4.yz
MAD                temp4.y, temp3.yz, temp3.yz, temp4.yz
MAD                temp3.y, temp3.yz, temp2.yz, temp5.yz
MAD                temp3.y, temp0.yz, temp2.yz, temp3.yz
MAD                temp0.y, temp0.yz, temp0.yz, temp4.yz
MAX                temp0.y, temp0.yz, (1e-06,1e-06,1e-06,1e-06)
RSQ                temp4.y, temp0.yz
MAD                temp0.y, temp0.yz, cb2[6].yz, (1,1,1,1)
DIV                temp0.y, (1,1,1,1), temp0.yz
MUL                temp3.y, temp3.yz, temp4.yz
MAX                temp3.y, temp3.yz, (0,0,0,0)
MUL                temp0.y, temp0.yz, temp3.yz
MUL                temp3.y, temp0.yz, cb2[8].yz
MAD                temp3.y, cb2[7].yz, temp0.yz, temp3.yz
MAD                temp0.y, cb2[9].yz, temp0.yz, temp3.yz
MAD                temp0.y, cb2[10].yz, temp0.yz, temp0.yz
MUL                temp0.y, temp2.yw, temp2.yw
MAD                temp0.y, temp2.yw, temp2.yw, temp0.yw
MUL                temp2.y, temp2.yz, temp2.yz
DP4                temp3.y, cb2[42].yz, temp2.yz
DP4                temp3.y, cb2[43].yz, temp2.yz
DP4                temp3.y, cb2[44].yz, temp2.yz
MAD                temp2.y, cb2[45].yz, temp0.yz, temp3.yz
ADD                outpu4.y, temp0.yz, temp2.yz
MUL                temp0.y, temp1.yw, cb1[5].yw
MUL                temp0.y, temp0.yw, (0.5,0,0,0)
MUL                temp0.y, temp1.yz, (0.5,0,0.5,0)
MOV                outpu5.y, temp1.yz
ADD                outpu5.y, temp0.yz, temp0.yz
MOV                outpu6.y, (0,0,0,0)
RET                
