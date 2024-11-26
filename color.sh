# TMUX hook,
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.11.20


pts=''
  block_cmds=''
  last_cmd=''
  color_cmd1=''
  color_cmd2=''
  color_cmd3=''
  color_window=''
  color_border=''
  color_status=''
  color_stalft=''
  color_starft=''
  color_stawnf=''
  color_stawfc=''


get_command() {
  pts=$( tmux display-message -p "#{pane_tty}" )
  block_cmds=$( tmux show -gv @style_blocked_cmds )
  last_cmd=$( ps -o comm= -t $pts \
    |grep -Ev $block_cmds \
    |tail -n 1 \
    )
  color_cmd1=$( tmux show -gv @style_colorful_cmd1 )
  color_cmd2=$( tmux show -gv @style_colorful_cmd2 )
  color_cmd3=$( tmux show -gv @style_colorful_cmd3 )
  # tmux display-message "#{pane_tty}"
  # tmux display-message "$last_cmd $color_cmd1 $color_cmd2 $color_cmd3"
  # echo $color_cmd1
  # echo $color_cmd2
  # echo $color_cmd3
  }

get_color() {
  # set app in different color
  if   [[ $last_cmd =~ $color_cmd3 ]]; then
    color_window=$( tmux show -sv @color_cmd3_window )
    color_border=$( tmux show -sv @color_cmd3_border )
    color_status=$( tmux show -sv @color_cmd3_status )
    color_stalft=$( tmux show -sv @color_cmd3_statlt )
    color_starft=$( tmux show -sv @color_cmd3_statrt )
    color_stawnf=$( tmux show -sv @color_cmd3_statnf )
    color_stawfc=$( tmux show -sv @color_cmd3_statfc )
  elif [[ $last_cmd =~ $color_cmd2 ]]; then
    color_window=$( tmux show -sv @color_cmd2_window )
    color_border=$( tmux show -sv @color_cmd2_border )
    color_status=$( tmux show -sv @color_cmd2_status )
    color_stalft=$( tmux show -sv @color_cmd2_statlt )
    color_starft=$( tmux show -sv @color_cmd2_statrt )
    color_stawnf=$( tmux show -sv @color_cmd2_statnf )
    color_stawfc=$( tmux show -sv @color_cmd2_statfc )
  elif [[ $last_cmd =~ $color_cmd1 ]]; then
    color_window=$( tmux show -sv @color_cmd1_window )
    color_border=$( tmux show -sv @color_cmd1_border )
    color_status=$( tmux show -sv @color_cmd1_status )
    color_stalft=$( tmux show -sv @color_cmd1_statlt )
    color_starft=$( tmux show -sv @color_cmd1_statrt )
    color_stawnf=$( tmux show -sv @color_cmd1_statnf )
    color_stawfc=$( tmux show -sv @color_cmd1_statfc )
  else
    color_window=$( tmux show -sv @color_cmd0_window )
    color_border=$( tmux show -sv @color_cmd0_border )
    color_status=$( tmux show -sv @color_cmd0_status )
    color_stalft=$( tmux show -sv @color_cmd0_statlt )
    color_starft=$( tmux show -sv @color_cmd0_statrt )
    color_stawnf=$( tmux show -sv @color_cmd0_statnf )
    color_stawfc=$( tmux show -sv @color_cmd0_statfc )
  fi
  }

set_color() {
  tmux set -s  window-active-style          "$color_window"
  tmux set -s  pane-active-border-style     "$color_border"
  tmux set -s  status-style                 "$color_status"
  tmux set -s  status-left-style            "$color_stalft"
  tmux set -s  status-right-style           "$color_starft"
  tmux set -s  window-status-style          "$color_stawnf"
  tmux set -s  window-status-current-style  "$color_stawfc"
  }


get_command
get_color
set_color


