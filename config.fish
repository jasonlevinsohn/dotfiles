# Change File Descriptor Limit
ulimit -S -n 2048

# Sourced Virtual Fish for Virtual Python Environments
. ~/.config/fish/virtualfish/virtual.fish
#Gotta have Auto-activation too.
. ~/.config/fish/virtualfish/auto_activation.fish

# This is needed to run pyqt from a non-brewed Python install.
set -x PYTHONPATH "/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
set -x PYTHONPATH "/Users/jlev/Projects/jarvisApi:$PYTHONPATH"
# set -x PATH "/usr/local/share/npm/bin/"
set -x PATH /usr/local/bin /usr/local/share/npm/bin $PATH
set -x PATH /Users/jlevinsohn/Projects/webRTCbrowser/depot_tools $PATH
set -x PATH /Applications/Postgres.app/Contents/Versions/9.3/bin $PATH

# Path for building PhoneGap Android apps
set -x PATH ~/Documents/Android-IDE/android-sdk-macosx/platform-tools $PATH
set -x PATH ~/Documents/Android-IDE/android-sdk-macosx/tools $PATH

# Enables use of local static directory for levsdelight2 instead of S3
set -x OFFLINE True

# Set default EDITOR
setenv EDITOR mvim

# Set Git Editor for use with commit templates
# NOTE: The f option is needed so vim doesn't put itself in the background
#       when git opens an new instance to commit template or rebase.
set -x GIT_EDITOR '/Applications/MacVim.app/Contents/MacOS/Vim -gf '

# imports source templates into Django for Popups for user: example_user
function importDB
    command scripts/deploy_sources.py http://localhost:8888/ ../v2-ingest/components/vel-cluster QafTND1cdSC4uhPOokm9
end

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
alias gco 'git checkout $1' # Checkout the first argument branch
alias gb 'git branch' # Show the project branches
alias gm 'git pull origin master' # Pull and merge master
alias gph 'git push origin HEAD' # Push current branch to GitLab

# Tmux shortcuts
alias tnew 'tmux new -s v2'


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

# Moves to parent directory $argv amount of times
function up
    set i 0
    set limit $argv
    while [ $i -lt $limit ]
        set i (math $i + 1)
        cd ..
    end
end

# Open VSCode from the command line
function code
    env VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" "$argv"
end
