#! /bin/bash

# 
# djangopi
# ========
# A simple django installer for raspberry pi users.
# 
# https://github.com/phalt/DjangoPi
# 
# All code is copyright (c) Paul Hallett 2012
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
# 
# 

echo -e "\nUpdating all existing packages...\n"
sudo apt-get -y update

echo -e "\nYou'll be asked to enter a password for the database, don't forget it! \n"
sudo apt-get install -y --force-yes mysql-server 
sudo apt-get install -y --force-yes mysql-client

echo -e "\nInstalling some essential stuff...\n"
echo -e "Installing python essentials\n"
sudo apt-get install -y build-essential python-dev
sudp apt-get instal -y python-virtualenv
sudo apt-get install -y python-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y --force-yes python-mysqldb libmysqlclient-dev

cd ..
virtualenv --no-site-packages .
cd Djangopi/
. ../bin/activate

echo -e "Now we're going to install django and any other packages\n"
sudo pip install -r requirements.txt

echo -e "\nFinally, lets make sure Django is installed properly - this will print the version number if successful\n"
python djangotest.py

deactivate

echo -e "\nDone!\n"
exit 0
