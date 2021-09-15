import os
from os.path import join, dirname
from dotenv import load_dotenv
from dotenv.main import dotenv_values

def getenvirontment(envi='development'):
    if envi == 'staging':
        return '.env.staging'
    if envi == 'production':
        return '.env.production'
    return '.env.development'
 
dotsetup_path = join(dirname(__file__), '.env.setup')
load_dotenv(dotsetup_path)
 
# Accessing variables.
MODE = os.getenv('MODE')

# print(MODE)
dotenv = getenvirontment(MODE)
#print(dotenv)

dotenv_path = join(dirname(__file__), dotenv)
environtmens = dotenv_values(dotenv_path)
#load_dotenv(dotenv_path)

#get all keys and set to global variables

for k,v in environtmens.items():
    globals()[k] = v

# globals()['URL_TARGET'] = os.getenv('URL_TARGET')
# globals()['URL_BROWSER'] = os.getenv('URL_BROWSER')
# globals()['USERNAME'] = os.getenv('USERNAME')
globals()['MODE']   = MODE
globals()['RUNNING_ON'] = '--headless' if MODE == 'staging' or MODE == 'production' else '-incognito'


# for param in os.environ.keys():
#     print("%s: %s " % (param, os.environ[param]))