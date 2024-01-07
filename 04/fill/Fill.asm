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

    //scr_end=屏幕最后一点
    @24575
    D=A
    @scr_end
    M=D
    //src_i=当前画笔所指
    @SCREEN
    D=A
    @cur_i
    M=D-1
(LOOP)
    //判断按键有没有被按下
    @KBD
    D=M
    @B_LOOP
    D;JEQ
    //按下
        //指针是否在屏幕结尾处
        @cur_i
        D=M
        @scr_end
        D=D-M
            //是
            @LOOP
            D;JEQ
            //否
            @cur_i
            M=M+1
            A=M
            M=-1
        @LOOP
        0;JMP
    //没按
    (B_LOOP)
        //指针是否在屏幕开始处
        @cur_i
        D=M
        @SCREEN
        D=D-A
        D=D+1
            //是
            @LOOP
            D;JEQ
            //否
            @cur_i
            A=M
            M=0
            @cur_i
            M=M-1
        @LOOP
        0;JMP