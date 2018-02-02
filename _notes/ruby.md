---
layout: default
title: Ruby
---

# {{ page.title }}

Install to home directory
-------------------------

Using `gem` to install a package to your home directory:

    $ gem install --user-install jekyll
    $ export PATH=$PATH:$HOME/.gem/ruby/2.1/bin

You may also always install to your home directory by creating a
`$HOME/.gemrc` with the following content:

    gem: --user-install
