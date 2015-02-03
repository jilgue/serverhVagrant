# serverhVagrant

## Software necesario:
* Virtualbox
* Vagrant

## Pasos para arrancar un proyecto:
* Clonar el projecto en la carpeta projects de tu home: `cesar@serverh:/var/git/callepuzzle.git`
* Cargar submódulos: `git submodule update`
* Bajarse la imagen de virtualbox
* Clonar el repo: `git clone https://github.com/jilgue/serverhVagrant.git` (en la misma carpeta donde está la imagen)
* Arrancar máquina: `vagrant up`
* Provisionar máquina: `vagrant up`
* Añadir en el /etc/hosts `192.168.56.102 www.callepuzzle.com callepuzzle.com`
* NOTA: comentar la línea del hosts cuando se quiera visitar la web real



Issue: https://github.com/jilgue/serverhVagrant/issues/1
