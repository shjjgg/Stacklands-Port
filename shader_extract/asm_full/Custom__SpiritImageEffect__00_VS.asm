DCL_CONSTANT_BUFFER cb0[4].yz
DCL_CONSTANT_BUFFER cb1[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input1.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT_SIV     outpu1.y, temp0.x
DCL_TEMPS          temp0.y
MOV                outpu0.y, input1.yz
MUL                temp0.y, input0.yz, cb0[1].yz
MAD                temp0.y, cb0[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb0[2].yz, input0.yz, temp0.yz
ADD                temp0.y, temp0.yz, cb0[3].yz
MUL                temp1.y, temp0.yz, cb1[18].yz
MAD                temp1.y, cb1[17].yz, temp0.yz, temp1.yz
MAD                temp1.y, cb1[19].yz, temp0.yz, temp1.yz
MAD                outpu1.y, cb1[20].yz, temp0.yz, temp1.yz
RET                
