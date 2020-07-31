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


PROMPT="╭───[$(user_host)] [$(current_time)] [$(directory)]
╰─%B$(ret) %b"
