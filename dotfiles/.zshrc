
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice wait \
    atload'FAST_HIGHLIGHT[chroma-man]='
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid \
    atload'_zsh_autosuggest_start'\
    atload'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=59"'
zinit light zsh-users/zsh-autosuggestions
zinit ice wait blockf
zinit light zsh-users/zsh-completions
zinit ice wait as"completion" blockf
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice wait
zinit load zdharma/history-search-multi-word

zinit ice wait'0' lucid
zinit light laggardkernel/zsh-thefuck

zinit ice trigger-load'!man'
zinit light ael-code/zsh-colored-man-pages

zinit ice wait pick'fz.sh'\
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert __fz_zsh_completion)'
zinit light changyuheng/fz

zinit ice wait pick'z.sh'
zinit light rupa/z

zinit ice wait from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit ice wait
zinit light sei40kr/zsh-fast-alias-tips

zinit light-mode lucid wait has"kubectl" for \
  id-as"kubectl_completion" \
  as"completion" \
  atclone"kubectl completion zsh > _kubectl" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

DEFAULT_USER="henrikrudstrom"

bindkey '^X' history-incremental-search-forward

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1
export EDITOR=vim

export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"
