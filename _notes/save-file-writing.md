---
layout: default
title: Save file writing
---

## {{ page.title }}

[Source](https://bugs.edge.launchpad.net/ubuntu/+source/linux/+bug/317781/comments/54)

OK, so let me explain what's going on a bit more explicitly. There are
application programmers who are rewriting application files like this:

    1.a) open and read file ~/.kde/foo/bar/baz
    1.b) fd = open("~/.kde/foo/bar/baz", O_WRONLY|O_TRUNC|O_CREAT) --- this truncates the file
    1.c) write(fd, buf-of-new-contents-of-file, size-of-new-contents-of-file)
    1.d) close(fd)

Slightly more sophisticated application writers will do this:

    2.a) open and read file ~/.kde/foo/bar/baz
    2.b) fd = open("~/.kde/foo/bar/baz.new", O_WRONLY|O_TRUNC|O_CREAT)
    2.c) write(fd, buf-of-new-contents-of-file, size-of-new-contents-of-file)
    2.d) close(fd)
    2.e) rename("~/.kde/foo/bar/baz.new", "~/.kde/foo/bar/baz")

What emacs (and very sophisticated, careful application writers) will do is this:

    3.a) open and read file ~/.kde/foo/bar/baz
    3.b) fd = open("~/.kde/foo/bar/baz.new", O_WRONLY|O_TRUNC|O_CREAT)
    3.c) write(fd, buf-of-new-contents-of-file, size-of-new-contents-of-file)
    3.d) fsync(fd) --- and check the error return from the fsync
    3.e) close(fd)
    3.f) rename("~/.kde/foo/bar/baz", "~/.kde/foo/bar/baz~") --- this is optional
    3.g) rename("~/.kde/foo/bar/baz.new", "~/.kde/foo/bar/baz")

The fact that series (1) and (2) works at all is an accident. Ext3 in
its default configuration happens to have the property that 5 seconds
after (1) and (2) completes, the data is safely on disk. (3) is the
***only*** thing which is guaranteed not to lose data. For example, if
you are using laptop mode, the 5 seconds is extended to 30 seconds.

Now the one downside with (3) is that fsync() is a heavyweight
operation. If your application is stupid, and has hundreds of dot files
in your home directory, each one taking up a 4k disk block even though
it is only storing 4 to 12 bytes of data in each singleton dot file, and
you have to repeat (3) for each of your one hundred dot files --- and
worse yet, your application for some stupid, unknown reason is writing
all of these hundred+ dot files every few seconds, then (3) will be very
painful. But it is painful because the application is stupidly written
--- not for any fundamental filesystem fault. It's like if you had a
robot which was delivering mail to mail box numbers 1, 2, 3, 4, 5, and
crossing the street for each mail box; on a busy road, this is unsafe,
and the robot was getting run over when it kept on jaywalking --- so you
can tell the robot to only cross at crosswalks, when the "walk" light is
on, which is safe, but slow --- OR, you could rewrite the robot's
algorithsm so it delieveres the mail more intelligently (i.e., one side
of the street, and then cross, safely at the crosswalk, and then do the
other side of the street).

Is that clear? The file system is not "truncating" files. The
application is truncating the files, or is constantly overwriting the
files using the rename system call. This is a fundamentally unsafe thing
to do, and ext3 just happened to paper things over. But *both* XFS and
ext4 does delayed allocation, which means that data blocks don't get
allocated right away, and they don't get written right away. Btrfs will
be doing delayed allocation as well; all modern filesystems will do
this, because it's how you get better performance. Applications are
expected to use fsync() or fdatasync(), and if that impacts their
performance too much, to use a single berkdb or other binary database
file, and not do something stupid with hundreds of tiny text files that
only hold a few bytes of data in each text file.
