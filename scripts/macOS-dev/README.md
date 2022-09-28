# MacOS-Dev
A script to set up target macOS machine for web development.


## Install
In a directory designated for storing scripts run:

```bash
curl --remote-name https://raw.githubusercontent.com/samueljoli/toolbox/main/scripts/macOS-dev/script
```

## Run
```bash
sh script 2>&1 | tee ~/macOS-dev.log
```

## What will be installed:
macOS tools
+ Homebrew

Unix tools
+ iterm2
+ Git
+ OpenSSL
+ Chezmoi
    - Will also pull down and setup [dotfiles](https://github.com/Samueljoli/dotfiles)
+ Docker
+ Docker for mac
+ Terraform
+ [bat](https://github.com/sharkdp/bat)
+ the_silver_searcher

Databases
+ Postgres

Languages
+ Node, nvm, & npm


## Post install manual
+ Install iterm2 Gruvbox [theme](https://github.com/samueljoli/gruvbox-zsh) and follow instructions.
+ Install Roboto Font in this directory
+ Update Text profiles in iTerm2 so that glyphs work
+ Update cursor color to `a8a521`

--------- 

> Inspired by [laptop](https://github.com/thoughtbot/laptop)
