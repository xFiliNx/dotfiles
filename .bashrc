#if [ -z "$SSH_CONNECTION" ]; then
    # Define colors
    red='\[\e[0;31;49m\]'
    RED='\[\e[1;31;49m\]'
    blue='\[\e[0;34;49m\]'
    BLUE='\[\e[1;34;49m\]'
    cyan='\[\e[0;36;49m\]'
    CYAN='\[\e[1;36;49m\]'
    yellow='\[\e[0;33;49m\]'
    YELLOW='\[\e[1;33;49m\]'
    green='\[\e[0;32;49m\]'
    GREEN='\[\e[1;32;49m\]'
    white='\[\e[0;37;49m\]'
    WHITE='\[\e[1;37;49m\]'
    NOCOL='\[\e[0m\]'    # no color

#    if [ "$COLORTERM" == "tmux" ]; then
      export TERM=xterm-256color
#    fi
    export EDITOR=vim
    export VIEWER=vim

	shopt -s checkwinsize

	LINE_VERTICAL="\342\224\200"
	LINE_CORNER_1="\342\224\214"
	LINE_CORNER_2="\342\224\224"

	PS1=$green$LINE_CORNER_1$LINE_VERTICAL'('$RED'\u'$YELLOW'@'$CYAN'\h'$green')'$LINE_VERTICAL$LINE_VERTICAL'('$yellow'\w'$green')\n'$LINE_CORNER_2$LINE_VERTICAL$YELLOW'\$ '$NOCOL


    #PROMPT_COMMAND='echo -e "\xe2\x94\x8c""\xe2\x94\x80""(\e[1;31;49m"$USER"\e[1;33;49m@\e[1;36;49m"$(hostname)"\e[0m)""\xe2\x94\x80""\xe2\x94\x80""(\e[1;33;49m"$(pwd)"\e[0m)"'
    #PS1=$LINE_CORNER_2$LINE_VERTICAL$YELLOW'\$ '$NOCOL

	#PS1=$RED'\u'$YELLOW'@'$CYAN'\h:'$yellow'\w'$YELLOW'\$'$NOCOL

	date
    cd ~
	# Aliases
    alias ..='cd ..'
    # alias rm='rm -i'
    # alias cp='cp -i'
    # alias mv='mv -i'
    alias ls='ls $LS_OPTIONS -G'
    alias ll='ls $LS_OPTIONS -l'
    alias l='ls $LS_OPTIONS -lA'
    #alias top='htop'
	alias weather='curl -4 wttr.in/Korolev'
	#if [ -f /usr/local/bin/grc ]; then
        alias ping="grc --colour=auto ping"
        alias ls="grc --colour=auto ls"
        #alias traceroute="grc --colour=auto traceroute"
        alias make="grc --colour=auto make"
        alias diff="grc --colour=auto diff"
        alias cvs="grc --colour=auto cvs"
        alias netstat="grc --colour=auto netstat"
        alias logc="grc cat"
        alias tail="grc tail"
        alias logh="grc head"
    #fi
    #alias tail="tail $0 | /usr/local/bin/colorize"
    #export GREP_OPTIONS='--color=auto'
    #export GREP_COLOR='1;33'
    # export PATH="/usr/local/lib/cw:$PATH"
    [[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
            source /usr/local/share/bash-completion/bash_completion.sh
    # Functions
function ff() {
  find . -type f -iname '*'$*'*' -ls;
}
#function _exit () {
#    echo -e "ХАЯ!"
#}
#trap _exit EXIT
screenfetch
