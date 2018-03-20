#!/bin/bash

# Input parameters and output csv directory
PARAMS="3 1000"
NICE_LOG="logs/nice-runs.csv"

mkdir -p logs # Create 'logs' folder if not already present

# csv headings
echo "actual_time, expected_time, pid, niceness, delay, iterations, total delay" > $NICE_LOG

# Loop through each niceness level
for (( u=-20; u<=19; u++ )) 
do
    # Run timer_usleep with 'u' niceness
    nice -n $u ../out/timer_usleep $PARAMS 1 >> $NICE_LOG & # The '&' symbol runs timer_usleep process in the background
done


