---
layout: default
title: cups
---

## {{ page.title }}

### Print multiple pages on one sheet

[(Source)](http://www.cups.org/documentation.php/options.html)
Print four pages on one sheet, no duplex:

    $ lp -o number-up=4 -o Duplex=None -o number-up-layout=btlr -o page-border=single print.pdf

Valid options are as follows.

    -o number-up=1
    -o number-up=2
    -o number-up=4
    -o number-up=6
    -o number-up=9
    -o number-up=16

    -o number-up-layout=btlr Bottom to top, left to right
    -o number-up-layout=btrl Bottom to top, right to left
    -o number-up-layout=lrbt Left to right, bottom to top
    -o number-up-layout=lrtb Left to right, top to bottom (default)
    -o number-up-layout=rlbt Right to left, bottom to top
    -o number-up-layout=rltb Right to left, top to bottom
    -o number-up-layout=tblr Top to bottom, left to right
    -o number-up-layout=tbrl Top to bottom, right to left

    -o page-border=double draw two hairline borders around each page
    -o page-border=double-thick draw two 1pt borders around each page
    -o page-border=none do not draw a border (default)
    -o page-border=single draw one hairline border around each page
    -o page-border=single-thick draw one 1pt border around each page

### Adding Ricoh MP C3001

    lpadmin -p MPC3001 -E -v ipp://xxx.xxx.xxx.xxx/printer -P $PWD/MPC3001.ppd
    lpadmin -d MPC3001

Depending on the PPD, set the following options.

    lpadmin -p MPC3001 -o Finisher=FinKING
    lpadmin -p MPC3001 -o PageSize=A4
    lpadmin -p MPC3001 -o Duplex=DuplexNoTumble
    lpadmin -p MPC3001 -o StapleLocation=UpperLeft
    lpadmin -p MPC3001 -o OptionTray=2Cassette
