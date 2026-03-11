# ~/.zshrc file for zsh interactive shells.

# ── PLUGINS ───────────────────────────────────────────────────────────────────

# Installation :
#   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#   git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
#   git clone https://github.com/tom-doerr/zsh_codex.git ~/.zsh/zsh_codex

[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]         && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]        && source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#[ -f ~/.zsh/zsh_codex/zsh_codex.plugin.zsh ] && source ~/.zsh/zsh_codex/zsh_codex.plugin.zsh

# Configuration des plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

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

# ── OPTIONS ───────────────────────────────────────────────────────────────────

setopt autocd              # change de dossier en tapant son nom sans cd
setopt interactivecomments # permet les commentaires en mode interactif
setopt magicequalsubst     # expansion des noms de fichiers pour 'anything=expression'
setopt nonomatch           # masque l'erreur si aucune correspondance au motif
setopt notify              # signale immédiatement l'état des jobs en arrière-plan
setopt numericglobsort     # trie les noms de fichiers numériquement si pertinent
setopt promptsubst         # expansion des commandes dans les prompts
#setopt correct            # auto-corrige les erreurs de frappe
#setopt extendedglob       # motifs d'expansion avancés
#setopt globdots           # inclut les fichiers cachés dans les expansions
#setopt rmstarsilent       # n'affiche pas d'erreur si rm ne trouve rien

