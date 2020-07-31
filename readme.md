# 1. init
version: 0.4

- [1. init](#1-init)
  - [1.1. usage](#11-usage)
  - [1.2. customization](#12-customization)
  - [1.3. TODO](#13-todo)

## 1.1. usage
bash init.sh [all, list, help]
 - all:  install all available sub_inits
 - list: list all available sub inits (does not affect anything)
 - help: shows this help message (does not affect anything)

bash init.sh [sub_inits]
 - this way only the spezified sub_inits get installed

After running an todo.txt file will appear. This file includes further
information on how to finalize initialisation or usefull information 
to get started. 


## 1.2. customization
based on files:
file                       | usage
-------------------------- | --------------------------------------------------------
conf.sh                    | this file must be edited to fit the system
data/package.list          | packages that can be installed with apt
data/vscode_extentions.lit | extentions for Visual Studio Code
data/.zshrc                | zsh configuration file
data/*.zsh-theme           | these files will be moved to the themes foler of ohmyzsh
sub/                       | sub_inits can be shell (.sh) or python (.py) scripts


## 1.3. TODO
 - test if the initialysation was sucsesfull or not
 - add more sub_inits and improve old ones
   - Nim
   - Joplin