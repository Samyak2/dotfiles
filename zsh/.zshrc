# vim: fdm=marker foldenable sw=4 ts=4 sts=4

# {{{ Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

# {{{ user/.local/bin
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
# }}}

# {{{ Oh-My-Zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# }}}

# {{{ Theme
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# }}}

# {{{ extras from default zshrc
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# }}}

# {{{ PLUGINS
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract zsh-syntax-highlighting virtualenv pip docker zsh-autosuggestions gpg-agent)
# }}}

source $ZSH/oh-my-zsh.sh

# {{{ User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
if [ -f "/usr/bin/nvim" ]
then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# }}}

# {{{ Better history view using hstr
# Install from https://github.com/dvorka/hstr
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
# }}}

# {{{ Spaceship prompt (not used with powerlevel10k)
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  # haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  # aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  line_sep      # Line break
  char          # Prompt character
)
SPACESHIP_EXIT_CODE_SHOW="true"
SPACESHIP_BATTERY_SHOW="always"
SPACESHIP_VENV_SYMBOL="🐍"
SPACESHIP_VENV_COLOR="green"
# }}}

# {{{ zsh autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_USE_ASYNC=1
# }}}

# {{{ Compiler - using clang if available
if [ -f '/usr/bin/clang' ];
then
    export CC=/usr/bin/clang
fi

if [ -f '/usr/bin/clang++' ];
then
    export CXX=/usr/bin/clang++
fi
# }}}

# {{{ Julia
export JULIA_NUM_THREADS=4

# generated by Comonicon
# Julia bin PATH
if [ -f "$HOME/.julia/bin" ]; then
    export PATH="$PATH:$HOME/.julia/bin"
fi

# generated by Comonicon
# Julia autocompletion PATH
if [ -f "$HOME/.julia/completions:$FPATH" ]; then
    export FPATH="$HOME/.julia/completions:$FPATH"
fi

# }}}

# {{{ Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc"; fi
# }}}


# {{{ heroku
if [ -d "$HOME/apps/heroku/bin" ]; then
    export PATH="$PATH:$HOME/apps/heroku/bin"
fi
# }}}

# {{{ AWS Elastic Beanstalk
if [ -d "$HOME/.ebcli-virtual-env/executables" ]; then
    export PATH="$PATH:$HOME/.ebcli-virtual-env/executables"
fi
# }}}

# {{{ to use protontricks from steam installed through flatpak
alias protontricks-flat='flatpak run --command=protontricks com.valvesoftware.Steam --no-runtime'
# }}}

# {{{ fun aliases
alias pls="sudo "
alias gib="dnf install "
# }}}


# {{{ GitHub CLI completion
if type "gh" > /dev/null; then
    eval "$(gh completion -s zsh)"
fi
# }}}

# {{{ Completion for kitty
if type "kitty" > /dev/null; then
    kitty + complete setup zsh | source /dev/stdin
fi
# }}}

# {{{ Blur in yakuake or kitty
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
# }}}

# {{{ Powerlevel10k stuff
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if type "pyenv" > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
# }}}
