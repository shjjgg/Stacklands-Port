DCL_CONSTANT_BUFFER cb0[4].yz
DCL_CONSTANT_BUFFER cb1[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input3.y
DCL_INPUT          input7.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_TEMPS          temp0.y
MUL                temp0.y, input0.yz, cb0[1].yz
MAD                temp0.y, cb0[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb0[2].yz, input0.yz, temp0.yz
ADD                temp0.y, temp0.yz, cb0[3].yz
MUL                temp1.y, temp0.yz, cb1[18].yz
MAD                temp1.y, cb1[17].yz, temp0.yz, temp1.yz
MAD                temp1.y, cb1[19].yz, temp0.yz, temp1.yz
MAD                outpu0.y, cb1[20].yz, temp0.yz, temp1.yz
MOV                outpu1.y, input7.yz
MOV                outpu2.y, input3.yz
RET                
