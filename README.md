# Vagrant Dev Box for the Play Framework

Dev box built on Ubuntu 12.04LTS with:

* PostgreSQL 9.3
* OpenJDK 7
* Mongodb
* Play Version Manager

## Requirements

* [Vagrant](http://www.vagrantup.com) (only tested on 1.5)
* [Virtual Box](https://www.virtualbox.org) (only tested on 4.3.8)
* 2Gb spare ram for the VM
* Vagrant plugins [see installation instructions]
* If using Windows you will need an SSH utility, and it's recommended you setup NFS for faster shared folder file access - see [NFS for Vagrant on Windows](http://www.jankowfsky.com/blog/2013/11/28/nfs-for-vagrant-under-windows/)

## Installation

* Install Vagrant, and Virtual Box
* clone this repo
* run the following commands:

`$ git submodule init`
`$ git submodule update`
`$ vagrant plugin install vagrant-librarian-chef-nochef`
`$ vagrant up` 	Gets base image, provisions it. See Vagrant documention for more info!

To get a simple Play application up and running one might do the following:

`$ vagrant ssh`	Login into box
`$ > pvm ls` List versions of play installed
`$ > pvm install 2.2.1` Install a version of Play, sets as default.
`$ > cd /projects` Shared folder for projects
`$ > play new Hello`	Create new Play project
`$ > play run`	Visit app using host browser @ localhost:9001
`$ > exit` Exit VM SSH session

## Structure

`/chef/Cheffile` - defines the cookbooks chef_solo uses during provisioning
`/VagrantFile` - defines the Vagrant box: networking, scripts, and chef provisioning.
`/projects` - Store your Play projects here
`/util/pvm` - home for [pvm](https://github.com/kaiinkinen/pvm). Play versions are stored on your host system and are not destroyed with the box.
`/log` - accessible from /vagrant_log or /vagrant/log - log storage

## Usage

This provides a unified development environment that can be shared amongst team members. You will likely continue to write code on your host machine, using which ever tools you normally do. I also keeping your source control workflow on the host machine.

I imagine the VM will be used to run the play application, perform tests, and host the databases.

The databases should be available to host connections - e.g. running pgAdmin on your host OS, by connecting to localhost:[forwarded port number]. See the Vagrant file for the list of forwarded port numbers.


