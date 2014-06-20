FORTPY-EL
======

Fortran Auto-Complete and Intellisense for Emacs
------

Fortpy-el provides an lisp package for emacs that integrates with [fortpy](https://github.com/rosenbrockc/fortpy) to provide context-specific auto-completion and intellisense for Fortran 2003, including object oriented constructs. Auto-completion integration currently _only available for emacs_.

### Emacs Package Installation

The emacs package will hopefully be on MELPA soon so it can be downloaded and installed easily. If you don't already have MELPA added to your packages list, you can execute the following in your `*scratch*` buffer (using `C-x C-e`.

```lisp
;; Standard package.el + MELPA setup
;; (See also: https://github.com/milkypostman/melpa#usage)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
```

Once MELPA is on your package-archives list, execute `M-x package-install RET fortpy RET`. After installing the package in emacs, add the following lines to your `.emacs` file.

```lisp
;; Standard fortpy.el setting
(add-hook 'f90-mode-hook 'fortpy-setup)
(setq fortpy-complete-on-percent t)
(setq fortpy-complete-on-bracket t)
```

### Troubleshooting the Installation

If you have trouble installing automatically from MELPA, you can also try a manual installation:

1. Install the emacs dependencies [EPC](https://github.com/kiwanami/emacs-epc), [auto-complete](https://github.com/auto-complete/auto-complete) and [python-environment](https://github.com/tkf/emacs-python-environment)using the package manager in emacs. _NOTE:_ [pos-tip](http://www.emacswiki.org/emacs/pos-tip.el) is also required, but you probably have it already.
2. Download the fortpy-el repository and extract it to your emacs load path.
3. Add (autoload 'fortpy-setup "fortpy" nil t) in your emacs configuration.
4. Run `M-x fortpy-install-server RET`

**NOTE:** when you run `fortpy-install-server`, emacs will use `pip install` to add the fortpyepcserver.py to the default virtualenv managed by python-environment for emacs. As part of that setup, `pip` will also install [fortpy](https://github.com/rosenbrockc/fortpy) and its dependencies into the virtualenv.

If you are having trouble getting `fortpy-install-server` to work, manually run `pip install --upgrade virtualenv` and `pip install --upgrade epc` outside of emacs. Then delete the _~/.emacs.d/.python-environments/default/_ folder and re-run `fortpy-install-server`.

Screenshots
------

Here are some of the things you can do once Fortpy is integrated with Emacs using fortpy.el:

![Automatic Signature Suggestions](../master/docs/screenshots/signature.png "Help with call signatures of functions and subroutines.")

Help with call signatures of functions and subroutines.

![Embedded Member Suggestions](../master/docs/screenshots/completion.png "Completion suggestions for both methods and variables embedded in user-defined types.")

Completion suggestions for both methods and variables embedded in user-defined types.

![Bracket Complete Embedded Methods](../master/docs/screenshots/bracket_complete.png "Documentation strings for methods embedded in user-defined types")

Documentation strings for methods embedded in user-defined types.
 
Usage
------

Fortpy-el together with the Fortpy backend provide context specific auto-complete suggestions out-of-the-box for existing codes. However, to get the full benefit of the intellisense, you need to add [XML Documentation Tags](https://github.com/rosenbrockc/fortpy/wiki/XML-Documentation-Standard) to your Fortran code files that describe the methods, types, members and variables in more detail.