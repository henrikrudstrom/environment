
unsetopt LIST_BEEP

# History environment variables
HISTFILE=$HOME/.zsh_hist
HISTSIZE=1100000  # Larger than $SAVEHIST for HIST_EXPIRE_DUPS_FIRST to work
SAVEHIST=1000000

setopt EXTENDED_HISTORY       # Save time stamps and durations
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY        # Constantly share history between shell instances
setopt HIST_IGNORE_DUPS     # Do not enter 2 consecutive duplicates into history
setopt HIST_IGNORE_SPACE    # Ignore command lines with leading spaces
setopt HIST_VERIFY          # Reload results of history expansion before executing
setopt INC_APPEND_HISTORY   # Constantly update $HISTFILE


setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode

### Added by Zinit's installer

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi


source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


#################################################################
# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE
#

turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zcommand() { zinit ice wait"0b" lucid as"command" "${@}"; }
zload()    { zinit load                           "${@}"; }
zlight()   { zinit light                          "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk



turbo0 \
    atload'_zsh_autosuggest_start'\
    atload'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=59"'
zlight zsh-users/zsh-autosuggestions

turbo0; zlight Valodim/zsh-curl-completion
# zinit ice wait lucid as"completion" blockf
# zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
# zinit light-mode lucid wait has"kubectl" for \
#   id-as"kubectl_completion" \
#   as"completion" \
#   atclone"kubectl completion zsh > _kubectl" \
#   atpull"%atclone" \
#   run-atpull \
#     zdharma/null

# zinit ice wait lucid blockf
# zinit light zsh-users/zsh-completions


export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
turbo0; zsnippet "/usr/local/opt/fzf/shell/key-bindings.zsh"

turbo0; zlight zdharma/history-search-multi-word

turbo0; zlight laggardkernel/zsh-thefuck

turbo0 pick'manydots-magic' compile'manydots-magic'
zlight knu/zsh-manydots-magic

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=blue,bold,underline"
turbo0 atload'bindkey "^[[A" history-substring-search-up; bindkey "^[[B" history-substring-search-down'
zlight zsh-users/zsh-history-substring-search

zinit ice trigger-load'!man'
zinit light ael-code/zsh-colored-man-pages
zinit ice trigger-load'!gencomp' pick'zsh-completion-generator.plugin.zsh' atload'zinit creinstall -q "$PWD"'
zlight RobSis/zsh-completion-generator
turbo0; zlight rupa/z

turbo0 pick'fz.sh' \
atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert __fz_zsh_completion)'
zlight changyuheng/fz

turbo0 from'gh-r' as'program'; zlight sei40kr/fast-alias-tips-bin
turbo0; zlight sei40kr/zsh-fast-alias-tips

turbo0; zlight changyuheng/zsh-interactive-cd

turbo2; zlight lukechilds/zsh-nvm
turbo2; zsnippet OMZ::plugins/rbenv/rbenv.plugin.zsh
turbo2 from'gitlab' \
  atload'export PATH="$GOROOT/bin:$PATH"' \
  atload'export PATH="$PATH:$GOPATH/bin"'
zlight "RiverGlide/zsh-goenv"

export COMPLETION_WAITING_DOTS=true
turbo1; zsnippet OMZ::lib/completion.zsh
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

turbo1  atload'FAST_HIGHLIGHT[chroma-man]=' \
  atload"ZINIT[COMPINIT_OPTS]='-i' zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting

zlight pikariop/oblique-strategies-zsh

bindkey '^X' history-incremental-search-forward
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1
export EDITOR=vim

source ~/.zshrc.d/aliases.zsh



export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

print_oblique