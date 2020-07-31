user_host() {
	echo "%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}"
}

current_time() {
   echo "%*"
}

directory() {
   echo "%{$fg[blue]%}%2~%{$reset_color%}"
}

on_err() {
	echo "%{$fg[red]%}$%{$reset_color%}"
}

on_ok() {
	echo "%{$fg[green]%}$%{$reset_color%}"
}

ret() {
	echo "%(?.$(on_ok).$(on_err))"
}

local git_branch='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} clean"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} dirty"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} add"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} mod"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} del"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ren"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} umrg"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} utrk"


PROMPT="╭───[$(user_host)] [$(current_time)] [$(directory)] ${git_branch}
╰─%B$(ret) %b"
