
import sys
import re
from read_all import read_in


instr_len = { 'push_constant': 7, "eq_func":22, "lt_func": 22, "gt_func": 22, "add_func":8, "sub_func":8, "neg_func":3, "and_func":8, "or_func":8, "not_func":3, 'push_local':11, 'pop_local':14, 'push_this':11, 'pop_this':14, 'push_that':11, 'pop_that':14, 'push_argument':11, 'pop_argument':14, 'push_temp':7, 'pop_temp':7, 'push_pointer':18, 'pop_pointer':17, 'pop_static':7, 'push_static':0, 'label_func':0, 'ifgoto_func':5, 'goto_func':2, 'return_func':55, 'call_func':49  }

cmd_singleton = {'add_func', 'sub_func', 'neg_func', 'eq_func', 'gt_func', 'lt_func','or_func', 'not_func'}
cmd_pointer = {'push_pointer', 'pop_pointer'}
cmd_pushpop = {'push_this', 'pop_this', 'push_local', 'pop_local', 'push_argument', 'pop_argument', 'push_that', 'pop_that', 'push_temp', 'pop_temp', 'push_constant', 'pop_constant'}

cmd_progflow = {'label_func', 'ifgoto_func', 'goto_func' }
cmd_static = {'pop_static', 'push_static'}

cmd_function = {'function_func'}
cmd_call = {'call_func'}
cmd_return  = {'return_func'}

label_counter = 0;

                
                    

## parse line to get rid of comments and whitespace
def proc_line(line) :
    line = line.strip()
    length = len(line)
    if length == 0:
        return ''
    if line[0:2] == "//" : 
        return ''
## cool way to parse
    ##line = re.search("^.*?(?=$|\/)", line).string

 ##pedestrian way to parse 
    start = 0
    while start < length :
        if line[start] == "/":
            return line[0:start]
        else:
            start += 1
    return line


def read_in_file_1(filename) :
    output = []
    with open(filename) as f:
        for line in f:
            line = proc_line(line)  
            if line:
                print (line)
                output.append(line.split())
    return output



def read_in_file(path) :
    collection = []
    output = []
    with open(path) as f:
        for line in f:
            line = proc_line(line)  
            if line:
                print(line)
                output.append(line.split())
    return output

## Memory Access 
def push_constant(num) :
    push_cmd = ['D=A', '@SP ', 'A=M ', 'M=D ', '@SP ', 'M = M+1 ']
    initial = "@" + str(num)
    push_cmd.insert(0, initial)
    return push_cmd 

