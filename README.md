# CakePHP Test
CakePHP is a PHP framework. They offer a [tutorial](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/installation.html) that creates a basic content management website. This is a repo that I'm using as I follow along.

# Initial setup

`mkdir cakephp`
Get a folder for a new project

`git init`
Created a new git repo

 - added empty README.md
 - added Vagrant file for first commit
 - added remote for new github repo
 - committed and pushed while empty

## Vagrant

`vagrant init`
First thing I did was set up Vagrant.

`mkdir /setup`
Added vagrant related files:
 - bootstrap.sh (commands to prepare vm for cakephp)
 - db.sql (default sql file for initial db setup with bootstrap)
 - apache.conf (config for apache web server to work)

`vagrant up`
Getting the VM up and running to prepare for CakePHP install
Also set up .gitignore file
 - .vagrant directory: it is generated by vagrant
 be github repo
 - composer.phar: it is a file downloaded when running setup/bootstrap.sh

## CakePHP

Following allow with [CMS tutorial - installation](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/installation.html)

`vagrant ssh`
`cd /vagrant`
Checking requirements on vagrant vm:
- php version is ok (5.6.0 is minimum, vm uses 5.6.30)
- composer.phar is ok (Composer version 1.6.5 2018-05-04 11:44:59)

### Getting CakePHP

`sudo php composer.phar create-project --prefer-dist cakephp/app cms`
This is a one time code generation for cakePHP. Composer isn't supposed to run
as root however it can't `mkdir cms` while being a linked folder... yay file permissions!

Composer created a directory called cms that's now shared with our main computer.

The next step to setup a dev server on a main machine is not required. Since Vagrant
is running a vm with apache already running, visiting 192.168.94.5 will show the default
status page.

Update the database credentials in /cms/config/app.php to fix the only error

## Deciding what to commit to the git repo

cms directory has a .gitignore file and I incorporated all those files in parent file

Removed the following files:
 - cms/.gitignore
 - cms/.gitattributes
 - cms/.editorconfig

# CMS tutorial

Already did the installation step.

## Creating the database

Copy and pasted as following along with the [tutorial](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/database.html)

## Creating the controller

Following along with the [tutorial](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/articles-controller.html)

## Tags and Users

Following along with the next [tutorial](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/tags-and-users.html)
bake requires sudo

## Authentication

Following along with the last CMS [tutorial](https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/authentication.html)
