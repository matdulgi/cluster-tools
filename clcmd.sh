#!/bin/bash

clcmd_home=$(cd $(dirname $0) && pwd)
clcmd_conf=$clcmd_home/clcmd.conf

echo clcmd home : $clcmd_home

nodes=$(cat $clcmd_conf | grep nodes | cut -d'=' -f2)
echo nodes : $nodes

if [ -z $1 ] ; then
  echo no command
  exit
fi

#curNode=$(hostname)

cmd='$@'

for node in $nodes; do
eval  ssh $node $cmd
done;    
