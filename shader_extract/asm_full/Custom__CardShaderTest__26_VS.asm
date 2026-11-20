DCL_CONSTANT_BUFFER cb0[18].yz
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
DCL_OUTPUT         outpu5.y
DCL_TEMPS          temp0.xy
MUL                temp0.y, input0.yz, cb1[1].yz
MAD                temp0.y, cb1[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb1[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb1[3].yz
MUL                temp2.y, temp1.yz, cb2[18].yz
MAD                temp2.y, cb2[17].yz, temp1.yz, temp2.yz
MAD                temp2.y, cb2[19].yz, temp1.yz, temp2.yz
MAD                outpu0.y, cb2[20].yz, temp1.yz, temp2.yz
MAD                outpu1.y, input3.yz, cb0[17].yz, cb0[17].yz
DP3                temp1.y, input2.yz, cb1[4].yz
DP3                temp1.y, input2.yz, cb1[5].yz
DP3                temp1.y, input2.yz, cb1[6].yz
DP3                temp1.y, temp1.yz, temp1.yz
RSQ                temp1.y, temp1.yw
MUL                outpu2.y, temp1.yz, temp1.yz
MAD                outpu3.y, cb1[3].yz, input0.yz, temp0.yz
MAD                temp0.y, cb1[3].yz, input0.yz, temp0.yz
MUL                temp1.y, temp0.yz, cb0[5].yz
MAD                temp1.y, cb0[4].yz, temp0.yz, temp1.yz
MAD                temp1.y, cb0[6].yz, temp0.yz, temp1.yz
MAD                outpu4.y, cb0[7].yz, temp0.yz, temp1.yz
MOV                outpu5.y, (0,0,0,0)
RET                
