#!/bin/bash

rconHost='localhost'
rconPort='25576'
rconPass='JrvX3gKwNaVEgbcm2fQxnV9FCdzDnrTQ'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 5 minutes.'

sleep 240

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 1 minute.'

sleep 30

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cServer rebooting in 30 seconds.'

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

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'stop'

