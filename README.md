# init

FuliCuli/init is base repository to generate a fully functional development environment.
For now, it configures servers for node.js application but you can easily create your own playbooks to handle others types of need.

Installation
------------

#### Prerequisite

You have to install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (and its Extension Pack) and [Vagrant](https://www.vagrantup.com)

#### Fork it

Instead of clone our repository, [fork it](https://help.github.com/articles/fork-a-repo/).

#### Init your VM

Launch the command :
```
vagrant up
```

It will download and install this [Debian VM](https://vagrantcloud.com/chef/boxes/debian-7.6).

Sync these directories :
* Local ./ with VM /home/init/
* Local ~/.ssh/ with VM /root/.ssh/ and ~vagrant/.ssh/
* Local ../ with VM /var/www/

Then, install [Submodules](https://github.com/FuliCuli/init/blob/master/.gitmodules).

Finally, it will run the [Server Playbook](https://github.com/FuliCuli/init/blob/master/ansible/server.yml).


Configuration
-------------

#### Edit files

Edit the sample configuration by your own into the file [ansible/group_vars/all](https://github.com/FuliCuli/init/blob/master/ansible/group_vars/all).
For the dev environment, you can customize with the file [ansible/host_vars/localhost](https://github.com/FuliCuli/init/blob/master/ansible/host_vars/localhost.dist) (only the dist file will keep in the repository).

#### Connect to your VM over SSH

```
vagrant ssh
```

#### Launch configuration

```
cd /home/init && ansible-playbook -i dev website.yml -t web --connection=local
```


Update
------

#### Keep your fork up to date

```
cd /home/init && git fetch upstream && git merge upstream/master && git submodules update
```

You have to be aware that you can have conflicts, if so, then handle.

#### Update ansible/roles submodule

```
cd /home/init && git submodule foreach git pull -q origin master
```


Need more roles ?
-----------------

[FuliCuli/init](https://github.com/FuliCuli/init) use [FuliCuli/ansible-roles](https://github.com/FuliCuli/ansible-roles) repository to handle ansible roles.
If you need more roles, you can ask [here](https://github.com/FuliCuli/ansible-roles/issues), you can also fork it and make a pull request to add your own roles.