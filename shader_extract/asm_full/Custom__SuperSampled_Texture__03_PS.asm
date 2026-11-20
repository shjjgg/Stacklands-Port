DCL_CONSTANT_BUFFER cb0[4].yz
DCL_SAMPLER        sampl0.-
DCL_RESOURCE       resou0.-, immed0.xz
DCL_INPUT_PS       input1.y
DCL_INPUT_PS       input2.y
DCL_OUTPUT         outpu0.y
DCL_TEMPS          temp0.yz
MUL                temp0.y, input1.yz, cb0[2].yz
DERIV_RTX          temp0.y, temp0.yz
DERIV_RTY          temp0.y, temp0.yz
MOV                temp1.y, (0,0,0,0)
MOV                temp2.y, (0,0,0,0)
LOOP               
GE                 temp2.y, temp2.yw, (16,0,0,0)
BREAKC             temp2.yw
ADD                temp2.y, temp2.yz, (1,-7.5,0,0)
MUL                temp2.y, temp2.yw, (0.0625,0,0,0)
MAD                temp2.y, temp2.yz, temp0.yz, input1.yz
MOV                temp3.y, temp1.yz
MOV                temp4.y, (0,0,0,0)
LOOP               
GE                 temp2.y, temp4.yw, (16,0,0,0)
BREAKC             temp2.yw
ADD                temp4.y, temp4.yz, (1,-7.5,0,0)
MUL                temp2.y, temp4.yw, (0.0625,0,0,0)
MAD                temp4.y, temp2.yz, temp0.yz, temp2.yz
SAMPLE_LOD         temp5.y, temp4.yz, resou0.yz, sampl0.-, (0,0,0,0)
ADD                temp3.y, temp3.yz, temp5.yz
ENDLOOP            
MOV                temp1.y, temp3.yz
ENDLOOP            
MUL                temp0.y, temp1.yz, (0.003906,0.003906,0.003906,0.003906)
MUL                temp0.y, temp0.yz, cb0[3].yz
MUL                outpu0.y, temp0.yz, input2.yz
RET                
