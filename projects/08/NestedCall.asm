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
//['function', 'Sys.init', '0']

(Sys.init)
//['push', 'constant', '4000', '//', 'test', 'THIS', 'and', 'THAT', 'context', 'save']

@4000
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '0']

@0
D=A
@P_THIS72
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME77
0;JMP
(P_THIS72)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME77)
@SP
M=M-1
//['push', 'constant', '5000']

@5000
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '1']

@1
D=A
@P_THIS96
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME101
0;JMP
(P_THIS96)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME101)
@SP
M=M-1
//['call', 'Sys.main', '0']

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
@0
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.main
0, JMP
(RETLABEL1)
//['pop', 'temp', '1']

@5
D=A
@1
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
//['label', 'LOOP']

(LOOP)
//['goto', 'LOOP']

@LOOP
0;JMP
//['function', 'Sys.main', '5']

(Sys.main)
@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['push', 'constant', '4001']

@4001
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '0']

@0
D=A
@P_THIS234
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME239
0;JMP
(P_THIS234)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME239)
@SP
M=M-1
//['push', 'constant', '5001']

@5001
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '1']

@1
D=A
@P_THIS258
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME263
0;JMP
(P_THIS258)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME263)
@SP
M=M-1
//['push', 'constant', '200']

@200
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'local', '1']

@LCL
D=M
@1
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
//['push', 'constant', '40']

@40
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'local', '2']

@LCL
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
//['push', 'constant', '6']

@6
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'local', '3']

@LCL
D=M
@3
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
//['push', 'constant', '123']

@123
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['call', 'Sys.add12', '1']

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
@Sys.add12
0, JMP
(RETLABEL2)
//['pop', 'temp', '0']

@5
D=A
@0
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
//['push', 'local', '2']

@LCL
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
//['push', 'local', '3']

@LCL
D=M
@3
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'local', '4']

@LCL
D=M
@4
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
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
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
//['function', 'Sys.add12', '0']

(Sys.add12)
//['push', 'constant', '4002']

@4002
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '0']

@0
D=A
@P_THIS551
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME556
0;JMP
(P_THIS551)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME556)
@SP
M=M-1
//['push', 'constant', '5002']

@5002
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['pop', 'pointer', '1']

@1
D=A
@P_THIS575
D;JEQ
@SP
A=M-1
D=M
@THAT
M=D
@RESUME580
0;JMP
(P_THIS575)
@SP
A=M-1
D=M
@THIS
M=D
(RESUME580)
@SP
M=M-1
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
//['push', 'constant', '12']

@12
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['add']

@SP 
A=M-1
D=M 
@SP 
M=M-1
@SP 
A=M-1
M=M+D
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
