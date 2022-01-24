#!/bin/bash

#/var/minecraft/mcrcon/mcrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'lwc admin expire 180 days'

#sleep 120

/var/minecraft/mcrcon/mrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'lwc admin cleanup'

sleep 120

/var/minecraft/mcrcon/mrcon -H localhost -P 25575 -p a8Haw76Oaj2e9WJ2b 'co purge t:90d'
