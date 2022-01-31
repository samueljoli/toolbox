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
+ Git
+ OpenSSL
+ Chezmoi
    - Will also pull down and setup [dotfiles](https://github.com/Samueljoli/dotfiles)
+ Docker
+ Docker for mac
+ Terraform

Databases
+ Postgres

Languages
+ Node, nvm, & npm

--------- 

> Inspired by [laptop](https://github.com/thoughtbot/laptop)
