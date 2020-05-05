# dotfiles

Some of my dotfiles for your further amusement.

If you want them nicely managed just `yadm clone` them.
[yadm](https://github.com/TheLocehiliosan/yadm) is a dotfile manager I endorse.

Usage
-----

1. Install (using [yadm], which is effectively just a dope wrapper around git):

```sh
case "${OSTYPE:?}" in
  linux*)   sudo apt install -y yadm ;;
  darwin*)  brew install yadm ;;
esac
```

2. Clone:

```sh
yadm clone --bootstrap 'git@github.com:devhammed/dotfiles.git'
```

3. Enjoy!
