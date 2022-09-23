#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export GOPATH=~/experiments/go
export PATH=/usr/local/sbin:$GOPATH/bin:$HOME/.local/bin:$HOME/bin:$PATH:${HOME}/.krew/bin:${HOME}/.rd/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Theme Customization

# Setttings for the Prompt
#SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_PROMPT_DEFAULT_PREFIX=". Orders? "
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"

# Settings for the Prommpt Character
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_PREFIX=(" ")
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"

# Settings for the USER section
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX="for "
SPACESHIP_USER_SUFFIX=" "

# Setttings for the Directory section
SPACESHIP_DIR_SHOW="true"
SPACESHIP_DIR_TRUNC=1

# Settings for the Battery Monitory
SPACESHIP_BATTERY_THRESHOLD=30

# Settings for the Exec time
SPACESHIP_EXEC_TIME_SHOW="true"

# Settings for the Exit Code
SPACESHIP_EXIT_CODE_SHOW="true"

# Settings for the HOST name
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_SUFFIX=" ready "

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  dir           # Current directory section
  host          # Hostname section
  user          # Username section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  rust          # Rust section
  haskell       # Haskell Stack section
  docker        # Docker section
  aws           # Amazon Web Services section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  exit_code     # Exit code section
  jobs          # Background jobs indicator
  char          # Prompt character
)

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTIO="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(evalcache
poetry
npm
aws
colorize
docker
cp
tmux
terraform
zsh-autosuggestions
zsh-syntax-highlighting
)

export ZSH_COMPDUMP="$ZDOTDIR/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ctags="`brew --prefix`/bin/ctags"
alias vim="nvim"
alias vimdiff="nvim -d"
alias zshconfig="vim ~/$ZDOTDIR/.zshrc"
alias zshreload="source ~/$ZDOTDIR/.zshrc"
alias find=gfind
alias cat=bat
alias ping=prettyping
alias man=tldr
alias grep="grep -i"

fpath=(~/.zsh/Completion $fpath)

export PATH="$HOME/.jenv/bin:$PATH"
_evalcache jenv init -

# Rust Path Configuration
RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/; export RUST_SRC_PATH;

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Hook direnv
_evalcache direnv hook zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [-f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" && -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"]; then
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"  
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi

if [-f "/usr/local/opt/asdf/libexec/asdf.sh"]; then
  . /usr/local/opt/asdf/libexec/asdf.sh
fi

# Confiuring build options for asdf R
R_EXTRA_CONFIGURE_OPTIONS='--enable-R-shlib --with-cairo'
