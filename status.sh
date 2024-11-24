# TMUX hook,
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.11.20


ssn_id=$( \
  tmux display-message -p '#{session_id}' \
  |grep -Eo "[0-9]"
  )
win_nm=$( \
  tmux list-session \
  |grep -Eo "^$ssn_id: [0-9]+" \
  |grep -Eo "[0-9]+$" \
  )
# echo $ssn_id
# echo $win_nm


if [[ $win_nm -gt 1 ]]; then
  tmux set -g status on
else
  tmux set -g status off
fi


# read  -p '...'


