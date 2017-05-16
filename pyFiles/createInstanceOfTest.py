import re
import sys
import os
fileName = sys.argv[1]
pathFile = os.path.abspath(fileName)
testName = 'test_' + fileName
pathFile = pathFile[:-len(fileName)]
pathFile += testName
allFunc = []
allParameters = []
with open(fileName,'r') as f:
    code = f.read().splitlines()

for lines in code:
    notTestFunctions = ['main','__init__']
    ''' search for anything like
        def someFunction(someParameters):
    '''
    notTestParameters = ['self']
    search = re.findall('def ([^ ]+)',lines)
    if len(search) > 0:
        for p in notTestFunctions:
            if p  in search[0]:
                break
        else:
            ''' splits name of function and parameters '''

            ''' regex : find '(' then start extracting 
                and I don't want the ')' and ':' '''
            funcName = re.findall('^([^ \(]+)',search[0])
            parameters = re.findall('\(([^\):]+)',search[0])
            parameters = parameters[0].split(',')

            newParameters = []
            for p in parameters:
                for notParameter in notTestParameters:
                    if p not in notParameter:
                        newParameters.append(p)
            allFunc.append(funcName)
            allParameters.append(newParameters)

for i,funcName in enumerate(allFunc):
    with open(testName,'a') as newCode:
        funcName = 'def test_' + funcName[0]
        parametrize = '@pytest.mark.parametrize'
        ident = len(parametrize)*' '
        f = parametrize + '('
        string = ''
        for p in allParameters[i]:
            string = string +'"'+p+'"'+ ','  

        f+=string
        f+='\n'
        f = f + ident + '[' + '\n'
        f = f + ident+'('+ len(allParameters[i])*',' + ')' +'\n'+ident + \
            '])'
        args = ''
        totalLen  = len(allParameters[i])-1
        for j,p in enumerate(allParameters[i]):
            if not j == totalLen:
                args = args + p + ','
            else:
                args += p
        f = f + '\n' + funcName + '(' + args + '):' + '\n\n'
        newCode.write(f)
    

