# Vagrant Dev Box for the Play Framework

Dev box built on Ubuntu 12.04LTS with:

* PostgreSQL 9.3 [default port 5432 forwards to VM]
* Mongodb [default port 27017 forwards to VM]

## Requirements

* [Vagrant](http://www.vagrantup.com) (only tested on 1.5)
* [Virtual Box](https://www.virtualbox.org) (only tested on 4.3.8)
* 256mb spare ram for the VM
* Vagrant plugins [see installation instructions]
* If using Windows, and you plan to SSH into the VM you will need an SSH utility, and it's recommended you setup NFS for faster shared folder file access - see [NFS for Vagrant on Windows](http://www.jankowfsky.com/blog/2013/11/28/nfs-for-vagrant-under-windows/)

## Installation

* Install Vagrant, and Virtual Box
* clone this repo
* run the following commands:

`$ vagrant plugin install vagrant-librarian-chef-nochef`

`$ vagrant up` 	Gets base image, provisions it. See Vagrant documention for more info! Run this command any time you need to spin up the VM.

`$ vagrant halt` Shuts down the VM.


## Structure

`/chef/Cheffile` - defines the cookbooks chef_solo uses during provisioning

`/VagrantFile` - defines the Vagrant box: networking, scripts, and chef provisioning.

## Usage

This setup provides an environment for us to run DBs in. In the future, we could use these boxes to run all tests in (with JDK and Play).
