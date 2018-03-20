#!/bin/bash

# Input parameters and output csv directory
ITERATIONS=1000
RUNS=10
SLEEP_LOG="logs/sleep-runs.csv"

mkdir -p logs # Create 'logs' folder if not already present

# csv headings
echo "actual_time, expected_time, pid, niceness, delay, iterations, total delay" > $SLEEP_LOG

# Run timer_usleep from 1 to i milliseconds
for ((i=1; i<=$RUNS; i++))
do
    ../out/timer_usleep $i $ITERATIONS 1 >> $SLEEP_LOG & # The '&' symbol runs timer_usleep in the background
done
