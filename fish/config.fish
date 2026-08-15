# Add programs to fish shell
# Starship
function starship_transient_prompt_func
 	starship module character
end
starship init fish | source
enable_transience
# NNN
set BLK "0B"
set CHR "0B"
set DIR "04"
set EXE "06"
set REG "00"
set HARDLINK "06"
set SYMLINK "06"
set MISSING "00"
set ORPHAN "09"
set FIFO "06"
set SOCK "0B"
set OTHER "06"
set -gx NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
set -gx NNN_PLUG 'o:fzopen;j:autojump;v:imgview'
set --export NNN_FIFO "/tmp/nnn.fifo"
# fzf (fuzzy finder)
# ctrl+t = fzf select
# ctrl+r = fzf history
# alt+c  = fzf cd
fzf --fish | source
# zoxide (cd command alternative)
zoxide init fish | source
# bat
eval (batpipe)
# nnn
function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"; and test "$NNNLVL" -ge 1
        echo "nnn is already running!"
        return
    end

    # Set the temp file path nnn expects
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Run nnn
    command nnn $argv

    # Source the file to execute the cd command written by nnn
    if test -e "$NNN_TMPFILE"
        source "$NNN_TMPFILE"
        rm -- "$NNN_TMPFILE"
    end
end

### Set variables ###
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS' --color=fg:#d8dee9,bg:#242933,hl:#ebcb8b --color=fg+:#d8dee9,bg+:#434c5e,hl+:#a3be8c --color=info:#bf616a,prompt:#ebcb8b,pointer:#ebcb8b --color=marker:#d08770,spinner:#d08770,header:#b48ead'

### Autostart ###
# tinyfetch
# fastfetch --gpu-hide-type integrated
# colorscript -e elfman
# pokemon-colorscripts --no-title -r
# fm6000 -as -c random --say 'I use arch btw <3 <3'
#Example>>
#if status is-interactive
	#ghosts	
#end

### Include path ###
set -gx PATH $PATH ~/.local/share/bin/
set -gx PATH $PATH ~/.local/share/appimages/
set -gx PATH $PATH ~/go/bin/
set -gx PATH $PATH ~/.local/bin/ 
set -gx PATH $PATH ~/.config/emacs/bin
set -gx PATH $PATH ~/go/bin/

### remove welcome ###
set -g fish_greeting ""
if status is-interactive
end

### Alias ###
# eza as an ls alternative
alias ls='eza --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias ll='eza -al --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'
# cp,rm,mv verbose
alias rm='rm -rv'
alias cp='cp -rv'
alias mv='mv -v'
# bat
alias cat='bat'
alias man='batman'
# nvim
alias vim='nvim'
# pacman 
alias pman='sudo pacman'
# lsblk
alias lsblk='lsblk | bat -l conf -p'
# flatpak
alias flatin='flatpak install --user'
