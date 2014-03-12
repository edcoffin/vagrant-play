# Vagrant Dev Box for the Play! Framework

## Requirements

* [Vagrant](http://www.vagrantup.com) (only tested on 1.5)
* [Virtual Box](https://www.virtualbox.org) (only tested on 4.3.8)
* 2Gb spare ram for the VM
* Vagrant plugins [see installation instructions]

## Installation

* Install Vagrant, and Virtual Box
* clone this repo
* run the following commands:

```Shell
% git submodule init
% vagrant plugin install vagrant-librarian-chef-nochef
% vagrant up 	# gets base image, provisions it
```

To get a simple Play! application up and running one might do the following:

```Shell
% vagrant ssh	# login into box
% > pvm ls		# versions of play installed
% > pvm install 2.2.1 	# install a version of Play!
% > cd /projects
% > play new Hello		# create new Play! project
% > play run			# visit app using host browser @ localhost:9001
% > exit
```
## Structure

* /chef/Cheffile - defines the cookbooks chef_solo uses during provisioning
* /VagrantFile - defines the Vagrant box: networking, scripts, and chef provisioning.
* /projects - Store your Play! projects here
* /util/pvm - home for [pvm](https://github.com/kaiinkinen/pvm). Play! versions are stored on your host system and are not destroyed with the box.
* /log - accessible from /vagrant_log or /vagrant/log - log storage
