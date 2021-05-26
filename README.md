# docker-m68k-atari-mint-cross-tools
Docker container to use the GCC m68k-atari-mint compiler.


## Building the image 

Docker must me installed.

Then you can build the image with the following command :


```bash
$ docker build --pull --rm -f "Dockerfile" -t docker-m68k-atari-mint-cross-tools:latest "."
```

## Running the container

Go inside a directory containing project or source file.

```bash
robin:~ $ cd dev/atari_c/helloworld/
robin:~/dev/atari_c/helloworld $ ll
total 12
drwxrwxr-x 2 robin robin 4096 mai   26 12:34 ./
drwxrwxr-x 8 robin robin 4096 mars   5 10:26 ../
-rw-rw-r-- 1 robin robin  117 févr.  5 11:09 hello_bb.c
```

Then run the container.

```bash
robin:~/dev/atari_c/helloworld $ docker run -it --rm -v $(pwd):/project docker-m68k-atari-mint-cross-tools
```

## Compiling inside the container 

Let's compile a simple program which is available in the current directory.

```bash
root@7a8bd676bc16:/# cd project
root@7a8bd676bc16:/project# ll
total 12
drwxrwxr-x 2 1000 1000 4096 May 26 10:26 ./
drwxr-xr-x 1 root root 4096 May 26 10:26 ../
-rw-rw-r-- 1 1000 1000  117 Feb  5 10:09 hello_bb.c
root@7a8bd676bc16:/project# m68k-atari-mint-gcc hello_bb.c -o hello_bb.tos
root@7a8bd676bc16:/project# ll
total 144
drwxrwxr-x 2 1000 1000   4096 May 26 10:29 ./
drwxr-xr-x 1 root root   4096 May 26 10:26 ../
-rw-rw-r-- 1 1000 1000    117 Feb  5 10:09 hello_bb.c
-rwxr-xr-x 1 root root 132675 May 26 10:29 hello_bb.tos*
```

The file `hello_bb.tos` has appeared in the current folder.

Then set file owner to the host user in order to manipulate it.

```bash
root@7a8bd676bc16:/project# chown 1000:1000 hello_bb.tos
```

## Running the TOS program with HATARI

The emulator `hatari` must be installed on the host.

```bash
robin:~/dev/atari_c/helloworld $ ll
total 144
drwxrwxr-x 2 robin robin   4096 mai   26 12:29 ./
drwxrwxr-x 8 robin robin   4096 mars   5 10:26 ../
-rw-rw-r-- 1 robin robin    117 févr.  5 11:09 hello_bb.c
-rwxr-xr-x 1 robin robin 132675 mai  26 12:29 hello_bb.tos*
robin:~/dev/atari_c/helloworld $ hatari hello_bb.tos
```


