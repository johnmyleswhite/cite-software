import os

dirs = (
    'icml2007_allpapers/proceedings/icml2007/papers/',
    'icml2009',
    'icml2011',
    'icml2013',
    'icml2015',
)

for dir in dirs:
    for path in os.listdir(dir):
        if path.split('.')[-1] == 'pdf':
            os.system('pdftohtml -xml ' + dir + '/' + path)
