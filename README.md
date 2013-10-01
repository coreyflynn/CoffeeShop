![Coffee Shop](/res/img//CoffeeShop.png)

CoffeeShop
==========

All you need to create a VM for Connectivity Map analysis using vagrant and virtualbox

How do I install it?
====================

CoffeeShop depends on a working install of both [virtualbox](https://www.virtualbox.org/) and [vagrant](http://www.vagrantup.com/)

How do I use it?
================
Once you have virtualbox](https://www.virtualbox.org/) and [vagrant](http://www.vagrantup.com/) installed, just clone this repository and type

```
vagrant up
```

in the CoffeeShop directory.  Vagrant will whip up a virtual machine for you and once it is done you can log into it with

```
vagrant ssh
```

I'm done working (for now)
==========================
stop your VM with 

```
vagrant halt
```

or 

```
vagrant suspend
```

and restart it later with

```
vagrant up
```

Something went Wrong!
=====================
if something goes wrong when you

```
vagrant up
```

try re-provisioning the machine with

```
vagrant provision
```

this will install dependencies that didn't install the first time through

