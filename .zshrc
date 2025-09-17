# ~/.zshrc file for zsh interactive shells.

# PLUGINS

#git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
#git clone https://github.com/tom-doerr/zsh_codex.git ~/.zsh/zsh_codex

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#source ~/.zsh/zsh_codex/zsh_codex.plugin.zsh

setopt autocd              # Permet de changer de dossier simplement en tapant son nom, sans avoir à écrire cd.
#setopt correct            # auto-corrige les erreurs de frappe
setopt interactivecomments # Permet d'ajouter des commentaires en mode interactif
setopt magicequalsubst     # Permet l'expansion des noms de fichiers pour les arguments de la forme ‘anything=expression’
setopt nonomatch           # Masque le message d'erreur s'il n'y a pas de correspondance pour le motif
setopt notify              # Signale immédiatement l'état des travaux en arrière-plan
setopt numericglobsort     # Trie les noms de fichiers numériquement lorsque cela a du sens
setopt promptsubst         # Permet l'expansion des commandes dans les prompts
setopt sharehistory        # Partage l'historique des commandes entre les sessions zsh
setopt incappendhistory    # Ajoute les commandes à l'historique
setopt histfindnodups      # Ne pas afficher les doublons lors de la recherche dans l'historique
#setopt rmstarsilent        # Ne pas afficher d'erreur si rm ne trouve pas de fichiers correspondant au motif
#setopt extendedglob        # Permet l'utilisation de motifs d'expansion avancés
#setopt globdots            # Inclut les fichiers et dossiers cachés dans les expansions

#permet de faire des ctrl + left/right pour se déplacer mot par mot dans les chemin avec des /
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# enlève le signe de fin de ligne (%) dans le prompt Zsh
PROMPT_EOL_MARK=""

# configuration des touches
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space

bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action
bindkey '^X' create_completion

# activation de l'autocomplétion
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# configuration de l'historique
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # supression de l'ancienne commande en cas de doublon
setopt hist_ignore_dups       # ignorer les commandes en double
setopt hist_ignore_space      # ignorer les commandes précédées d'un espace
setopt hist_verify            # vérifier la commande avant de l'ajouter à l'historique
#setopt share_history         # partager l'historique entre les sessions

# forcer l'affichage de l'historique complet
alias history="history 0"

# configuration du format de temps
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# si le programme lesspipe existe, l'utiliser pour pré-traiter les fichiers avant de les afficher avec less
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Gestion de la couleur du prompt

# set a fancy prompt (non-color, unless we know we "want" color)
# Détecter si le terminal supporte les couleur
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# forcer l’activation des couleurs dans le prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Fonction de configuration du prompt

configure_prompt() {

    #bleu blue
    #vert green
    #jaune yellow
    #rouge red
    #cyan cyan
    #magenta magenta

    prompt_color1="red"
    prompt_color2="blue"
    prompt_color3="red"

    #https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-bash-ps1-prompt/124409#124409

    case "$PROMPT_ALTERNATIVE" in
        twoline)

            git_branch() {
                prompt_symbol2="•"

                local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
                if [ -n "$branch" ]; then
                    echo "%b%F{$prompt_color3} %b${prompt_symbol2} %b%F{$prompt_color2}$branch"
                fi
            }

            set_prompt() {
                prompt_symbol="•"

                # Définition de la variable PROMPT
                PROMPT="%b%F{$prompt_color1}┌──("  # Couleur et symbole de début de ligne

                # Ajout du nom d'utilisateur, du symbole de prompt et du nom de la machine
                PROMPT+="%b%F{$prompt_color2}%n"
                PROMPT+="%F{$prompt_color3} %b$prompt_symbol "
                PROMPT+="%F{$prompt_color2}%m"
                PROMPT+="%B"$(git_branch)

                # Ajout du chemin actuel avec gestion de la longueur
                PROMPT+="%b%F{$prompt_color1}"
                PROMPT+=")-["
                PROMPT+="%B%F{reset}%(6~.%-1~/…/%4~.%5~)"
                PROMPT+="%b%F{$prompt_color1}"
                PROMPT+="]"

                PROMPT+=$'\n' # retour à la ligne

                # Nouvelle ligne pour la commande
                PROMPT+="└─%b%F{$prompt_color2}$%b%F{reset} "
            }

            precmd_functions+=(set_prompt)

            # Right-side prompt with exit codes and background processes
            #RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
        oneline)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
        backtrack)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
    esac
    unset prompt_symbol
}

PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes


if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    configure_prompt

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls -X --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -lhXa --color=auto'
alias la='ls -A'
alias l='ls -CF'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# MES ALIASES

function cs () {
    cd "$@" && ls
}

# Git alias
gitacp() {
  git add .
  git commit -m "$1"
  git push origin HEAD
}

alias nano="vim"
alias cls="ls -lhXa --color=auto | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

#alias pipsetup="python -m venv venv && source venv/bin/activate && pip install -r requirements.txt"
alias pipsetup='python -m venv venv && source venv/bin/activate && [ -f requirements.txt ] || touch requirements.txt && pip install -r requirements.txt'
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"

alias k="kubectl"
alias kgp="kubectl get pods -o wide"
#alias k1='kubectl --kubeconfig=/home/user/k1/kubeconfig.yaml'

#autre alias super utile
alias path='echo -e ${PATH//:/\\n}' # afficher le PATH avec un dossier par ligne
alias myip='curl ifconfig.me ; echo' # afficher mon IP publique
alias ports='sudo netstat -tulanp' # afficher les ports utilisés
alias portsused='lsof -i -P -n | grep LISTEN' # afficher 
alias today='date +"%Y-%m-%d"' # afficher la date du jour au format YYYY-MM-DD
alias topcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head' # afficher les processus qui consomment le plus de CPU
alias topmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head' # afficher les processus qui consomment le plus de mémoire
alias untar='tar -zxvf' # pour les fichiers .tar.gz
alias h='history'
alias j='jobs -l' #liste des jobs en cours

