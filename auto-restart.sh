#!/bin/bash

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 5 minutes.'

sleep 240

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 1 minute.'

sleep 30

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 30 seconds.'

sleep 25

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 5 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 4 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 3 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 2 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'broadcast &cServer restarting in 1 second.'

sleep 1

systemctl restart minecraft

