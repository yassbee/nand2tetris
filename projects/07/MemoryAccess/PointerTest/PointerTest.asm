@3030
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@0
D=A
@P_THIS18
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME23
0;JMP
(P_THIS18)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME23)
@SP
M=M-1
@3040
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@1
D=A
@P_THIS42
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME47
0;JMP
(P_THIS42)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME47)
@SP
M=M-1
@32
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
A=M-1
D=M
@R13
A=M
M=D
@SP
M=M-1
@46
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@THAT
D=M
@6
D=D+A
@R13
M=D
@SP
A=M-1
D=M
@R13
A=M
M=D
@SP
M=M-1
@0
D=A
@P_THIS101
D;JEQ
@THAT
D=M
@SP
A=M
M=D
@RESUME106
0;JMP
(P_THIS101)
@THIS
D=M
@SP
A=M
M=D
(RESUME106)
@SP
M=M+1
@1
D=A
@P_THIS119
D;JEQ
@THAT
D=M
@SP
A=M
M=D
@RESUME124
0;JMP
(P_THIS119)
@THIS
D=M
@SP
A=M
M=D
(RESUME124)
@SP
M=M+1
@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
@THIS
D=M
@2
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M-D
@THAT
D=M
@6
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D