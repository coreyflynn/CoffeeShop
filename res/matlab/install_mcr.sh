#!/bin/bash
wget -O /home/vagrant/mcr/MCR_R2012a_glnx86_installer.zip http://www.mathworks.com/supportfiles/MCR_Runtime/R2012a/MCR_R2012a_glnx86_installer.zip
unzip -d /home/vagrant/mcr/ /home/vagrant/mcr/MCR_R2012a_glnx86_installer.zip
sh /home/vagrant/mcr/install -inputFile /vagrant/res/matlab/installer_input.txt
