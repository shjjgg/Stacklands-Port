DCL_CONSTANT_BUFFER cb0[7].yz
DCL_CONSTANT_BUFFER cb1[46].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_CONSTANT_BUFFER cb3[21].yz
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
DCL_TEMPS          temp0.y
MUL                temp0.y, input0.yz, cb2[1].yz
MAD                temp0.y, cb2[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb2[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb2[3].yz
MAD                outpu3.y, cb2[3].yz, input0.yz, temp0.yz
MUL                temp0.y, temp1.yz, cb3[18].yz
MAD                temp0.y, cb3[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb3[19].yz, temp1.yz, temp0.yz
MAD                outpu0.y, cb3[20].yz, temp1.yz, temp0.yz
MAD                outpu1.y, input3.yz, cb0[6].yz, cb0[6].yz
DP3                temp0.y, input2.yz, cb2[4].yz
DP3                temp0.y, input2.yz, cb2[5].yz
DP3                temp0.y, input2.yz, cb2[6].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
MOV                outpu2.y, temp0.yz
MUL                temp0.y, temp0.yw, temp0.yw
MAD                temp0.y, temp0.yw, temp0.yw, temp0.yw
MUL                temp1.y, temp0.yz, temp0.yz
DP4                temp0.y, cb1[42].yz, temp1.yz
DP4                temp0.y, cb1[43].yz, temp1.yz
DP4                temp0.y, cb1[44].yz, temp1.yz
MAD                outpu4.y, cb1[45].yz, temp0.yz, temp0.yz
MOV                outpu5.y, (0,0,0,0)
MOV                outpu6.y, (0,0,0,0)
RET                
