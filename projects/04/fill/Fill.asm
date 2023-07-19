// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//Check if the screen is currently in black or white modes
// Jumps to BLACKLOOP/WHITELOOP subroutines depending on the mode and state of keyboard
@sc_state

(STATE)
@sc_state
D=M
@BLACK
D;JGT

(WHITE)
@KBD
D=M
@STATE
D;JEQ
@BLACKLOOP
0;JMP

(BLACK)
@KBD
D=M
@STATE
D;JGT
@WHITELOOP
0;JMP

(BLACKLOOP)
@current
@limit
@inc
@24576
D=A
@limit
M=D
@16
D=A
@inc
M=D

@SCREEN
D=A
@current
M=D

@sc_state
M=1

(BLOOP)
@limit
D=M
@current
D=D-M
@STATE
D;JEQ

@current
A=M
M=-1
//@inc
//D=M
@current
M=M+1
@BLOOP
0;JMP



(WHITELOOP)
@current
@limit
@inc
@24576
D=A
@limit
M=D
@16
D=A
@inc
M=D

@SCREEN
D=A
@current
M=D

@sc_state
M=0

(WLOOP)
@limit
D=M
@current
D=D-M
@STATE
D;JEQ

@current
A=M
M=0
//@inc
//D=M
@current
M=M+1
@WLOOP
0;JMP




