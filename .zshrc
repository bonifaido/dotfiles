# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody" #dieter

# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew battery ruby rvm mvn lein sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:~/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin

export NODE_PATH=/usr/local/lib/node_modules

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Aliases
# ls
alias ll="ls -l -G"
alias la="ls -la -G"
alias lrt="ls -lrt -G"
alias lart="ls -lart -G"

# os
alias cpus="sysctl -n hw.ncpu"
alias hdd="df -h"
alias filesize="stat -f \"%z bytes\""

# ssh
alias ssh="ssh -XC"

# ip
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# development
alias code="cd ~/Code"
alias ldd="otool -L"

# git
alias undopush="git push -f origin HEAD^:master"

# diff
alias diff="opendiff"

# HTTP
alias GET="curl"
alias PUT="curl -X PUT"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -aoE \"Host\: .*|GET \/.*\""
alias server="open http://localhost:8080/ && python -m SimpleHTTPServer 8080"

# empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Java
heapdump() { jmap -dump:live,format=b,file=heapdump_$1.hprof $1 ; }

# youtube-dl
youtube-mp3() { youtube-dl --extract-audio --audio-format mp3 --audio-quality 192k $1 ; }

# to-mp3
to-mp3() { ffmpeg -i $1 -q:a 1 ${1%%.*}.mp3 }

# disk-speed
disk-speed() {
  tstfile=/tmp/tstfile.$RANDOM
  print "Write speed: " $(dd if=/dev/zero bs=1024k of=$tstfile count=1024 2>&1 | awk '/sec/ {print $1 / $5 / 1048576, "MB/sec" }')
  purge
  print " Read speed: " $(dd if=$tstfile bs=1024k of=/dev/null count=1024 2>&1 | awk '/sec/ {print $1 / $5 / 1048576, "MB/sec" }')
  rm $tstfile
}

# itunes export
export-playlist-here() {  
  java -jar ~/bin/itunesexport.jar -outputDir="$1" -includePlaylist="$1" -copy=FLAT
}
