@256
D=A
@SP
M=D
@RETLABEL0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0, JMP
(RETLABEL0)
//['function', 'Main.fibonacci', '0']

(Main.fibonacci)
//['push', 'argument', '0']

@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'constant', '2']

@2
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['if-goto', 'IF_TRUE']

@SP
A=M-1
D=M
@SP
M=M-1
@IF_TRUE
D;JGT
//['goto', 'IF_FALSE']

@IF_FALSE
0;JMP
//['label', 'IF_TRUE', '//', 'if', 'n<2,', 'return', 'n']

(IF_TRUE)
//['push', 'argument', '0']

@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['return']

@LCL
D=M
@R11
M=D
@5
A=D-A
D=M
@R12
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@R11
D=M
@1
D = D-A
A=D
D=M
@THAT
M=D
@R11
D=M
@2
D = D-A
A=D
D=M
@THIS
M=D
@R11
D=M
@3
D = D-A
A=D
D=M
@ARG
M=D
@R11
D=M
@4
D = D-A
A=D
D=M
@LCL
M=D
@R12
A=M
0;JMP
//['label', 'IF_FALSE', '//', 'if', 'n>=2,', 'returns', 'fib(n-2)+fib(n-1)']

(IF_FALSE)
//['push', 'argument', '0']

@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'constant', '2']

@2
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['sub']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M-D
//['call', 'Main.fibonacci', '1', '//', 'computes', 'fib(n-2)']

@RETLABEL1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0, JMP
(RETLABEL1)
//['push', 'argument', '0']

@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'constant', '1']

@1
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['sub']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M-D
//['call', 'Main.fibonacci', '1', '//', 'computes', 'fib(n-1)']

@RETLABEL2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0, JMP
(RETLABEL2)
//['return']

@LCL
D=M
@R11
M=D
@5
A=D-A
D=M
@R12
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@R11
D=M
@1
D = D-A
A=D
D=M
@THAT
M=D
@R11
D=M
@2
D = D-A
A=D
D=M
@THIS
M=D
@R11
D=M
@3
D = D-A
A=D
D=M
@ARG
M=D
@R11
D=M
@4
D = D-A
A=D
D=M
@LCL
M=D
@R12
A=M
0;JMP
@256
D=A
@SP
M=D
@RETLABEL3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0, JMP
(RETLABEL3)
//['function', 'Sys.init', '0']

(Sys.init)
//['push', 'constant', '4']

@4
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['call', 'Main.fibonacci', '1', '//', 'computes', 'the', "4'th", 'fibonacci', 'element']

@RETLABEL4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0, JMP
(RETLABEL4)
//['label', 'WHILE']

(WHILE)
//['goto', 'WHILE', '//', 'loops', 'infinitely']

@WHILE
0;JMP
