#!/bin/bash
if [ $1 ] && [ $2 ]
then
  rosrun ffha ffha -o $1 -f $2
else
  rosrun ffha ffha -o ./drone_delivery/domain.pddl -f ./drone_delivery/problems/p01.pddl
fi
