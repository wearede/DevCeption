# DevCeption

## Why?
We (Devs) use too many tools for our everyday tasks, from editors to webservers to terminals. This makes switching machines painful. In case of theft, data damage, or simply format-reinstall OS, you need to go through the pain of reinstall reconfigure everytime... Solution to this problem is to have all your dev tools inside a container that can be **created**, **destroyed**, **reproduced** on any machine without a hit to productivity.

With **DevCeption**, you can go from mac to linux to windows and always find your habitual dev environment. This is huge boost to productivity and versatility as Host OS becomes meaningless.

p.s. Also because docker on mac really sucks!

## Goodies

**docker**
- services
- - webserver
- - - nginx
- - - - php generic config (Laravel)
- - - - WordPress optmized config
- - - php5-fpm, php7-fpm
- - - mariadb
- - phpcs, wpcs
- docker-compose

---

**oh-my-zsh**
- plugins: git, history-substring-search, tmux

---

**tmux**

---

**vim**
- vim-quantum
- ctrlp
- vim-vinegar
- vim-gitgutter
- vim-trailing-whitespace
- editorconfig-vim
- delimitMate
- syntastic
- indentLine
- vim-commentary
- vim-polyglot
- matchtagalways
- vim-buftabline
- vim-bracketed-paste
- vim-tmux-focus-events
- vim-tmux-clipboard
- vim-surround
- YouCompleteMe
- ultisnips
- vim-snippets

---

**nvm**
- node lts, gulp

---

**git**
- git-commit-template
- diff-so-fancy

## Host Requirements

- virtualbox
- vagrant
- ansible
- rsync

## Getting Started

## Back Up Your Work

**Warnning:** Running `vagrant up` or `vagrant provision` will overwrite project files in your DevCeption box with the ones on your host. So don't forget to periodically bring back / backup changes to your host machine.

To bring changes from DevCeption to host machine, run these commands on your host In the root DevCeption directory.

```
rsync -vriht DevCeption:/srv/docker/ ./configs/docker/ --delete
rsync -vriht DevCeption:/srv/www/ ./www --delete
```

## Common Issues

- ansible task **Install vim plugins** hangs:
  - *Iterm2* disable `profile -> terminal -> environment -> set locale variable automatically`
  - *oh-my-zsh* uncomment `export LANG=en_US.UTF-8` in `.zshrc` 
