"""
Jhonatan da Silva
Last Updated version :
Tue Mar 21 21:34:55 2017
Number of code lines: 
27
"""
import sys
import subprocess 
import os
import glob 
fileName = sys.argv[1]
msg = sys.argv[2]
print('executing git command')

allFiles  = glob.glob('*.py')
test = False
for files in allFiles:
    if 'test_' in files:
        test = True
if test:
    subprocess.call('/home/hphesto/anaconda3/bin/pytest -v --capture=no -k "not slow"',shell=True)
    op = input('proceed ? [y | n]\n')
    if op == 'n':
        print('Not addded and commited to git')
    elif op == 'y':
        subprocess.call('git add ' + fileName,shell=True)
        subprocess.call('git cm -m "' + msg  +'"', shell=True)
    else:
        print('wrong input')
else:
    subprocess.call('git add ' + fileName,shell=True)
    subprocess.call('git cm -m "' + msg  +'"', shell=True)
