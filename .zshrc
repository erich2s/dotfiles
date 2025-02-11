# ----------------System Settings----------------
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

#ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search docker npm)

source $ZSH/oh-my-zsh.sh

#export https_proxy=http://127.0.0.1:7890
#export http_proxy=http://127.0.0.1:7890
#export all_proxy=socks5://127.0.0.1:7890

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/eric/.cache/lm-studio/bin"

# eza
alias ls="eza --color=auto  --git --no-filesize --icons=always --no-time --no-user --no-permissions"
