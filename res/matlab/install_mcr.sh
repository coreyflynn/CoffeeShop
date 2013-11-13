#!/bin/bash
wget -O /home/vagrant/mcr/MCR_R2012a_glnxa64_installer.zip http://www.mathworks.com/supportfiles/MCR_Runtime/R2012a/MCR_R2012a_glnxa64_installer.zip
unzip -d /home/vagrant/mcr/ /home/vagrant/mcr/MCR_R2012a_glnxa64_installer.zip
sh /home/vagrant/mcr/install -inputFile /vagrant/res/matlab/installer_input.txt
chmod -R 755 /xchip
