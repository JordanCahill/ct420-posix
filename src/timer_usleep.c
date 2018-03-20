#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    struct timeval tv;
    struct timezone tz;
    int i, delay, num_iter, pid, priority;
    double init, start, stop;

    if (argc < 3) { // Case where user doesn't enter enough arguments
        fprintf(stderr, "Usage: %s <sleep time..msec> <num_iteration>\n", argv[0]); 
        exit(1);
    }

    // progname=argv[0];
    delay = atoi(argv[1]); // parse arg 1 as an int
    num_iter = atoi(argv[2]); // parse arg 2 as an int
    pid = getpid(); // get priority id
    priority = getpriority(PRIO_PROCESS, pid); // use pid to get priority

    // initial time ref for the actual run-time
    gettimeofday(&tv, &tz);
    init = tv.tv_sec + tv.tv_usec * 0.000001;

    for (i = 0; i < num_iter; ++i) {

	// get start time
        gettimeofday(&tv, &tz);
        start = tv.tv_sec + tv.tv_usec * 0.000001;

        // Now sleep
        usleep(delay * 1000);

	// get stop time
        gettimeofday( &tv, &tz);
        stop = tv.tv_sec + tv.tv_usec * 0.000001;

    }

    if(argc == 4) {
        // Print values to CSV
        // actual_time, expected_time, pid, niceness, delay, iterations, total 		   delay
        printf("%lf, %d, %d, %d, %d, %d, %lf\n", (stop - init) * 1000, num_iter*delay, pid, priority, delay, num_iter, ((stop-init) * 1000) - (num_iter*delay));
    }

    if(argc == 3) {
	printf("Actual time taken: %lf, Theoretical time taken (excl. runtime): %d ms, %d \n", (stop - init) * 1000, num_iter * delay, getpid());
    }

    return 0;
}
