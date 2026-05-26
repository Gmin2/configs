fish_add_path -p ~/.local/bin


# =================================================================
# My Personal Fish Settings (migrated from .zshrc)
# =================================================================

fish_add_path $HOME/bin
fish_add_path /usr/local/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path "$HOME/.local/share/solana/install/active_release/bin"
fish_add_path "$HOME/.rbenv/bin"
fish_add_path $HOME/julia/bin
fish_add_path $HOME/bitcoin-core/bitcoin-28.0/bin
fish_add_path "$HOME/coding/github-repo/screenpipe/target/debug"
fish_add_path "$HOME/coding/github-repo/lnd"
fish_add_path /opt/binaryen/bin
fish_add_path /home/mintu-ubuntu/.opencode/bin
fish_add_path "$HOME/.near-cli-rs/bin"


# --- Environment Variables ---
# Use `set -x` to define an environment variable.

set -x NVM_DIR "$HOME/.nvm"

# Bun
set -x BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# pnpm
set -x PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME

# Java
set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64
fish_add_path $JAVA_HOME/bin

# NVM (Node Version Manager)
# This variable is needed for the nvm.fish wrapper to work correctly.
set -x NVM_DIR "$HOME/.nvm"

# Secrets/API keys — load from ~/.config/fish/conf.d/secrets.fish (not tracked in git)
# Example:
#   set -x GEMINI_API_KEY 'your-key-here'


# --- Tool Initializers ---
# These must be run for tools to work correctly.

# rbenv
# The `status is-interactive` check prevents errors in non-interactive shells.
if status is-interactive; and command -v rbenv >/dev/null
    rbenv init - | source
end

# Homebrew
if test -d /home/linuxbrew/.linuxbrew/bin
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

# Google Cloud SDK
# This sources the correct Fish shell configuration files.
if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end

# AsyncAPI CLI Autocomplete
if test -f "$HOME/.cache/@asyncapi/cli/autocomplete/zsh_setup"
   # Note: This is a Zsh script. It might work, but it might also produce errors.
   # If it causes issues, you may need to find a Fish-specific setup for AsyncAPI.
   source "$HOME/.cache/@asyncapi/cli/autocomplete/zsh_setup"
end


# --- Abbreviations and Functions (replaces aliases) ---
# `abbr` expands to the full command when you press space or enter.

abbr -a tm 'task-master'
abbr -a activity '/opt/activitywatch/aw-qt & sleep 2 && firefox http://localhost:5600'

# Cursor function

set -gx PATH $HOME/opt/gradle-8.7/bin $PATH
set -gx PATH /usr/share/swift/usr/bin $PATH

function sbuild
    swift build --jobs (nproc) --build-path ~/.swift-build $argv
end

function srun
    swift run --jobs (nproc) --build-path ~/.swift-build $argv
end

# --- Gruvbox Color Theme ---
set -g fish_color_normal d5c4a1        # Text
set -g fish_color_command b8bb26       # Command (Green)
set -g fish_color_keyword fb4934       # Keywords (Red)
set -g fish_color_quote fabd2f         # Quotes (Yellow)
set -g fish_color_redirection d5c4a1   # Redirection
set -g fish_color_end fe8019           # Separator (Orange)
set -g fish_color_error fb4934         # Error (Red)
set -g fish_color_param 83a598         # Arguments (Blue)
set -g fish_color_comment 665c54       # Comments (Grey)
set -g fish_color_selection --background=3c3836
set -g fish_color_search_match --background=3c3836
set -g fish_color_operator fe8019
set -g fish_color_escape d3869b
set -g fish_color_autosuggestion 504945
