#!/bin/bash

# Input parameters and output csv directory
PARAMS="1000 2"
RUNS="99"
FIFO_LOG="logs/fifo-runs.csv"

mkdir -p logs/fifo # Create 'logs' folder if not already present

# csv headings
echo "actual_time, expected_time, pid, niceness, delay, iterations, total delay" > $FIFO_LOG

for (( c=10; c<=$RUNS; c++ ))
do
    if (( "$c" == 17 )) 
    then
        ../out/timer_mod_FIFO $PARAMS yes > logs/fifo/log-${c}.csv &
    else
	../out/timer_usleep $PARAMS yes > logs/fifo/log-${c}.csv & 
    fi

done

wait

cat logs/fifo/*.csv >> $FIFO_LOG 
#rm -r logs/fifo



