export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH
export PS1="\w: "

# We are currently using Virtual Fish
# instead of VirtualEnvWrapper so we 
# comment this out.  Virtual Fish is 
# being sourced from ~/.config/config.fish

# source `which virtualenvwrapper.sh`



function tabname {
    printf "\e]1;$1\a"
}

function winname {
    printf "\e]2;$1\a"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
