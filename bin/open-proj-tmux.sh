#!/bin/zsh
target=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
base=$(basename $target)
session_exists=$(tmux ls -F "#{session_name}" | grep $base)
cd $target
if [[ -n "$session_exists" ]]; then
	tmux a -t $base
else
	tmux new -s $base
fi

