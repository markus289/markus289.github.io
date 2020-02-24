---
layout: default
title: ffmpeg
---

## {{ page.title }}

### h.264

General information about encoding h.264 is found on the
[ffmpeg website](https://trac.ffmpeg.org/wiki/Encode/H.264).

### Screen capture

Capturing your screen and microphone (replace `front:CARD=PCH,DEV=0`
with the correct device listed in `aplay -L`):

    ffmpeg -y -f alsa -ac 2 -i front:CARD=PCH,DEV=0 -f x11grab -r 30 \
    -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 \
    -acodec pcm_s16le -vcodec libx264 -preset ultrafast -crf 0 \
    -threads 0 output.mkv

*NOTE*: For AAC the bitrate should be the number of channels times 64
kbit/s. E.g. for a file containing 5.1 audio channels it is 384 and for
a stereo file 128.

### Convert FLAC to AAC

Convert a bunch of flac files to AAC using
[GNU parallel](http://www.gnu.org/software/parallel/):

     parallel 'ffmpeg -loglevel error -i {} -vn -c:a libfdk_aac \
    -b:a 128k -movflags +faststart {.}.m4a; rm {}' ::: **/*.flac

### Convert audio in MKV to 2.0 AAC

This converts 5.1 audio to 2.0 while increasing the center channel, which
contains the dialogs.

    parallel 'ffmpeg -loglevel error -i {} -c:v copy \
    -af pan="stereo|FL=1.1*FC+0.40*FL+0.40*BL|FR=1.1*FC+0.40*FR+0.40*BR" \
    -c:a libfdk_aac -b:a 128k -map 0 -movflags +faststart aac/{}' ::: *.mkv

