# nodejs-example

# NOT installing node...
I am too lazy to mess with my system's configuration to get node 16 so let's do it lazy way:
1. Use linux - for other operating systems you might need different instruction
2. Install docker
   make sure that you can control docker
   usually you need to do something like `sudo usermod -a -G docker $(id -u -n) && newgrp docker`
3. Install git
4. Clone this repo
   `git clone git@github.com:adderek/nodejs-example.git`
5. Run node 16 :)
   `docker run --rm -u $(id -u) -v $PWD/nodejs-example:/home/node/nodejs-example -it node:16 bash`
   later you can just enter sources directory and execute `./docker.sh` or `sudo ./docker.sh` ;)