def push_local(index) : 
    push_cmd = [ '@LCL',
                'D=M',
                '@'+str(index),
                'D=D+A',
                'A=D',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1' ]
    return push_cmd

def pop_local(index) :
    pop_cmd = [ '@LCL',
               'D=M',
               '@' + str(index),
               'D=D+A',
               '@R13',
               'M=D',
               '@SP',
                'A=M-1',
              'D=M',
               '@R13',
               'A=M',
               'M=D',
               '@SP',
               'M=M-1' ]
    return pop_cmd

def push_this(index) : 
    push_cmd = [ '@THIS',
                'D=M',
                '@'+str(index),
                'D=D+A',
                'A=D',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1' ]
    return push_cmd

def pop_this(index) :
    pop_cmd = [ '@THIS',
               'D=M',
               '@' + str(index),
               'D=D+A',
               '@R13',
               'M=D',
               '@SP',
                'A=M-1',
              'D=M',
               '@R13',
               'A=M',
               'M=D',
               '@SP',
               'M=M-1' ]
    return pop_cmd

def push_argument(index) : 
    push_cmd = [ '@ARG',
                'D=M',
                '@'+str(index),
                'D=D+A',
                'A=D',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1' ]
    return push_cmd

def pop_argument(index) :
    pop_cmd= [ '@ARG',
               'D=M',
               '@' + str(index),
               'D=D+A',
               '@R13',
               'M=D',
               '@SP',
                'A=M-1',
              'D=M',
               '@R13',
               'A=M',
               'M=D',
               '@SP',
               'M=M-1' ]
    return pop_cmd


def push_that(index) : 
    push_cmd = [ '@THAT',
                'D=M',
                '@'+str(index),
                'D=D+A',
                'A=D',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1' ]
    return push_cmd


def pop_that(index) :
    pop_cmd = [ '@THAT',
               'D=M',
               '@' + str(index),
               'D=D+A',
               '@R13',
               'M=D',
               '@SP',
                'A=M-1',
              'D=M',
               '@R13',
               'A=M',
               'M=D',
               '@SP',
               'M=M-1' ]
    return pop_cmd

def push_temp(index) :
    push_cmd = [ '@5',
                'D = A',
                '@' + str(index),
                'D=D+A',
                'A=D',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1']
    return push_cmd


def pop_temp(index) :
    pop_cmd = [
            '@5',
            'D=A',
            '@' + str(index),
            'D=D+A',
            '@R13',
            'M=D',
            '@SP',
            'A=M-1',
            'D=M',
            '@R13',
            'A=M',
            'M=D',
            '@SP',
            'M=M-1']
    return pop_cmd  

def push_pointer(choice, counter):
    jmp_loc = counter + 11
    loc_res = counter + 16
    push_cmd = [ '@'+ str(choice),
               'D=A',
                '@P_THIS' + str(jmp_loc),
                'D;JEQ',
                '@THAT',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
               '@RESUME' + str(loc_res),
               '0;JMP',
               '(' + 'P_THIS' + str(jmp_loc) + ')',
                '@THIS',
                'D=M',
                '@SP',
                'A=M',
                'M=D',
              '(' + 'RESUME' + str(loc_res) + ')', 
                '@SP',
                'M=M+1' ]
    return push_cmd

def pop_pointer(choice, counter) :
    jmp_loc = counter + 11
    loc_res = counter + 16
    pop_cmd = [ '@' + str(choice),
               'D=A',
               '@P_THIS' + str(jmp_loc),
               'D;JEQ',
               '@SP',
               'A=M-1',
               'D=M',
               '@THAT',
               'M=D',
               '@RESUME' + str(loc_res),
               '0;JMP',
               '(' + 'P_THIS' + str(jmp_loc) + ')',
               '@SP',
               'A=M-1',
               'D=M',
              '@THIS', 
               'M=D',
              '(' + 'RESUME' + str(loc_res) + ')', 
               '@SP',
               'M=M-1', ]
    return pop_cmd

def pop_static(index,filename) :
    pop_cmd = [ '@SP',
               'A=M-1', 
               'D=M',
              '@f.' + filename + str(index),
               'M=D',
               '@SP',
               'M=M-1' ]
    return pop_cmd

def push_static(index,filename) :
    push_cmd  = [ '@f.' + filename + str(index),
                 'D=M',
                 '@SP',
                 'A=M',
                 'M=D',
                 '@SP',
                 'M=M+1']

    return push_cmd
               


## Arithmetic Commands

def add_func(counter) :
    output = ['@SP ', 'A=M-1', 'D=M ', '@SP ', 'M=M-1', '@SP ', 'A=M-1' , 'M=M+D']
    return output


def sub_func(counter) : 
    output = ['@SP ', 'A=M-1', 'D=M ', '@SP ', 'M=M-1', '@SP ', 'A=M-1' , 'M=M-D']
    return output

def and_func(counter ) :
    output = ['@SP ', 'A=M-1', 'D=M ', '@SP ', 'M=M-1', '@SP ', 'A=M-1' , 'M=M&D', ]
    return output

def or_func(counter) :
    output = ['@SP ', 'A=M-1', 'D=M ', '@SP ', 'M=M-1', '@SP ', 'A=M-1' , 'M=M|D']
    return output

def not_func(counter) :
    output = ["@SP", "A=M-1", "M = !M"] 
    return output

def neg_func(counter) :
    output = ["@SP", "A=M-1", "M = -M"] 
    return output

def eq_func(counter) :
    loc_eq = counter + 18
    loc_res = counter + 22
    output = [ 
              '@SP',
              'A=M-1',
              'D=M',
              '@SP',
              'M=M-1',
              '@SP',
              'A=M-1',
              'D=M-D',
              '@SP',
              'M=M-1',
              '@' + 'EQUAL' + str(loc_eq), 
              'D;JEQ',
              '@SP',
              'A=M',
              'M=0',
              '@' + 'RESUME' + str(loc_res), 
              '0;JMP',
              '(' + 'EQUAL' + str(loc_eq) + ')', 
              '@SP',
              'A=M',
              'M=-1',
              '(' + 'RESUME' + str(loc_res) + ')', 
              '@SP',
              'M=M+1',

              ]
    return output
              


def lt_func(counter) :
    print("got here")
    loc_lt= counter + 17
    loc_res = counter + 20
    output = [ 
              '@SP',
              'A=M-1',
              'D=M',
              '@SP',
              'M=M-1',
              '@SP',
              'A=M-1',
              'D=M-D',
              '@SP',
              'M=M-1',
              '@' + 'SMALLER' + str(loc_lt), 
              'D;JLT',
              '@SP',
              'A=M',
              'M=0',
              '@' + 'RESUME' + str(loc_res), 
              '0;JMP',
              '(' + 'SMALLER' + str(loc_lt) + ')', 
              '@SP',
              'A=M',
              'M=-1',
              '(' + 'RESUME' + str(loc_res) + ')', 
              '@SP',
              'M=M+1',

              ]
    return output


def gt_func(counter) :
    loc_lt= counter + 17
    loc_res = counter + 20
    output = [ 
              '@SP',
              'A=M-1',
              'D=M',
              '@SP',
              'M=M-1',
              '@SP',
              'A=M-1',
              'D=M-D',
              '@SP',
              'M=M-1',
              '@' + '' + str(loc_lt), 
              'D;JGT',
              '@SP',
              'A=M',
              'M=0',
              '@' + 'RESUME' + str(loc_res), 
              '0;JMP',
              '(' + 'SMALLER' + str(loc_lt) + ')', 
              '@SP',
              'A=M',
              'M=-1',
              '(' + 'RESUME' + str(loc_res) + ')', 
              '@SP',
              'M=M+1',

              ]
    return output

## Program flow
def label_func (name) : 
    label_name = name
    output = ['(' + label_name + ')' ]
    return output

def ifgoto_func(name) : 
    output = [ '@SP', 'A=M-1', 'D=M', '@SP', 'M=M-1','@' + str(name), 'D;JNE']
    return output

def goto_func(name) :
    output = ['@' + str(name), '0;JMP']
    return output


## Function calls

def function_func (name, numargs) :
    output = []
    output.extend(label_func(name))
    for i in range(int(numargs)) : 
        output.extend(push_constant(0))
    return output

def return_func() :
    ##restore caller registers
    def rest_seg(segname) :
        offsets = { 'THAT': 1, 'THIS' : 2, 'ARG': 3, 'LCL': 4}
        offval = offsets[segname]
        rest_out = [ 
                    '@R11',
                    'D=M',
                    '@'+ str(offval),
                    'D = D-A',
                    'A=D',
                    'D=M',
                    '@' + segname,
                    'M=D' ] 
        return rest_out
    output = [ 
              ## store FRAME
              '@LCL',
              'D=M',
              '@R11',
              'M=D',
            ## store RET
              '@5',
              'A=D-A',
              'D=M',
              '@R12',
              'M=D',
              ## *ARG = pop() 
              '@SP',
              'A=M-1',
              'D=M',
              '@ARG',
              'A=M',
              'M=D',
            ##SP = ARG +1
              '@ARG',
              'D=M',
              '@SP',
              'M=D+1',
              ] 
    output.extend(rest_seg('THAT'))
    output.extend(rest_seg('THIS'))
    output.extend(rest_seg('ARG'))
    output.extend(rest_seg('LCL'))
    output.extend(['@R12', 'A=M', '0;JMP'])


    return output

def call_func (funcname, numargs) :
    global label_counter
    new_lbl = 'RETLABEL' + str(label_counter)
    label_counter += 1
    def push_reg (type) :
        output = [
                '@' + type,
                'D=M',
                '@SP',
                'A=M',
                'M=D',
                '@SP',
                'M=M+1']
        return output
    asm = [
            '@' + new_lbl,
            'D=A',
            '@SP',
             'A=M',
             'M=D',
             '@SP',
             'M=M+1']
    ##asm.extend(push_reg(new_lbl))
    asm.extend(push_reg('LCL'))
    asm.extend(push_reg('ARG'))
    asm.extend(push_reg('THIS'))
    asm.extend(push_reg('THAT'))
    asm.extend([
        '@SP',
        'D=M',
        '@5',
        'D=D-A',
        '@' + str(numargs),
        'D=D-A',
        '@ARG',
        'M=D'
        ])
    asm.extend([ 
        '@SP',
        'D=M',
        '@LCL',
        'M=D',
        ])
    asm.extend([
        '@' + funcname,
        '0, JMP',
        '(' + new_lbl + ')',
        ])
    return asm

def boot_func() :
    asm = [
            '@256',
            'D=A',
            '@SP',
            'M=D',
            ]
    asm.extend(call_func("Sys.init",0))
    return asm
        
   

##extract instruction symbol
def extract_instr (instruction) :
    if len(instruction) == 1:
        return instruction[0] + "_func"
    elif instruction[0] in {'label', 'if-goto', 'goto', 'function', 'call', 'return'} :
       instr = instruction[0] + "_func"
       return instr.replace('-','')
    else : 
        return "_".join(instruction[:2]) 

def generate_ass(vm_instructions, filename) :
    output = []
    counter = 0
    output.extend(boot_func()) 
    counter += 53 
    for instruction in vm_instructions : 
        ## arithmetic instructions (add, sub, and, ...)
        instr = extract_instr(instruction) ## converts instructions into commands and arguments
        if instr in cmd_singleton :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](counter))
            counter += instr_len[instr]
        ## memory management 
        elif instr in cmd_pointer:
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](int(instruction[2]), counter))
            counter += instr_len[instr]
        elif instr in cmd_pushpop :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](int(instruction[2])))
            counter += instr_len[instr]
        ## program flow
        elif instr in cmd_progflow :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](instruction[1]))
            counter += instr_len[instr]
        elif instr in cmd_function :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](instruction[1], int(instruction[2])))
            counter += 1 + int(instruction[2])*instr_len['push_local']
        elif instr in cmd_call :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](instruction[1], int(instruction[2])))
            counter += instr_len[instr]

        elif instr in cmd_return :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr]())
            counter += instr_len[instr]
        elif instr in cmd_static :
            output.append('//' + str(instruction[0:]) + '\n')
            output.extend(globals()[instr](instruction[2], filename))
            counter += instr_len[instr]
    return output



def gen_file(ass_out, in_file) :
    pos = in_file.find(".")
    filename = in_file[0:pos]
    filename = filename + ".asm"
    f = open(filename, 'w+') 
    for instr in ass_out :
        f.write(instr + "\n")
    f.close()

def main (args) :
    path = args[0]
    ext = args[1]
    files = read_in(path, ext)
    asm = []
    for file in files:
        vm_contents = read_in_file(path+'/'+file)
        asm.extend(generate_ass(vm_contents, file))
    index = path[:-1].rfind('/')
    filename = path[index+1:] 
    gen_file(asm, filename)


if __name__== "__main__" :
    main(sys.argv[1:])

