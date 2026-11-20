DCL_CONSTANT_BUFFER cb0[14].yz
DCL_CONSTANT_BUFFER cb1[6].yz
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
DCL_TEMPS          temp0.y
MUL                temp0.y, input0.yz, cb2[1].yz
MAD                temp0.y, cb2[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb2[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb2[3].yz
MAD                outpu3.y, cb2[3].yz, input0.yz, temp0.yz
MUL                temp0.y, temp1.yz, cb3[18].yz
MAD                temp0.y, cb3[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb3[19].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb3[20].yz, temp1.yz, temp0.yz
MOV                outpu0.y, temp0.yz
MAD                outpu1.y, input3.yz, cb0[13].yz, cb0[13].yz
DP3                temp1.y, input2.yz, cb2[4].yz
DP3                temp1.y, input2.yz, cb2[5].yz
DP3                temp1.y, input2.yz, cb2[6].yz
DP3                temp1.y, temp1.yz, temp1.yz
RSQ                temp1.y, temp1.yw
MUL                outpu2.y, temp1.yz, temp1.yz
MUL                temp0.y, temp0.yw, cb1[5].yw
MUL                temp1.y, temp0.yz, (0.5,0,0.5,0.5)
MOV                outpu4.y, temp0.yz
ADD                outpu4.y, temp1.yz, temp1.yz
MOV                outpu5.y, (0,0,0,0)
RET                
