# TMUX hook,


pts=$( tmux display-message -p '#{pane_tty}' )
block=$( tmux show -gv @style_blocked_cmds )
cmd=$( ps -o comm= -t $pts \
  |grep -Ev $block \
  |tail -n 1 \
  )
# echo $block
# echo $pts $cmd


tmux renamew "$cmd"


# read  -p '...'


