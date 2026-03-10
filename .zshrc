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
export VISUAL="phpstorm"
export BROWSER="google-chrome"
export DIRENV_LOG_FORMAT=""

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/4.0.0/bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Herd injected NVM configuration
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

# Herd CA for Node.js
export NODE_EXTRA_CA_CERTS="$HOME/Library/Application Support/Herd/config/valet/CA/LaravelValetCASelfSigned.pem"

# Load Zoxide
eval "$(zoxide init zsh)"

# Load Starship Prompt
eval "$(starship init zsh)"

