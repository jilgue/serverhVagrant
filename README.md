# serverhVagrant

## Software necesario:
* Virtualbox
* Vagrant

## Pasos para arrancar un proyecto:
* Clonar el projecto en la carpeta projects de tu home: `cesar@serverh:/var/git/callepuzzle.git`
* Cargar submódulos: `git submodule update`
* Bajarse la imagen de virtualbox: https://hubic.com/home/pub/?ruid=aHR0cHM6Ly9sYjEuaHViaWMub3ZoLm5ldC92MS9BVVRIXzcxZmRkNzg0NDhlYTcwNWZkMGYzMTA4N2FjMDU4NWQxL2RlZmF1bHQvLm92aFB1Yi8xNDIyOTkwNDExXzE0MjM4NTQ0MTE/dGVtcF91cmxfc2lnPTcyOTlkOThjMDE4OWFmOGY2ZWE3YzQyZTk5NDU3MzU5ZjEyYTVhMzEmdGVtcF91cmxfZXhwaXJlcz0xNDIzODU0NDEx#
* Clonar el repo: `git clone https://github.com/jilgue/serverhVagrant.git` (en la misma carpeta donde está la imagen)
* Arrancar máquina: `vagrant up`
* Provisionar máquina: `vagrant up`
* Añadir en el /etc/hosts `192.168.56.102 www.callepuzzle.com callepuzzle.com`
* NOTA: comentar la línea del hosts cuando se quiera visitar la web real



Issue: https://github.com/jilgue/serverhVagrant/issues/1
