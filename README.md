# Emacs setup

After using emacs for a bit, I decided to start customizing my init.el. Because I will
probably have to write explanations to myself while I am doing this, I write it in an
org document, init.org, that then exports an init.el file. I saw someone do that in a
youtube [video](https://www.youtube.com/watch?v=Gi7yBMYZylU).


## Exporting the init.el file from the init.org file

Code blocks in the org file are structured as followed:

``` emacs-lisp
#+BEGIN_SRC emacs-lisp :tangle yes
... code ...
#+END_SRC
```

The `tangle` argument means that the code block is exported to the source file. This
will probably mean that it exports to an init.el automatically, because the file name is
derived from the name of the Org file.

The function `org-babel-tangle` tangles the current file. It is bound to `C-c C-v t`.
