# Set TERM to 256 color
export TERM='xterm-256color'

# Set Unicode Support
export LANG='en_NG.UTF-8'

# Load User Binaries Environment
export PATH="$HOME/.local/bin:$PATH"

# Load Homebrew Environment
export HOMEBREW_PREFIX="/home/devhammed/.linuxbrew";
export HOMEBREW_CELLAR="/home/devhammed/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/devhammed/.linuxbrew/Homebrew";
export PATH="$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin";
export MANPATH="/home/devhammed/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/devhammed/.linuxbrew/share/info${INFOPATH+:$INFOPATH}";
fpath+="$HOME/.linuxbrew/share/zsh/site-functions"
source "$HOMEBREW_PREFIX/opt/git-extras/share/git-extras/git-extras-completion.zsh"

# Load Deno Environment
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Load Flutter and Dart Environment
export FLUTTER_SDK_PATH="$HOME/.local/share/flutter/bin"
export PATH="$FLUTTER_SDK_PATH:$FLUTTER_SDK_PATH/cache/dart-sdk/bin:$HOME/.pub-cache/bin:$PATH"

# Load Composer Environment
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Go Environment
export GOPATH="$HOME/Go"
export PATH="$GOPATH/bin:$PATH"

# Load Go Workspace
export GOSRC="$GOPATH/src/github.com/$USER"
if [[ ! -d "$GOSRC" ]]; then
  mkdir -p "$GOSRC"
fi

# Load Rust Environment
source $HOME/.cargo/env
export WASM_BINDGEN_PATH="$HOME/.cache/.wasm-pack/wasm-bindgen-cargo-install-0.2.58"
export PATH="$WASM_BINDGEN_PATH:$WASM_BINDGEN_PATH/bin:$PATH"

# Load V Environment
export PATH="$HOME/.local/lib/v:$PATH"

# Load TinyGo Environment
export PATH="/usr/local/tinygo/bin:$PATH"

# Load Android SDK Environment
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export ADB="$ANDROID_HOME/platform-tools/adb"

# Load Kotlin Environment
export PATH="/opt/android-studio/plugins/Kotlin/kotlinc/bin:$PATH"

# Load z-jump Environment
source $HOME/.local/lib/z.sh

# Load PPSSPP Environment
export PATH="$HOME/Downloads/psp:$PATH"

# Set CLI Editor
export EDITOR="vim"

# Setup Heroku autocomplete
eval $(heroku autocomplete:script zsh)

# Set CLI Web Browser
export BROWSER="google-chrome"

# Custom Aliases
alias kgif='mkgif 30 720 0:00 0'
alias la='ls -la'
alias xdg='xdg-open'
alias m='micro'
alias pip='pip3'
alias pyvenv='python3 -m venv'
alias spotdl='spotdl -m -ns'
alias backup='rsync -rtvu'
alias usudo='sudo -E env "PATH=$PATH"'

# Custom Functions
cl() {
  cd "$@" && ls
}
gi() {
  curl -sLw "\n" "https://www.gitignore.io/api/$@"
}
