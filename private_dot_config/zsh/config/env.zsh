#===============================
# Shell Environment Variables
#===============================

# DO NOT set here env variables that
# are needed to be loaded session wide
# those have different locations such as:
#
# ~/.profile
# ~/.xprofile          # For X11 sessions
# ~/.xsessionrc        # For X11 session scripts
# /etc/profile         # System-wide for login shells
# /etc/environment     # System-wide persistent env variables
#
# The files sourced by interactive shells (~/.zshrc) are intended for:
# - aliases
# - shell functions
# - shell options (setopt, unsetopt)
# - prompt configuration
# - shell completion settings
# - local PATH modifications for interactive use
# Avoid putting env variables here that GUI apps or non-login scripts rely on.

# Default editor
export EDITOR="nvim"

# Pager (for man, git, etc.)
export PAGER="less"
export LESS="-R"

# Language / locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

