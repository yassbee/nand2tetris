
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

// The SCREEN is 32 16-bit words per row for pixels, and there's 256 rows?
// The KBD contains the currently pressed-key

// okay, so we'll use an infinite loop program, and we'll want two sub-loops to whiten and blacken the screen. depending upon there being a pressed keyboard key, we'll jump to one loop or another. if the key hasn't changed to or from 0, we can also just stay in an infinite loop waiting for a change

// this initial scratch-space will set up where the end of our screen is
    // so we start at the first row of the screen and set all 32 words to @screen_value, then we jump up to the next row and so on, which we can do just by continuing our iteration until we've gone 32 * 256 past @SCREEN
    @SCREEN // load the screen starting word into A, and M=RAM[SCREEN]
    D=A // load the screen pointer into D
    @8192 // 32 * 256 = 8192
    D=D+A // this will be the end of our screen
    @endpointer // this var will store that end pointer
    M=D

// first thing's first, we check and see if any keyboard key was pressed
(WAIT_UNTIL_PRESS)
    @KBD
    D=M // store key in D
    @WAIT_UNTIL_PRESS
    D;JEQ // repeat this key-waiting code if key == 0

    // otherwise we blacken the screen:

    // initialize currentpointer to the SCREEN pointer
    @SCREEN
    D=A // @SCREEN is the address of the screen, so this is our pointer
    @currentpointer
    M=D // now a location in RAM has the pointer, and we can modify it over time
(BLACKEN_SCREEN)
    // we know where our screen's end is, so we just set every value of the screen to black here until we reach the end

    // compare the current pointer to the end pointer so we can check if we're finished
    @currentpointer
    D=M // set D to the current pointer
    @endpointer
    D=D-M // subtract the current pointer's address from the end pointer's address
    @WAIT_UNTIL_RELEASE
    D;JEQ // if our pointers are the same, we've reached the end, our screen is now black and we wait for a keyboard release to unset it

    // otherwise we haven't reached the end of our screen, so keep filling it up
    // first we retrieve our current pointer
    @currentpointer // RAM[currentpointer] = pointer
    A=M // make the pointer our current address
    M=-1 // set that value at that address to modify the screen
    // increment our pointer
    D=A+1 // increment it
    @currentpointer // lookup the variable
    M=D // store our updated pointer
    // repeat our loop
    @BLACKEN_SCREEN
    0;JMP

// if a keyboard key was pressed, we just loop here to wait until it's released
(WAIT_UNTIL_RELEASE)
    @KBD
    D=M // store key in D
    @WAIT_UNTIL_RELEASE
    D;JGT // repeat this release-checking code if key > 0

    // the keyboard has been released now, so we'll clear the screen

// The following code is just a copy-paste of BLACKEN_SCREEN with the modification that our word color is 0 instead of -1

    // initialize currentpointer to the SCREEN pointer
    @SCREEN
    D=A // @SCREEN is the address of the screen, so this is our pointer
    @currentpointer
    M=D // now a location in RAM has the pointer, and we can modify it over time
(CLEAR_SCREEN)
    // we know where our screen's end is, so we just set every value of the screen to black here until we reach the end

    // compare the current pointer to the end pointer so we can check if we're finished
    @currentpointer
    D=M // set D to the current pointer
    @endpointer
    D=D-M // subtract the current pointer's address from the end pointer's address
    @WAIT_UNTIL_PRESS
    D;JEQ // if our pointers are the same, we've reached the end, our screen is now clear and we wait for a keyboard press to fill it

    // otherwise we haven't reached the end of our screen, so keep filling it up
    // first we retrieve our current pointer
    @currentpointer // RAM[currentpointer] = pointer
    A=M // make the pointer our current address
    M=0 // set that value at that address to modify the screen
    // increment our pointer
    D=A+1 // increment it
    @currentpointer // lookup the variable
    M=D // store our updated pointer
    // repeat our loop
    @CLEAR_SCREEN
    0;JMP


