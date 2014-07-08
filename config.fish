# Sourced Virtual Fish for Virtual Python Environments
. ~/.config/fish/virtualfish/virtual.fish
#Gotta have Auto-activation too.
. ~/.config/fish/virtualfish/auto_activation.fish

# This is needed to run pyqt from a non-brewed Python install.
set -x PYTHONPATH "/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
# set -x PATH "/usr/local/share/npm/bin/"
set -x PATH /usr/local/bin /usr/local/share/npm/bin $PATH
set -x PATH /Users/jlevinsohn/Projects/webRTCbrowser/depot_tools $PATH
set -x PATH /Applications/Postgres.app/Contents/Versions/9.3/bin $PATH

# Path for building PhoneGap Android apps
set -x PATH ~/Documents/Android-IDE/adt-bundle-mac-x86_64-20140321/sdk/platform-tools $PATH
set -x PATH ~/Documents/Android-IDE/adt-bundle-mac-x86_64-20140321/sdk/tools $PATH

# Set default EDITOR
setenv EDITOR mvim

# Show epoch time as EST time
function epochESTTime
    set curtime (date +%s)
    math $curtime - 18000
end

# POWERSHELL PROMPT
function fish_prompt
    ~/powerline-shell.py $status --shell bare ^/dev/null
    # ~/powerline-shell.py $status --shell bare ^/dev/null --cwd-only

end
# ----- OLD FISH PROMPT - 3.14.2014
# function fish_prompt
#     set_color $fish_color_cwd
    
#     if set -q VIRTUAL_ENV
#         echo -n -s "(" (basename "$VIRTUAL_ENV") ")"
#     end


#     echo -n (prompt_pwd)
#     set_color normal
#     echo -n ' > '
# end

# n - version control name
# b - branch name
# a - shows * for changes staged
# m - shows + for changes not staged
# u - shows ? for untracked files
# set VCPROMPT_FORMAT '%b %m %u'

# ------ OLD FISH RIGHT PROMPT - 3.14.2014
# function fish_right_prompt
#     echo -n (vcprompt -f $VCPROMPT_FORMAT )

# end

# Shortcuts
alias v 'mvim'
alias s 'subl'
alias .. 'cd ..'
alias loseFantom 'diskutil unmount FantomHD'

# git aliases
alias gitpatch 'git log --oneline -p' # shows lines removed and added
alias gitinsdel 'git log --oneline --stat' # shows how many insertions and deletinos
alias gitgraph 'git log --oneline --graph' # shows a graph with merge bubbles
alias gac 'git commit -a -m $1' # Stages and commits modified files (note: Newly added files still need to use git-add


# ------ OLD FISH COLORS USED WITH OLD FISH PROMPT - 3.14.2014
# Fish Colors
# set fish_color_error ff8a00

# set -g c0 (set_color ffffff)

# set -g c1 (set_color ffffff)

# set -g c2 (set_color ffffff)

# set -g c3 (set_color ffffff)

# set -g c4 (set_color ffffff)

# set -g ce (set_color $fish_color_error)



# Creates a directory and moves into it.
function md
    mkdir "$argv"; and cd "$argv"
end

