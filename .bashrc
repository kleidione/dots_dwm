#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nano"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export TERM="xterm-256color"

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

PS1="\u@\h\n>\[$(tput sgr0)\]"
(cat ~/.cache/wal/sequences &)

