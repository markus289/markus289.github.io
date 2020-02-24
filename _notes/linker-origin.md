---
layout: default
title: Using $ORIGIN in Makefiles
---

## {{ page.title }}

[Source](http://blog.linuxgamepublishing.com/tag/linker/)

Hi again, and welcome to our next technical article. This is a mix of
technical and legal, but as I know many of us in the open source
community are very serious about the licences we work under, I thought
you would like a little background reading to lead you up to a really
neat and little-known feature of the GNU linker (ld) that we have just
adopted.

For years, LGP has been working with libraries such as SDL, ffmpeg, and
others that are licensed under the LGPL (GNU Lesser General Public
License). Without these invaluable tools from the open source community,
LGP would not exist, and nor would hundreds of open source projects.

The LGPL states that an application that links against an LGPL library
is not bound by the LGPL itself, but then goes on to qualify this, and
make exceptions, and even itself states that the boundaries between what
counts as simply linking against a library, and what counts as a
derivative work, are 'not precisely defined by law'.

The problem we have always faced is finding a way to make sure the game
is portable. To do this you MUST make sure that you are using a known
version of as many libraries as you possibly can. There is no point in
exhaustively testing a game against SDL 1.2.12 when next week SDL 1.2.13
comes out, changes a few of our assumptions, and means the game crashes.
Multiply the problem by the number of versions a library has, multiplied
by the number of libraries a game links against, and you can see why
this is a big problem. And so, we like to make sure we build the game,
test the game, and run the game, all against exactly the same libraries
as the end user will use, in as many cases as is possible.

Since the beginning of commercial Linux games, the common practice has
been to create a release of each game such that there was a static and a
dynamic linked version of the game in each release. The dynamic version
of the game would be completely in compliance with the word and spirit
of the LGPL, using the users own system libraries, while the static
linked version of the game was released because linking the libraries
directly into the game ensured we knew which libraries were being used.
The statically linked executable though, was really not very much in the
spirit of the LGPL. We always got away with it because we included the
exact same game in full LGPL compliance,and because of the wording of
the LGPL, it was fairly ambiguous as to whether this was allowed. But
even so, we were never happy with it. Loopholes are not something to be
proud of using.

There was another method of course. The other method involved forcing
the game, via the `LD_LIBRARY_PATH` to use libraries in a certain
directory. However that had issues of its own. To do this you either
have to tell the user 'before you start your game type this long command
into the commandline' or you start the game from a shellscript.
Shellscripts are all well and good, but they bring problems of their
own, such as (for security) making changes to the euid, resetting values
from `/etc/profile`, and of course, assuming that the shell in use has
exactly the same syntax as the shell at the time of release. It was
decided that because of this, and many other issues, starting from a
shellscript was too much of a risk for portability and was ruled out.

And so, we were left with the method that has been being used for the
last 12 or so years. That is until recently, when we found a nice new
way to fix this problem once and for all.

Most people are probably unaware of the linker option, -rpath. Most of
you don't ever need to be. This option lets you tell an application
where to look for libraries. It works just like adding a new path into
the `LD_LIBRARY_PATH`. Great, but it doesn't really help like that. It is
set at compile time and so we would need to restrict installation to a
known directory on everyone's machine. Obviously unacceptable for most
users.

And so the problem remained until one of our devteam discovered a neat
little trick that isn't even documented in the manual for the linker.
You can use a special keyword `$ORIGIN` to say 'relative to the actual
location of the executable'. Suddenly we found we could use `-rpath
$ORIGIN/lib` and it worked. The game was loading the correct libraries,
and so was stable and portable, but was also now completely in the
spirit of the LGPL as well as the letter!

For those of you a little newer to compiling under Linux, some of you
may not even be aware you use the ld linker. It is done automatically by
gcc for you. If you are simply using gcc in a Makefile, it is a little
more difficult in syntax, but as a hint you would change an example
Makefile line that started like this

    gcc obj1.o obj2.o -o my_application

to be

    gcc -Wl,-rpath,\$$ORIGIN/lib/ obj1.o obj2.o -o my_application

So, that's the neat little trick I thought I'd like to share with you,
maybe it will help some of you out there to organise the way your
projects run, as of course it isn't just useful for closed source, this
is useful for any project that has to use a specific library version in
order to work properly!
