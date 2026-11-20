DCL_CONSTANT_BUFFER cb0[3].yz
DCL_CONSTANT_BUFFER cb1[4].yz
DCL_CONSTANT_BUFFER cb2[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input1.y
DCL_INPUT          input2.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_TEMPS          temp0.y
MUL                temp0.y, input0.yz, cb1[1].yz
MAD                temp0.y, cb1[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb1[2].yz, input0.yz, temp0.yz
ADD                temp0.y, temp0.yz, cb1[3].yz
MUL                temp1.y, temp0.yz, cb2[18].yz
MAD                temp1.y, cb2[17].yz, temp0.yz, temp1.yz
MAD                temp1.y, cb2[19].yz, temp0.yz, temp1.yz
MAD                outpu0.y, cb2[20].yz, temp0.yz, temp1.yz
MUL                outpu1.y, input1.yz, cb0[2].yz
MOV                outpu2.y, input2.yz
RET                
