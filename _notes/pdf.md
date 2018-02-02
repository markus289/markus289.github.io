---
layout: default
title: PDF
---

# {{ page.title }}

Compress a PDF using Ghostscript
--------------------------------

    # small
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
    # medium
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

Create empty page
-----------------

    echo "" | ps2pdf -sPAPERSIZE=a4 - blank-a4.pdf
    echo "" | ps2pdf -sPAPERSIZE=letter - blank-letter.pdf

Put two pages on one
--------------------

    pdfnup --landscape --nup 2x1 --openright true out.pdf
