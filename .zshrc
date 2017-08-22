autoload -U compinit   
compinit -D    
autoload colors && colors   
autoload zcalc     
zstyle ':completion:*' menu yes select 
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
autoload -U pick-web-browser
alias -s html=pick-web-browser

PROMPT="%{$fg[cyan]%}[%~] %{$reset_color%}%(#.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n%{$reset_color%}%{$fg_bold[grey]%}@%m%{$reset_color%}%(?.%{$fg_bold[green]%}.%{$bg[red]%}%{$fg_bold[white]%}) >%{$reset_color%} "
SPROMPT="        Заменить $fg_bold[grey]'$reset_color$fg_bold[red]%R$reset_color$fg_bold[grey]'$reset_color на $fg_bold[grey]'$reset_color$fg_bold[green]%r$reset_color$fg_bold[grey]'$reset_color? ($fg_bold[grey]Y$reset_color$fg_bold[green]es$reset_color, $fg_bold[grey]N$reset_color$fg_bold[red]o$reset_color, $fg_bold[grey]A$reset_color$fg_bold[red]bort$reset_color, $fg_bold[grey]E$reset_color$fg_bold[blue]dit$reset_color) $fg_bold[green]>$reset_color "

bindkey -v

export TERM='xterm-256color'
export EDITOR='vim'
export PAGER='less'
export LC_ALL='ru_RU.UTF-8'
export LANG='ru_RU.UTF-8'
export LC_CTYPE=C
export BLOCKSIZE='Mb'
export GREP_COLOR='1;33'
export LESSCHARSET='UTF-8'
export OOO_FORCE_DESKTOP='gnome'
export LESS_TERMCAP_mb=$'\E[01;31m'       
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  
export LESS_TERMCAP_me=$'\E[0m'           
export LESS_TERMCAP_so=$'\E[38;5;246m'    
export LESS_TERMCAP_se=$'\E[0m'           
export LESS_TERMCAP_us=$'\E[04;38;5;146m' 
export LESS_TERMCAP_ue=$'\E[0m'           

HISTFILE=~/.zsh-history
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY 
setopt histexpiredupsfirst histfindnodups
setopt CORRECT_ALL
setopt AUTO_CD
setopt SH_WORD_SPLIT
setopt IGNORE_EOF
setopt NO_BEEP
setopt extended_glob
setopt correct
setopt MENUCOMPLETE
setopt nohup
setopt ZLE
setopt MULTIBYTE
setopt NUMERIC_GLOB_SORT

alias cpaste="ls /tmp/ccopy.* | sed 's|/tmp/ccopy.||' | xargs -I % mv /tmp/ccopy.% ./%"

alias mv='nocorrect mv -iv'
alias ll='ls -laF'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -iv'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'
alias ls='ls --color=auto'   
alias lsd='ls -ld .*'    
alias lls='ls -alFh --color=auto'
alias grep='grep --color=auto'   
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias -g convKU="| iconv -c -f koi8r -t utf8"  
alias -g convCU="| iconv -c -f cp1251 -t utf8"
alias -g convUK="| iconv -c -f utf8 -t koi8r"  
alias -g convUC="| iconv -c -f utf8 -t cp1251"  
alias df='df -h'
alias du='du -h'
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias dirtree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias -s {txt,log,list}=vim
alias -s {pdf,djvu}="nohup evince"
alias -s {avi,mpeg,mpg,mov,m2v,flv}="nohup totem"
alias -s {ogg,mp3,wav,m3u,pls}="nohup totem"
alias -s {jpg,jpeg,png,gif,tif,tiff,bmp}="nohup eog"

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*::::' completer _expand _complete _correct _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format '> %B%d%b'
zstyle ':completion:*:messages' format '> %d'
zstyle ':completion:*:warnings' format '> Ошибка: нет совпадений для: %d'
zstyle ':completion:*:corrections' format '> %B%d (число ошибок: %e)%b'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:correct:*' prompt 'исправить на:'
zstyle ':completion:*' prompt 'Исправить (число ошибок: %e) > '
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:incremental:*' completer _complete _correct
zstyle ':completion:*:predict:*' completer _complete
zstyle ':mime:*' x-browsers firefox rekonq google-chrome konqueror chromium-browser
zstyle ':mime:*' tty-browsers w3m elinks links lynx
zstyle -e ':completion:*' hosts 'reply=($myhosts)'
zstyle ':completion:*' insert-tab true
zstyle ':completion:*' select-prompt '%SСтрока: %LЭлемент: %M[%p]%s'
zstyle ':completion:*' list-prompt '%SТекущее положение: %p%s'
zstyle ':completion:*' sort true
zstyle ':completion:*' file-sort name
zstyle ':completion:*' keep-prefix changed
zstyle ':completion:*:man:*' separate-sections true
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes select
zstyle ':completion:*' old-menu true
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' word true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:(ssh|scp|ftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp):*' users $users
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
zstyle ':completion:*:*:*:users' ignored-patterns adm apache bin daemon games gdm halt ident junkbust lp mail mailnull named news nfsnobody nobody nscd ntp operator pcap postgres radvd rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

                                                   function dialogrun; { rm -rf $(dialog --separate-output --checklist file 100 100 100 $(for l in $(ls -A); do echo "$l" "$(test -d $l && echo "dir" || echo "file")" 0; done) --stdout); clear  }
                                                   zle -N dialogrun
