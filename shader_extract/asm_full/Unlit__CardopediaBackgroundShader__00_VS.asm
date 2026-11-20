DCL_CONSTANT_BUFFER cb0[3].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[4].yz
DCL_CONSTANT_BUFFER cb3[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input1.y
DCL_OUTPUT         outpu0.y
DCL_OUTPUT_SIV     outpu1.y, temp0.x
DCL_OUTPUT         outpu2.y
DCL_TEMPS          temp0.y
MAD                outpu0.y, input1.yz, cb0[2].yz, cb0[2].yz
MUL                temp0.y, input0.yz, cb2[1].yz
MAD                temp0.y, cb2[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb2[2].yz, input0.yz, temp0.yz
ADD                temp0.y, temp0.yz, cb2[3].yz
MUL                temp1.y, temp0.yz, cb3[18].yz
MAD                temp1.y, cb3[17].yz, temp0.yz, temp1.yz
MAD                temp1.y, cb3[19].yz, temp0.yz, temp1.yz
MAD                temp0.y, cb3[20].yz, temp0.yz, temp1.yz
MOV                outpu1.y, temp0.yz
MUL                temp0.y, temp0.yw, cb1[5].yw
MUL                temp1.y, temp0.yz, (0.5,0,0.5,0.5)
MOV                outpu2.y, temp0.yz
ADD                outpu2.y, temp1.yz, temp1.yz
RET                
