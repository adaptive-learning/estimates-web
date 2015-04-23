#!/bin/sh
# deployment script run by Viper server after push

echo "Starting deploy script"
A="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
B="/mysite"
DIR=$A$B

cd $DIR

#requirements
pip install -r $DIR/requirements.txt

# database
python $DIR/manage.py syncdb
python $DIR/manage.py migrate

# static files
python $DIR/manage.py collectstatic --noinput
