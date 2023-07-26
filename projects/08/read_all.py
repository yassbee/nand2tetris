from pathlib import Path
import sys
import os


def read_in(path, ext) :
    output = []
    files = os.listdir(path)
    for file in files:
        if os.path.isfile(os.path.join(path, file)):
            if str('.') + ext in file:
                output.append(file)
                ##print(file)
    return output



def main (args) :
    path = args[0]
    ext = args[1]
    read_in(path, ext)

if __name__== "__main__" :
    main(sys.argv[1:])


