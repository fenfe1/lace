# Lace

Experiment in using PHP inheritance and traits.

## Getting started

### Requirements

You will need to the following local software depending on the environment you wish to target:

#### All environments

* Mac OS X
* [Ansible](http://www.ansible.com) `brew install ansible`

#### Development (local)

  * [VMware Fusion](http://vmware.com/fusion) `brew cask install vmware-fusion`
  * [Vagrant](http://vagrantup.com) `brew cask install vagrant`
  * [Host manager](https://github.com/smdahlen/vagrant-hostmanager) and [Vagrant VMware](http://www.vagrantup.com/vmware) plugins `vagrant plugin install vagrant-hostmanager && vagrant plugin install vagrant-vmware-fusion`
  * You have a private key `id_rsa` and public key `id_rsa.pub` in `~/.ssh/`
  * You have an entry like [1] in your `~/.ssh/config`

[1] SSH config entry

```shell
Host calcifer-*
    ForwardAgent yes
    User app
    IdentityFile ~/.ssh/id_rsa
    Port 22
```

### Local/Development

VMs are managed using Vagrant and configured by Ansible.

```shell
$ git clone git@github.com:fenfe1/lace.git
$ lace/provisioning/local_setup.sh lace

$ cd lace
$ vagrant up

$ ssh calcifer-lace-dev-node1
$ cd /app
$ composer install

$ cd /app/src
$ php lace.php

$ logout
```
