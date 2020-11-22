export ZSH="/Users/thelastinuit/.oh-my-zsh"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export ZSH_DISABLE_COMPFIX=true
ZSH_THEME="robbyrussell"
plugins=(git ssh-agent)
source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
alias svim="sudo vim"
alias dcu="docker-compose up -d"
alias dcr="docker-compose run --rm"
alias dclf="docker-compose logs -f"
alias dce="docker-compose exec"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias pucumber="RAILS_ENV=test bundle exec rake cucumber"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
if [ -f '/Users/thelastinuit/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thelastinuit/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/thelastinuit/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thelastinuit/google-cloud-sdk/completion.zsh.inc'; fi
alias ld='lazydocker'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.cargo/env:$PATH"
export GIT_AUTHOR_NAME="thelastinuit"
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
    vim -- $files
    print -l $files[1]
  fi
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
    if [[ -d $file ]]
    then
      cd -- $file
    else
      cd -- ${file:h}
    fi
  fi
}

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rga --ignore-case --files-with-matches --no-messages "$1" | fzf-tmux --preview "highlight -O ansi -l {} 2> /dev/null | rga --ignore-case --pretty --context 10 "$1" {}"
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fco_preview() {
  local tags branches target
  branches=$(
  git --no-pager branch --all \
    --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
  git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
  (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

source ~/zsh-interactive-cd.plugin.zsh

###-tns-completion-start-###
if [ -f /Users/thelastinuit/.tnsrc ]; then
  source /Users/thelastinuit/.tnsrc
fi
###-tns-completion-end-###

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export FZF_DEFAULT_OPTS='--layout=reverse'

ee() {
  nvim $(fzf --preview 'bat --style=numbers --color=always {} | head -1000')
}

alias cat="bat --style=numbers --color=always"
alias beerme="grep -Rni"
eval "$(starship init zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias run_test="RAILS_ENV=development bundle exec cucumber --backtrace"
alias phpunit="/Users/thelastinuit/repositories/Ventup/vendor/bin/phpunit"
alias artunit="php artisan test"
alias ber="bundle exec rails"
alias bers="bundle exec rspec"
export GPG_TTY=$(tty)
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
alias vim="nvim"
