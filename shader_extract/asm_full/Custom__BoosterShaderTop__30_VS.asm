DCL_CONSTANT_BUFFER cb0[1].yz
DCL_CONSTANT_BUFFER cb1[6].yz
DCL_CONSTANT_BUFFER cb2[7].yz
DCL_CONSTANT_BUFFER cb3[21].yz
DCL_INPUT          input0.y
DCL_INPUT          input2.y
DCL_OUTPUT_SIV     outpu0.y, temp0.x
DCL_OUTPUT         outpu1.y
DCL_TEMPS          temp0.xy
DP3                temp0.y, input2.yz, cb2[4].yz
DP3                temp0.y, input2.yz, cb2[5].yz
DP3                temp0.y, input2.yz, cb2[6].yz
DP3                temp0.y, temp0.yz, temp0.yz
RSQ                temp0.y, temp0.yw
MUL                temp0.y, temp0.yz, temp0.yz
MUL                temp1.y, input0.yz, cb2[1].yz
MAD                temp1.y, cb2[0].yz, input0.yz, temp1.yz
MAD                temp1.y, cb2[2].yz, input0.yz, temp1.yz
MAD                temp1.y, cb2[3].yz, input0.yz, temp1.yz
MAD                temp2.y, temp1.yz, cb0[0].yz, cb0[0].yz
DP3                temp0.y, temp2.yz, temp2.yz
RSQ                temp0.y, temp0.yw
MUL                temp2.y, temp0.yz, temp2.yz
DP3                temp0.y, temp0.yz, temp2.yz
MAD                temp0.y, temp0.yw, temp0.yw, (1,0,0,0)
SQRT               temp0.y, temp0.yw
MUL                temp0.y, temp0.yw, cb1[5].yw
MAD                temp0.y, temp0.yz, temp0.yz, temp1.yz
NE                 temp0.y, cb1[5].yw, (0,0,0,0)
MOVC               temp0.y, temp0.yz, temp0.yz, temp1.yz
MUL                temp2.y, temp0.yz, cb3[18].yz
MAD                temp2.y, cb3[17].yz, temp0.yz, temp2.yz
MAD                temp0.y, cb3[19].yz, temp0.yz, temp2.yz
MAD                temp0.y, cb3[20].yz, temp1.yz, temp0.yz
DIV                temp1.y, cb1[5].yw, temp0.yw
MIN                temp1.y, temp1.yw, (0,0,0,0)
MAX                temp1.y, temp1.yw, (-1,0,0,0)
ADD                temp0.y, temp0.yw, temp1.yw
MIN                temp1.y, temp0.yw, temp0.yw
MOV                outpu0.y, temp0.yz
ADD                temp0.y, temp0.yw, temp1.yw
MAD                outpu0.y, cb1[5].yw, temp0.yw, temp0.yw
MUL                temp0.y, input0.yz, cb2[1].yz
MAD                temp0.y, cb2[0].yz, input0.yz, temp0.yz
MAD                temp0.y, cb2[2].yz, input0.yz, temp0.yz
MAD                outpu1.y, cb2[3].yz, input0.yz, temp0.yz
RET                
