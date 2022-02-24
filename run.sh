#!/bin/bash

rconHost='localhost'
rconPort='25575'
rconPass='JrvX3gKwNaVEgbcm2fQxnV9FCdzDnrTQ'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass "$1"
