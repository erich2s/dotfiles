# ----------------System Settings----------------
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

plugins=(git docker zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias c="clear"

# ----------------Python Settings----------------
alias python="python3"
alias pip="pip3"

# ----------------JS Settings----------------
# pnpm
export PNPM_HOME="/Users/eric/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
#compdef pnpm
if type compdef &>/dev/null; then
  _pnpm_completion () {
    local reply
    local si=$IFS

    IFS=$'\n' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" SHELL=zsh pnpm completion-server -- "${words[@]}"))
    IFS=$si

    if [ "$reply" = "__tabtab_complete_files__" ]; then
      _files
    else
      _describe 'values' reply
    fi
  }
  # When called by the Zsh completion system, this will end with
  # "loadautofunc" when initially autoloaded and "shfunc" later on, otherwise,
  # the script was "eval"-ed so use "compdef" to register it with the
  # completion system
  if [[ $zsh_eval_context == *func ]]; then
    _pnpm_completion "$@"
  else
    compdef _pnpm_completion pnpm
  fi
fi
# pnpm end

# fnm
eval "$(fnm env --use-on-cd)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/eric/.bun/_bun" ] && source "/Users/eric/.bun/_bun"

# package.json alias
alias d="nr dev"
alias i="ni"
alias b="nr build"

# eza
alias ls="eza --color=auto --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# starship
eval "$(starship init zsh)"
