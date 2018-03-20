#!/bin/bash

PARAMS="3 1000"
NICE_LOG="logs/nice-runs.csv"

mkdir -p logs

echo "actual_time, expected_time, pid, niceness, delay, iterations, total delay" > $NICE_LOG
for (( u=-20; u<=19; u++ ))
do
    nice -n $u ../out/timer_usleep $PARAMS 1 >> $NICE_LOG &	
done


