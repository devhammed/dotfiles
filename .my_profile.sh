# Set TERM to 256 color
export TERM='xterm-256color'

# Set Unicode Support
export LANG='en_NG.UTF-8'

# Fix QT DPI issue
export QT_FONT_DPI=96
export QT_SCALE_FACTOR=1

# Load User Binaries Environment
export PATH="$HOME/.local/bin:$PATH"

# Load Custom ZSH Completions
fpath+="$HOME/.zsh_completions"

# Load Snapcraft Environment
export SNAPCRAFT_BUILD_ENVIRONMENT=lxd

# Load Homebrew Environment
export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

# Load Brew Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

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
export GOPATH="$HOME/Tools/go"
export PATH="$GOPATH/bin:$PATH"
export GOSRC="$GOPATH/src/github.com/$USER"
[[ ! -d "$GOSRC" ]] && mkdir -p "$GOSRC"

# Load Rust Environment
source $HOME/.cargo/env
export WASM_BINDGEN_PATH="$HOME/.cache/.wasm-pack/wasm-bindgen-cargo-install-0.2.58"
export PATH="$WASM_BINDGEN_PATH:$WASM_BINDGEN_PATH/bin:$PATH"

# Load V Environment
export PATH="$HOME/Tools/v:$PATH"

# Load Android SDK Environment
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export ADB="$ANDROID_HOME/platform-tools/adb"

# Load Ballerina Environment
export PATH="$HOME/Tools/ballerina/bin:$PATH"

# Load Node.js extra CA Certificates
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Set CLI Editor
export EDITOR="vim"

# Set CLI Web Browser
export BROWSER="google-chrome"

# Prevent Python Bytecode creation
export PYTHONDONTWRITEBYTECODE="off"

# Custom Aliases
alias rm='rm -i'
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
alias create-react-app='create-react-app --use-npm'
alias create-wp-app='composer create-project --prefer-dist wordplate/wordplate'
alias create-laravel-app='composer create-project --prefer-dist laravel/laravel'

# Custom Functions
cl() {
  cd "$@" && ls
}

gi() {
  curl -sLw "\n" "https://www.gitignore.io/api/$@"
}


dockerps() {
  docker ps "$@" --format="ID\\t: {{.ID}}\nName\\t: {{.Names}}\nImage\\t: {{.Image}}\nPorts\\t: {{.Ports}}\nCommand\\t: {{.Command}}\nCreated\\t: {{.CreatedAt}}\nStatus\\t: {{.Status}}\n"
}

git-release() {
   git tag "$@" && git push --tags
}
