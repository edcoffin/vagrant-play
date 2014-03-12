# Install Play Version Manager!

PVM = /usr/local/pvm

mkdir $PVM
mkdir ~/utils/pvm
git clone git://github.com/kaiinkinen/pvm.git ~/utils/pvm
printf "%s\n" "source ~/utils/pvm/pvm.sh" > ~/.bashrc
source ~/utils/pvm/pvm.sh
pvm install 2.2.1
pvm install 2.1.3
pvm alias default 2.2.1
exit