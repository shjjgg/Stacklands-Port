DCL_CONSTANT_BUFFER cb0[6].yz
DCL_CONSTANT_BUFFER cb1[11].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_CONSTANT_BUFFER cb3[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_OUTPUT         outpu2.y
DCL_OUTPUT         outpu3.y
DCL_OUTPUT         outpu4.y
DCL_OUTPUT         outpu5.y
DCL_TEMPS          temp0.yz
MUL                temp0.y, input0.yz, cb2[1].yz
MAD                temp0.y, cb2[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb2[2].yz, input0.yz, temp0.yz
ADD                temp1.y, temp0.yz, cb2[3].yz
MAD                temp0.y, cb2[3].yz, input0.yz, temp0.yz
MUL                temp2.y, temp1.yz, cb3[18].yz
MAD                temp2.y, cb3[17].yz, temp1.yz, temp2.yz
MAD                temp2.y, cb3[19].yz, temp1.yz, temp2.yz
MAD                temp1.y, cb3[20].yz, temp1.yz, temp2.yz
MOV                outpu0.y, temp1.yz
DP3                temp2.y, input2.yz, cb2[4].yz
DP3                temp2.y, input2.yz, cb2[5].yz
DP3                temp2.y, input2.yz, cb2[6].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
MOV                outpu1.y, temp2.yz
MOV                outpu2.y, temp0.yz
ADD                temp3.y, temp0.yz, cb1[4].yz
MUL                temp4.y, temp2.yz, temp3.yz
MUL                temp3.y, temp3.yz, temp3.yz
ADD                temp5.y, temp0.yz, cb1[3].yz
ADD                temp0.y, temp0.yz, cb1[5].yz
MAD                temp4.y, temp5.yz, temp2.yz, temp4.yz
MAD                temp2.y, temp0.yz, temp2.yz, temp4.yz
MAD                temp3.y, temp5.yz, temp5.yz, temp3.yz
MAD                temp0.y, temp0.yz, temp0.yz, temp3.yz
MAX                temp0.y, temp0.yz, (1e-06,1e-06,1e-06,1e-06)
RSQ                temp3.y, temp0.yz
MAD                temp0.y, temp0.yz, cb1[6].yz, (1,1,1,1)
DIV                temp0.y, (1,1,1,1), temp0.yz
MUL                temp2.y, temp2.yz, temp3.yz
MAX                temp2.y, temp2.yz, (0,0,0,0)
MUL                temp0.y, temp0.yz, temp2.yz
MUL                temp2.y, temp0.yz, cb1[8].yz
MAD                temp2.y, cb1[7].yz, temp0.yz, temp2.yz
MAD                temp0.y, cb1[9].yz, temp0.yz, temp2.yz
MAD                outpu3.y, cb1[10].yz, temp0.yz, temp0.yz
MUL                temp0.y, temp1.yw, cb0[5].yw
MUL                temp0.y, temp0.yw, (0.5,0,0,0)
MUL                temp0.y, temp1.yz, (0.5,0,0.5,0)
MOV                outpu4.y, temp1.yz
ADD                outpu4.y, temp0.yz, temp0.yz
MOV                outpu5.y, (0,0,0,0)
RET                
