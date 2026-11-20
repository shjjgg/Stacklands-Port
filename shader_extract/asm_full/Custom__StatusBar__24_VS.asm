DCL_CONSTANT_BUFFER cb0[11].yz
DCL_CONSTANT_BUFFER cb1[7].yz
DCL_CONSTANT_BUFFER cb2[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_INPUT          input3.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_OUTPUT         outpu4.y
DCL_TEMPS          temp0.y
MUL                temp0.y, input0.yz, cb1[1].yz
MAD                temp0.y, cb1[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb1[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb1[3].yz
MAD                outpu3.y, cb1[3].yz, input0.yz, temp0.yz
MUL                temp0.y, temp1.yz, cb2[18].yz
MAD                temp0.y, cb2[17].yz, temp1.yz, temp0.yz
MAD                temp0.y, cb2[19].yz, temp1.yz, temp0.yz
MAD                outpu0.y, cb2[20].yz, temp1.yz, temp0.yz
MAD                outpu1.y, input3.yz, cb0[10].yz, cb0[10].yz
DP3                temp0.y, input2.yz, cb1[4].yz
DP3                temp0.y, input2.yz, cb1[5].yz
DP3                temp0.y, input2.yz, cb1[6].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                outpu2.y, temp0.yz, temp0.yz
MOV                outpu4.y, (0,0,0,0)
RET                
