# use vi movement in terminal
set -o vi

# I like to have all the history
MILLION=1000000
export HISTFILESIZE=$MILLION
export HISTSIZE=$MILLION

# Add my scripts to the path
[[ ":$PATH:" != *":$HOME/.bin:"* ]] && export PATH="$HOME/.bin:${PATH}"
[[ ":$PATH:" != *":/usr/local/bin:"* ]] && export PATH="/usr/local/bin:${PATH}"

# update bash history after each command
export PROMPT_COMMAND="history -a"

export EDITOR='nvim'
alias vim='nvim'
alias vi='nvim'

# tmux stuff
alias mux="tmux -2"

# Ruby stuff
alias berake='bundle exec rake'
alias be='bundle exec'

# git stuff
alias gst='git status'
alias gcom='git commit'
alias gdiff='git diff | tig'
alias git='hub'
eval "$(hub alias -s)"

alias gist='gist --copy'
source ~/.bin/git-completion.sh

# this is a fucking doozy
export FZF_DEFAULT_COMMAND='\
    cat <(if test -f ignored_but_important.txt; \
    then cat ignored_but_important.txt; fi | \
    xargs -I {} find {} -type f) <(git ls-files) | \
    grep -v "vendor\/assets" | \
    grep -v "^public" | \
    grep -v "app\/assets\/images" | \
    grep -v "app\/assets\/fonts" | \
    sort'

# random stuff I stole from Ned
PROMPT_COLOR='\e[00m\e[38;05;166m'
PS1='\['$PROMPT_COLOR'\]\w \$\[\e[0m\] '
PS2='> '
export PS1 PS2
eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias pip='pip2'

# rbenv
eval "$(rbenv init -)"
# nodenv
eval "$(nodenv init -)"
