# Easier navigation.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Python
alias clearpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias serve='python -m SimpleHTTPServer'
alias jsonify='python -mjson.tool'

# Aliases - Docker
alias dc='docker-compose'
alias dm='docker-machine'
alias dx='docker exec -it'
alias dc-dev='docker-compose -f docker-compose-dev.yml'
alias dc-prod='docker-compose -f docker-compose-prod.yml'

# Screen
alias screen-list="screen -ls"
alias screen-attach="screen -dRR"

# Vagrant
alias v='vagrant'
alias vup='vagrant up'
alias vssh='vagrant ssh'
alias vin='vagrant up && vagrant ssh'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vr='vagrant reload'
alias vp='vagrant provision'

# Git
alias gb='git blame'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gm='git merge'
alias gp='git push'
alias gr='git rebase'
alias gs='git status'
alias gref='git reflog'
alias gshow='git show'

# Golang
alias gob='godep go build'

# Elixir
alias mc='mix compile'
alias mdg='mix deps.get'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
    export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
    colorflag="-G"
    export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Update all the things
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; pip install --upgrade pip'

# Flush DNS
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
