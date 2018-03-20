#!/bin/bash

RUNS=10
SLEEP_LOG="logs/sleep-runs.csv"

mkdir -p logs

echo "actual_time, expected_time, pid, niceness, delay, iterations, total delay" > $SLEEP_LOG

for ((i=1; i<=$RUNS; i++))
do

    ../out/timer_usleep $i 1000 1 >> $SLEEP_LOG &
  
done
