# JOTC Website Development Environment

This repo contains a Vagrantfile and provisioning scripts to setup a development environment for the JOTC website and API server.  It will setup the guest OS, install necessary software in the guest, and configure the web server.

## Prerequisites

This requires [Vagrant](https://www.vagrantup.com/) and a virtual machine provider ([VirtualBox](https://virtualbox.org/) 5.0+ recommended; other providers will require tweaks to the Vagrant file).

## Setup

Install the tools listed in the prerequisites above, and [setup your public key with Github](https://help.github.com/articles/generating-ssh-keys/).  Once that's done, proceed with the commands below (from a terminal if using Mac or Linux, or from Git Bash if using Windows).

```bash
git clone git@github.com:JOTC/Vagrant.git
cd Vagrant

git clone git@github.com:JOTC/api-server.git
git clone git@github.com:JOTC/www

cd api-server
npm install

cd ../www
npm install
bower install

vagrant up
```

These steps clone this repository to your machine, move into it, clone the API server and website code repositories, and then starts building the Vagrant virtual machine.  The `vagrant up` command will take some time, as it is downloading an OS image, updating the distro repository cache, installing software, and finally configuring everything.

When this is finished, you're *almost* ready to go.  There is not currently any mechanism for automatically launching the API server, so you will have to do it manually:

```bash
vagrant ssh
cd /vagrant/api-server
npm install
npm start
```

Note that you cannot log out of the Vagrant VM while the API server is running this way.  Feel free to install [psy](https://github.com/substack/psy) and configure it for your own use.

The reason for having to run `npm install` from the API server directory twice is...  complicated.  Running `npm install` from inside the VM is sometimes a problem due to the way VirtualBox handles shared folders, so generally it is advisable to run it from the host machine.  However, one of the dependencies ([sharp](https://github.com/lovell/sharp)) requires some extra system libraries be installed before it can install.  The Vagrant provisioning installs the system libraries, so you can `npm install` sharp from within the VM.  If you would prefer to install it from your host machine, you are more than welcome to figure out how.

Now that the API server is running, the website should be available to you at [http://localhost:8080/](http://localhost:8080/).  You may log into a full administrator account with the username `dev` and password `password` (really clever, huh?).  Security is a non-issue here since this copy of the website is hosted entirely on your machine.