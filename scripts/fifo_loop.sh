#!/bin/bash

# Input parameters and output csv directory
ITERATIONS=1000
RUNS=10
SLEEP_LOG="logs/FIFO-runs-loop.csv"

mkdir -p logs # Create 'logs' folder if not already present

echo "FIFO runs" > $SLEEP_LOG

# Run timer_usleep from 1 to i milliseconds
for ((i=1; i<=$RUNS; i++))
do
    ../out/timer_mod_FIFO 3 $ITERATIONS >> $SLEEP_LOG & # The '&' symbol runs timer_usleep in the background
done
