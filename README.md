# try_repeat

`try_repeat` tries to run a command *n* times, exiting early if the command
exits with a non-zero exit code. This is useful when trying to find
intermittent failures in a command.


# Usage

```sh
try_repeat [-ehv] <count> <command> [<arg1> ... <argn>]
```

Options:

 * `-e` Sets an environment variable `TRY_REPEAT_I` with the current execution
    number. Starts at 1.
 * `-v` Print out the iteration number before executing `<command>`.

`try_repeat` exits with the exit code of the last iteration of `<command>`.


# Examples

```sh
$ try_repeat 3 ls /etc/motd
/etc/motd
/etc/motd
/etc/motd
$ echo $?
0
$ try_repeat 3 ls /doesntexist
ls: /doesntexist: No such file or directory
$ echo $?
1
$ try_repeat -v 3 ls /etc/motd
===> 1: ls /etc/motd
/etc/motd
===> 2: ls /etc/motd
/etc/motd
===> 3: ls /etc/motd
/etc/motd
```
