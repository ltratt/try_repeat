#! /bin/sh

set -euf

test "$(./try_repeat 3 echo 1)" = "1
1
1"

test "$(./try_repeat -v 3 echo 1)" = "===> 1: echo 1
1
===> 2: echo 1
1
===> 3: echo 1
1"

t=`mktemp`
./try_repeat 1 echo "a  b" > $t
test "`cat $t`" = "a  b"
