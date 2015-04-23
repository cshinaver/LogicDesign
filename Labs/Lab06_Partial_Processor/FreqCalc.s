; Load from data address into register a MOV_L Ra, d 
; Store Stores from Ra into reg d MOV_S Ra, d
; ADD Ra, Rb, Rc Add register b and register c and store the result in register a
; Load Constant 0011 MOV_L Ra, #c Load the constant c into register a.
; Subtract 0100 SUB Ra, Rb, Rc Subtract register c from register b (RF[b] - R[c]) and store the result in register a.
; Jump if zero 0101 JMPZ Ra, offset Set the program counter (PC) to PC + offset if register a is 0.

MOV_L R1, #1;
MOV_S R1, 3; 
MOV_L R1, #24;
MOV_S R1, 4; 
MOV_L R1, #15;
MOV_S R1, 5; 
MOV_L R1, #24;
MOV_S R1, 6; 
MOV_L R2, #0; Store count
MOV_L R3, #24 ; Store value of j
MOV_L R5, #1 ; Store 1 as constant to increment count

; Begin loop
MOV_L R1, 3; Get a[0] into R1
SUB R4, R1, R3; Subtract j from a[i]
JUMPZ R4, 2 ; Jump to addition if a[i] == j
JUMPZ R0, 2 ; Jump past addition if prev doesn't jump
ADD R2, R2, R5 ; count += 1
MOV_L R1, 4; Get a[1] into R1
SUB R4, R1, R3; Subtract j from a[i]
JUMPZ R4, 2 ; Jump to addition if a[i] == j
JUMPZ R0, 2 ; Jump past addition if prev doesn't jump
ADD R2, R2, R5 ; count += 1
MOV_L R1, 5; Get a[2] into R1
SUB R4, R1, R3; Subtract j from a[i]
JUMPZ R4, 2 ; Jump to addition if a[i] == j
JUMPZ R0, 2 ; Jump past addition if prev doesn't jump
ADD R2, R2, R5 ; count += 1
MOV_L R1, 6; Get a[3] into R1
SUB R4, R1, R3; Subtract j from a[i]
JUMPZ R4, 2 ; Jump to addition if a[i] == j
JUMPZ R0, 2 ; Jump past addition if prev doesn't jump
ADD R2, R2, R5 ; count += 1
MOV_S R2, 2 ; Store count into memory location 2
