#--- Path to oh-my-zsh installation ---#
export ZSH="$HOME/.oh-my-zsh"

#--- Set name of the theme to load ---#
ZSH_THEME=""

#--- Which plugins would you like to load? ---#
plugins=(
  git
  golang
  gh
  npm
  pip
  yarn
  sudo
  docker
  wp-cli
  golang
  flutter
  artisan
  direnv
  ssh-agent
  zsh-autosuggestions
  zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities id_personal id_vertex id_decagon id_merck id_bytelabs

#--- Let's begin ---#
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"

#--- User configuration ---#

# Aliases
alias cat="bat"
alias \?='gh copilot explain'
alias \?\?='gh copilot explain'

# Flags
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include -I/usr/local/opt/openjdk/include"
export LANG=en_US.UTF-8
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="google-chrome"
export DIRENV_LOG_FORMAT=""

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/4.0.0/bin:$PATH"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Zoxide
eval "$(zoxide init zsh)"

# Load Starship Prompt
eval "$(starship init zsh)"

# FlyEnv
export PATH="/Users/devhammed/Library/FlyEnv/alias:/Users/devhammed/Library/FlyEnv/env/java/bin:/Users/devhammed/Library/FlyEnv/env/java:/Users/devhammed/Library/FlyEnv/env/rustfs:/Users/devhammed/Library/FlyEnv/env/node/bin:/Users/devhammed/Library/FlyEnv/env/frankenphp:/Users/devhammed/Library/FlyEnv/env/node:/Users/devhammed/Library/FlyEnv/env/cloudflared/bin:/Users/devhammed/Library/FlyEnv/env/postgresql/bin:/Users/devhammed/Library/FlyEnv/env/mysql/bin:/Users/devhammed/Library/FlyEnv/env/cloudflared:/Users/devhammed/Library/FlyEnv/env/postgresql:/Users/devhammed/Library/FlyEnv/env/mailpit/bin:/Users/devhammed/Library/FlyEnv/env/mysql:/Users/devhammed/Library/FlyEnv/env/nginx/bin:/Users/devhammed/Library/FlyEnv/env/redis/bin:/Users/devhammed/Library/FlyEnv/env/mailpit:/Users/devhammed/Library/FlyEnv/env/php/bin:/Users/devhammed/Library/FlyEnv/env/nginx:/Users/devhammed/Library/FlyEnv/env/redis:/Users/devhammed/Library/FlyEnv/env/php:$PATH"
export JAVA_HOME="/usr/local/Cellar/openjdk@21/21.0.12/libexec/openjdk.jdk/Contents/Home"
