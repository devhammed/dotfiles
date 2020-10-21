# Set TERM to 256 color
export TERM='xterm-256color'

# Set Unicode Support
export LANG='en_NG.UTF-8'

# Load User Binaries Environment
export PATH="$HOME/.local/bin:$PATH"

# Load Custom ZSH Completions
fpath+="$HOME/.zsh_completions"

# Load Homebrew Environment
export HOMEBREW_PREFIX="/home/devhammed/.linuxbrew";
export HOMEBREW_CELLAR="/home/devhammed/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/devhammed/.linuxbrew/Homebrew";
export PATH="$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin";
export MANPATH="/home/devhammed/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/devhammed/.linuxbrew/share/info${INFOPATH+:$INFOPATH}";
fpath+="$HOME/.linuxbrew/share/zsh/site-functions"

# Load Deno Environment
export DENO_INSTALL_ROOT="$HOME/Tools/deno"
export PATH="$DENO_INSTALL_ROOT/bin:$PATH"

# Load Flutter and Dart Environment
export PATH="$HOME/Tools/flutter/bin:$HOME/.pub-cache/bin:$PATH"

# Load Composer Environment
export PATH="$HOME/.composer/vendor/bin:$PATH"
export COMPOSER_ALLOW_XDEBUG=1
export COMPOSER_DISABLE_XDEBUG_WARN=1

# Load Go Environment
export GO111MODULE=on
export GOPATH="$HOME/Tools/go"
export PATH="$GOPATH/bin:$PATH"
export GOSRC="$GOPATH/src/github.com/$USER"
if [[ ! -d "$GOSRC" ]]; then
  mkdir -p "$GOSRC"
fi

# Load Rust Environment
source $HOME/.cargo/env
export WASM_BINDGEN_PATH="$HOME/.cache/.wasm-pack/wasm-bindgen-cargo-install-0.2.58"
export PATH="$WASM_BINDGEN_PATH:$WASM_BINDGEN_PATH/bin:$PATH"

# Load V Environment
export PATH="$HOME/Tools/v:$PATH"

# Load Android SDK Environment
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export ADB="$ANDROID_HOME/platform-tools/adb"

# Load Ballerina Environment
export PATH="$HOME/Tools/ballerina/bin:$PATH"

# Load Node.js extra CA Certificates
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Load PPSSPP Environment
export PATH="$HOME/Downloads/psp:$PATH"

# Set CLI Editor
export EDITOR="vim"

# Set CLI Web Browser
export BROWSER="google-chrome"

# Custom Aliases
alias kgif='mkgif 30 720 0:00 0'
alias la='ls -la'
alias xdg='xdg-open'
alias m='micro'
alias pip='pip3'
alias pyvenv='python3 -m venv'
alias spotdl='spotdl -m -ns --trim-silence -f "{artist}_-_{track-name}.{output-ext}"'
alias backup='rsync -rtvu'
alias cat='bat'
alias usudo='sudo -E env "PATH=$PATH"'
alias fsize='du -sh'
alias betty="$HOME/Tools/betty/main.rb"
alias create-wp-app='composer create-project --prefer-dist wordplate/wordplate'
alias create-laravel-app='composer create-project --prefer-dist laravel/laravel'
alias create-mantle-app='composer create-project --remove-vcs --stability=dev --no-cache --no-interaction alleyinteractive/mantle'

# Custom Functions
cl() {
  cd "$@" && ls
}

gi() {
  curl -sLw "\n" "https://www.gitignore.io/api/$@"
}


dockerps() {
  docker ps "$@" --format="ID\\t{{.ID}}\nName\\t{{.Names}}\nImage\\t{{.Image}}\nPorts\\t{{.Ports}}\nCommand\\t{{.Command}}\nCreated\\t{{.CreatedAt}}\nStatus\\t{{.Status}}\n"
}
