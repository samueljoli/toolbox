# MacOS-Dev
A script to set up target macOS machine for web development.


## Install
In a directory designated for storing scripts run:

```bash
curl --remote-name https://raw.githubusercontent.com/samueljoli/toolbox/main/scripts/macOS-dev/script.sh
```

## Run
```bash
sh script.sh 2>&1 | tee ~/macOS-dev.log
```

## What will be installed:
macOS tools
+ Homebrew

Unix tools
+ [kitty](https://sw.kovidgoyal.net/kitty/)
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
+ Install Roboto Font in this directory