WORDCHARS=${WORDCHARS//\/}                              # ctrl+←/→ s'arrête sur les /
PROMPT_EOL_MARK=""                                      # supprime le % de fin de ligne
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'      # format de la commande time

# ── HISTORIQUE ────────────────────────────────────────────────────────────────

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

setopt sharehistory           # partage l'historique entre les sessions zsh
setopt incappendhistory       # ajoute les commandes à l'historique immédiatement
setopt histfindnodups         # pas de doublons lors de la recherche dans l'historique
setopt hist_expire_dups_first # supprime les anciens doublons en premier
setopt hist_ignore_dups       # ignore les commandes identiques à la précédente
setopt hist_ignore_space      # ignore les commandes précédées d'un espace
setopt hist_verify            # affiche la commande avant de l'exécuter depuis l'historique

# ── COMPLÉTION ────────────────────────────────────────────────────────────────

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

# ── TOUCHES ───────────────────────────────────────────────────────────────────

bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # expansion de l'historique sur espace

bindkey '^U'      backward-kill-line              # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Suppr
bindkey '^[[3~'   delete-char                     # suppr
bindkey '^[[1;5C' forward-word                    # ctrl + →
bindkey '^[[1;5D' backward-word                   # ctrl + ←
bindkey '^[[5~'   beginning-of-buffer-or-history  # page haut
bindkey '^[[6~'   end-of-buffer-or-history        # page bas
bindkey '^[[H'    beginning-of-line               # début de ligne
bindkey '^[[F'    end-of-line                     # fin de ligne
bindkey '^[[Z'    undo                            # shift + tab
bindkey '^P'      toggle_oneline_prompt           # ctrl + P : bascule prompt one-line/two-line

# ── PROMPT ────────────────────────────────────────────────────────────────────

# Détection du chroot
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Détection de la couleur du terminal
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

configure_prompt() {
    prompt_color1="red"
    prompt_color2="blue"
    prompt_color3="red"

    # https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-bash-ps1-prompt/124409#124409

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
                PROMPT="%b%F{$prompt_color1}┌──("
                PROMPT+="%b%F{$prompt_color2}%n"
                PROMPT+="%F{$prompt_color3} %b$prompt_symbol "
                PROMPT+="%F{$prompt_color2}%m"
                PROMPT+="%B"$(git_branch)
                PROMPT+="%b%F{$prompt_color1}"
                PROMPT+=")-["
                PROMPT+="%B%F{reset}%(6~.%-1~/…/%4~.%5~)"
                PROMPT+="%b%F{$prompt_color1}"
                PROMPT+="]"
                PROMPT+=$'\n'
                PROMPT+="└─%b%F{$prompt_color2}$%b%F{reset} "
            }

            precmd_functions+=(set_prompt)
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
    VIRTUAL_ENV_DISABLE_PROMPT=1
    configure_prompt
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt

toggle_oneline_prompt() {
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt

# Titre de la fenêtre du terminal
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
esac

precmd() {
    print -Pnr -- "$TERM_TITLE"
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# ── COULEURS ──────────────────────────────────────────────────────────────────

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:"  # fix couleur des dossiers avec permissions 777

    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

export LESS_TERMCAP_mb=$'\E[1;31m'   # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'      # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'  # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'      # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'   # begin underline
export LESS_TERMCAP_ue=$'\E[0m'      # reset underline

# ── COMMAND-NOT-FOUND ─────────────────────────────────────────────────────────

[ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

# ── ALIASES & FONCTIONS ───────────────────────────────────────────────────────

# Navigation
cs() { cd "$@" && ls; }
alias ls='ls -X --color=auto'
alias ll='ls -lhXa --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias cls="ls -lhXa --color=auto | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

# Recherche & fichiers
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias untar='tar -zxvf'
alias nano="vim"

# Système
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"
alias ports='sudo ss -tulanp'
alias portsused='lsof -i -P -n | grep LISTEN'
alias path='echo -e ${PATH//:/\\n}'
alias myip='curl https://ifconfig.me ; echo'
alias today='date +"%Y-%m-%d"'
alias topcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias topmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias history="history 0"
alias h='history'
alias j='jobs -l'

# Git
gitacp() {
  git add .
  git commit -m "$1"
  git push origin HEAD
}

# Python / uv
# curl -LsSf https://astral.sh/uv/install.sh | sh
command -v uv >/dev/null 2>&1 && alias pip='uv pip'
alias pipsetup='python -m venv venv && source venv/bin/activate && [ -f requirements.txt ] || touch requirements.txt && pip install -r requirements.txt'

uvsetup() {
  RAW_NAME=$(basename "$PWD")

  if command -v iconv >/dev/null 2>&1; then
    # Version avec translitération (accents -> lettres simples)
    PROJECT_NAME=$(echo "$RAW_NAME" \
      | iconv -f UTF-8 -t ASCII//TRANSLIT 2>/dev/null \
      | tr "[:upper:]" "[:lower:]" \
      | tr " " "-" \
      | sed "s/[^a-z0-9-]//g" \
      | sed "s/-\+/-/g" \
      | sed "s/^-//;s/-$//")
  else
    # Fallback simple sans iconv
    PROJECT_NAME=$(echo "$RAW_NAME" \
      | tr "[:upper:]" "[:lower:]" \
      | tr " " "-" \
      | sed "s/[^a-z0-9-]//g" \
      | sed "s/-\+/-/g" \
      | sed "s/^-//;s/-$//")
  fi

  ([ -d .venv ] || uv venv .venv) \
  && source .venv/bin/activate \
  && ([ -f pyproject.toml ] || printf "[project]\nname = \"%s\"\nversion = \"0.1.0\"\nrequires-python = \">=3.11\"\ndependencies = []\n" "$PROJECT_NAME" > pyproject.toml) \
  && uv sync \
  && echo "
[uv] Environnement prêt.

Commandes utiles :
  uv add <pkg>     # ajouter une dépendance (maj pyproject.toml + uv.lock)
  uv remove <pkg>  # retirer une dépendance
  uv sync          # sync l env avec pyproject.toml/uv.lock (comme pip install -r requirements.txt)
  uv run <cmd>     # lancer une commande dans l env (ex: uv run python main.py), évite le \"source .venv/bin/activate\"
  uv pip list      # voir les paquets installés (compat pip)
"
}

# Kubernetes
alias k="kubectl"
alias kgp="kubectl get pods -o wide"
#alias k1='kubectl --kubeconfig=/home/user/k1/kubeconfig.yaml'

# IA
alias cc='claude'
alias gg='gemini'
