all: posix_getres timer_usleep timer_mod_FIFO

clean:
	rm -f out
	mkdir out

posix_getres: src/posix_getres.c
	gcc -o ./out/posix_getres src/posix_getres.c

timer_usleep: src/timer_usleep.c
	gcc -lrt -o ./out/timer_usleep src/timer_usleep.c

timer_mod_FIFO: src/timer_mod_FIFO.c
	gcc -lrt -o ./out/timer_mod_FIFO src/timer_mod_FIFO.c
