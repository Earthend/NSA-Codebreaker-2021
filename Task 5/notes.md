# Loaded the image on docker and found:

+ Email is boman.helen@panic.invalid

	+ Ran `docker image inspect panic-nightly-test` to find all information

+ The git repo was being cloned from https://git-svr-37.prod.panic.invalid/hydraSquirrel/hydraSquirrel.git

	+ Ran `docker run -it panic-nightly-test /bin/sh` to read the bash file's contents

	+ *Great alternative*: `docker cp container_id:/[src] [dest]`  and copy the file

		+ *Used it for downloading the malicious file*


## Steps I took to find the malicious file

1. Read the test file and recgonized the `make` commands were a little strange

2. Sourced the file to find it was in `/usr/bin/make`

3. Ran `Hexdump -C` and `strings` mixed with some display-organization commands to find that this was definitely a shady file



## *Unecessary steps taken because I assumed the build_test.sh was constructed from the malicious file*
#### Still learned a lot, so it was definitely worth it

+ Used the tool [**dive**](https://github.com/wagoodman/dive) to find what files were edited to narrow the search

+ Multitude of methds to try and find discrepencies that were fairly useless

+ Went into the container using a shell and ran `strings` against multiple files to find that they all pointed back to `/lib/ld-musl-x86_64.so.1`.

+ Browsed the file and found that it wasn't the original file, so time to find ones that reference it.

+ Wrote this little beauty to find any files that reference the file but don't have the file as the first line that the other files seemed to always have.

	+ Cmd: `find / -executable 2>/dev/null | xargs sh -c 'for arg do strings "$arg" 2>/dev/null | grep "ld-musl" | grep -v -w -e "^/lib/ld-musl-x86_64.so.1" && echo "$arg"; done'` 
		+ *Outputs the contents of the line and the file's path underneath it*

	+ Cmd: `find / -executable 2>/dev/null | xargs sh -c 'for arg do strings "$arg" 2>/dev/null | grep "ld-musl" | grep -v -w -e "^/lib/ld-musl-x86_64.so.1" &>/dev/null && echo "$arg"; done'` 
		+ *Outputs just the path file path*

	+ Paths:
```
/lib/libc.musl-x86_64.so.1
/lib/ld-musl-x86_64.so.1
/usr/lib/libc.so
/usr/bin/ldd
/usr/bin/g++
/usr/bin/x86_64-alpine-linux-musl-gcc
/usr/bin/cc
/usr/bin/x86_64-alpine-linux-musl-g++
/usr/bin/c++
/usr/bin/x86_64-alpine-linux-musl-gcc-10.2.1
/usr/bin/x86_64-alpine-linux-musl-c++
/usr/bin/cpp
/usr/bin/gcc
```

+ Realized this was going in circles and re-read the prompt.  Realized maybe check what `make` command was since it's weird to see in the file, just to come to the true solution.