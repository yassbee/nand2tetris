//['function', 'SimpleFunction.test', '2']

(SimpleFunction.test)
@LCL
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
@LCL
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
//['push', 'local', '0']

@LCL
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
//['push', 'local', '1']

@LCL
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
//['not']

@SP
A=M-1
M = !M
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
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
//['push', 'argument', '1']

@ARG
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['sub']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M-D
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
