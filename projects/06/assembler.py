import sys
import re


## symtables (stolen from random Github repos)
compute_eval = {
    "0": "0101010",
    "1": "0111111",
    "-1": "0111010",
    "D": "0001100",
    "A": "0110000",
    "!D": "0001101",
    "!A": "0110001",
    "-D": "0001111",
    "-A": "0110011",
    "D+1": "0011111",
    "A+1": "0110111",
    "D-1": "0001110",
    "A-1": "0110010",
    "D+A": "0000010",
    "D-A": "0010011",
    "A-D": "0000111",
    "D&A": "0000000",
    "D|A": "0010101",
    "M": "1110000",
    "!M": "1110001",
    "-M": "1110011",
    "M+1": "1110111",
    "M-1": "1110010",
    "D+M": "1000010",
    "D-M": "1010011",
    "M-D": "1000111",
    "D&M": "1000000",
    "D|M": "1010101"
    }
dest_eval = {
    "null": "000",
    "M": "001",
    "D": "010",
    "A": "100",
    "MD": "011",
    "AM": "101",
    "AD": "110",
    "AMD": "111"
    }

pre_sym_eval = {
        "SP": "0",
			"LCL": "1",
			"ARG": "2",
			"THIS": "3",
			"THAT": "4",
			"R0": "0",
			"R1": "1",
			"R2": "2",
			"R3": "3",
			"R4": "4",
			"R5": "5",
			"R6": "6",
			"R7": "7",
			"R8": "8",
			"R9": "9",
			"R10": "10",
			"R11": "11",
			"R12": "12",
			"R13": "13",
			"R14": "14",
			"R15": "15",
			"SCREEN": "16384",
			"KBD": "24576",
            }

jump_eval = {
    "null": "000",
    "JGT": "001",
    "JEQ": "010",
    "JGE": "011",
    "JLT": "100",
    "JNE": "101",
    "JLE": "110",
    "JMP": "111"
    }


## parse line to get rid of comments and whitespace
def proc_line(line) :
    line = line.strip()
    length = len(line)
    if length == 0:
        return ''
    if line[0:2] == "//" : 
        return ''
## cool way to parse
    line = re.search("^.*?(?=$|\/)", line).string

## pedestrian way to parse 
    ##start = 0
    ##while start < length :
    ##    if line[start] == "/":
    ##        return line[0:start]
    ##    else:
    ##        start += 1
    return line

##read-in file and extract instructions
def read_in_file(filename) :
    collection = []
    output = []
    with open(filename) as f:
        for line in f:
            line = proc_line(line)  
            if line:
                output.append(line)
    return output

## Pad's string for A instruction
def make_A(string) :
    b = string.find("b")
    string =  string[b+1:]
    l = len(string)
    while l < 16 :
        string = "0" + string
        l += 1
    return string

##parses and concatenates C commands
def make_C(string):
    dest = "000"
    comp = 0
    jump = "000"
    location_eq = string.find("=")
    location_jmp = string.find(";")
    if  location_eq > 0:
        dest = dest_eval[string[0:location_eq]]
        comp = compute_eval[string[location_eq+1:]]
    elif location_jmp > 0:
        comp = compute_eval[string[0]]
        jump = jump_eval[string[location_jmp+1:]]
    return (str(111) + str(comp) + str(dest) + str(jump))

## generates code and handles variables on the second pass
def gen_code (command_list, sym_table) :
    output = []
    cur_var = 16
    for command in command_list:
        if command[0] == "@":
            if command[1:].isdigit():
                string = bin(int(command[1:]))
                output.append(make_A(string))
            else :
                if command[1:] in sym_table :
                    string = bin(int(sym_table[command[1:]]))
                else:
                    print(command)
                    sym_table[command[1:]] = cur_var
                    string = bin(int(sym_table[command[1:]]))
                    cur_var += 1
                output.append(make_A(string))
        else:
            if command[0] != "(" :
                string = make_C(command)
                output.append(make_C(command))
    return output

## generates symtable with labels
def pop_sym_table(commands, pre_sym_eval) :
    sym_table = pre_sym_eval
    counter = 0
    for c in commands :
        ##print(c, counter)
        if c[0] == "(":
            if c not in sym_table:
                sym_table[c[1:-1]] = counter
        if c[0] != "(":
            counter += 1
    return sym_table






def gen_file(bins, in_file) :
    pos = in_file.find(".")
    filename = in_file[0:pos]
    filename = filename + ".hack"
    print(filename)
    f = open(filename, 'w+') 
    for bin in bins :
        f.write(bin + "\n")
    f.close()
    



def main(args) :
    filename = args[0]
    commands = read_in_file(filename)
    sym_table = pop_sym_table(commands, pre_sym_eval)
    bins = gen_code(commands, sym_table)
    gen_file(bins, filename)



if __name__== "__main__" :
    main(sys.argv[1:])


