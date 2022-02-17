#!/bin/bash

rconHost='localhost'
rconPort='25575'
rconPass='JrvX3gKwNaVEgbcm2fQxnV9FCdzDnrTQ'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 5 minutes. The main end island will reset on this reboot.'

sleep 240

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 1 minute. The main end island will reset on this reboot.'

sleep 30

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 30 seconds. The main end island will reset on this reboot.'

sleep 25

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 5 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 4 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 3 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 2 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 1 second.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'endrespawn'

sudo systemctl stop minecraft

rm -f /var/minecraft/server/worlds/world_the_end/DIM1/region/r.0.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/region/r.0.-1.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/region/r.-1.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/region/r.-1.-1.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/entities/r.0.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/entities/r.0.-1.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/entities/r.-1.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/entities/r.-1.-1.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/poi/r.0.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/poi/r.0.-1.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/poi/r.-1.0.mca
rm -f /var/minecraft/server/worlds/world_the_end/DIM1/poi/r.-1.-1.mca

sudo systemctl start minecraft
