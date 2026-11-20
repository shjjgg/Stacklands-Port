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
DCL_TEMPS          temp0.xy
MUL                temp0.y, input0.yz, cb3[1].yz
MAD                temp0.y, cb3[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb3[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb3[3].yz
MAD                outpu3.y, cb3[3].yz, input0.yz, temp0.yz
MUL                temp0.y, temp1.yz, cb4[18].yz
MAD                temp0.y, cb4[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb4[19].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb4[20].yz, temp1.yz, temp0.yz
MOV                outpu0.y, temp0.yz
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
DP3                temp1.y, input2.yz, cb3[4].yz
DP3                temp1.y, input2.yz, cb3[5].yz
DP3                temp1.y, input2.yz, cb3[6].yz
DP3                temp1.y, temp1.yz, temp1.yz
RSQ                temp1.y, temp1.yw
MUL                temp1.y, temp1.yz, temp1.yz
MOV                outpu2.y, temp1.yz
MUL                temp1.y, temp1.yw, temp1.yw
MAD                temp1.y, temp1.yw, temp1.yw, temp1.yw
MUL                temp2.y, temp1.yz, temp1.yz
DP4                temp1.y, cb2[42].yz, temp2.yz
DP4                temp1.y, cb2[43].yz, temp2.yz
DP4                temp1.y, cb2[44].yz, temp2.yz
MAD                outpu4.y, cb2[45].yz, temp1.yz, temp1.yz
MUL                temp0.y, temp0.yw, cb1[5].yw
MUL                temp1.y, temp0.yz, (0.5,0,0.5,0.5)
MOV                outpu5.y, temp0.yz
ADD                outpu5.y, temp1.yz, temp1.yz
MOV                outpu6.y, (0,0,0,0)
RET                
