"""
Jhonatan da Silva
Last Updated version :
Wed Feb  8 21:53:43 2017
Number of code lines: 
93
"""
import sys 
import re
import subprocess

def main():
    c = createCppClass()
    fileName = c.getArg()
    data = c.readFile(fileName)
    c.createClass(data)
    

class createCppClass():
    
    def __init__(self):
        self.labels = []
        self.names = []
        self.fileName = ''

    def getArg(self):

        if len(sys.argv) > 1:
            self.fileName = sys.argv[1]
            return self.fileName 

        else:
            raise ValueError('You must enter an argument, e.g,\
                             filename')

    def readFile(self,path):

        """ assumes file in same path """ 
        with open(path,'r') as f:
            return f.read().splitlines()

    """ sg = setter / getter """  

    def createRoot(self,name,label,sg):
        i = '    '
        if sg == 'get':
            returnedValue = label
            returnThis = '    return this->' + name[:-1] 
            p = ''
        else:
            returnThis = '    this->' + name[:-1] + ' = ' + name 
            returnedValue = ''
            p = label + ' ' + name[:-1] 


        return  i+returnedValue + sg + name[0].upper()\
                +name[1:-1] + '(' +p+ ')'\
                +'\n' + i+'{' + '\n'+ i+returnThis + '\n' + i+'}' 


    def createClass(self,data):
        temp = []
        c = 0
        final = []
        extract = False
        for lines in data:
            search = re.findall('\S+\: *',lines) 
            final.append(lines)
            if extract and c < 2:
                temp.append(lines)

            if len(search) > 0:
                c += 1
                extract = True
        for names in temp:
            self.labels.append(re.findall('\S+  *', names)) 
            self.names.append(re.findall('\S+;', names))
        tests = ['set' , 'get']
        for sg in tests:
            for i,names in enumerate(self.names[:-1]):
                final.append(self.createRoot(self.names[i][0],\
                    self.labels[i][0],sg))

        final.append('\nint main()\n{\n\n}\n')

        with open('temp.cpp','a') as f:
            for lines in final:
                f.write(lines)
                f.write('\n')

        subprocess.call('rm -rf ' + self.fileName,shell=True)
        subprocess.call('mv ' + 'temp.cpp ' + self.fileName,shell=True)


if __name__ == '__main__':
    main()




