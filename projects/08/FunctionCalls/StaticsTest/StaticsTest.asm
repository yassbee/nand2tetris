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
//['function', 'Class1.set', '0']

(Class1.set)
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
//['pop', 'static', '0']

@SP
A=M-1
D=M
@f.Class1.vm0
M=D
@SP
M=M-1
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
//['pop', 'static', '1']

@SP
A=M-1
D=M
@f.Class1.vm1
M=D
@SP
M=M-1
//['push', 'constant', '0']

@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
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
//['function', 'Class1.get', '0']

(Class1.get)
//['push', 'static', '0']

@f.Class1.vm0
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'static', '1']

@f.Class1.vm1
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
@256
D=A
@SP
M=D
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
@Sys.init
0, JMP
(RETLABEL1)
//['function', 'Sys.init', '0']

(Sys.init)
//['push', 'constant', '6']

@6
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['push', 'constant', '8']

@8
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['call', 'Class1.set', '2']

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
@2
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0, JMP
(RETLABEL2)
//['pop', 'temp', '0', '//', 'Dumps', 'the', 'return', 'value']

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
//['push', 'constant', '23']

@23
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['push', 'constant', '15']

@15
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
//['call', 'Class2.set', '2']

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
@2
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0, JMP
(RETLABEL3)
//['pop', 'temp', '0', '//', 'Dumps', 'the', 'return', 'value']

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
//['call', 'Class1.get', '0']

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
@0
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.get
0, JMP
(RETLABEL4)
//['call', 'Class2.get', '0']

@RETLABEL5
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
@Class2.get
0, JMP
(RETLABEL5)
//['label', 'WHILE']

(WHILE)
//['goto', 'WHILE']

@WHILE
0;JMP
@256
D=A
@SP
M=D
@RETLABEL6
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
(RETLABEL6)
//['function', 'Class2.set', '0']

(Class2.set)
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
//['pop', 'static', '0']

@SP
A=M-1
D=M
@f.Class2.vm0
M=D
@SP
M=M-1
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
//['pop', 'static', '1']

@SP
A=M-1
D=M
@f.Class2.vm1
M=D
@SP
M=M-1
//['push', 'constant', '0']

@0
D=A
@SP 
A=M 
M=D 
@SP 
M = M+1 
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
//['function', 'Class2.get', '0']

(Class2.get)
//['push', 'static', '0']

@f.Class2.vm0
D=M
@SP
A=M
M=D
@SP
M=M+1
//['push', 'static', '1']

@f.Class2.vm1
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
