# TMUX hook,
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.11.20


pts=''
  block_cmds=''
  last_cmd=''
  cmd_clr=''
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
  # tmux display-message "#{pane_tty}"
  # tmux display-message "$last_cmd | $color_cmd10 $color_cmd10 $color_cmd20 $color_cmd30"
  }

get_color() {
  # set app in different color
  cmd_clr=$( tmux show -gv @cmd_clrs |grep "$last_cmd" )
  [ "$cmd_clr" = '' ] && cmd_clr=$( tmux show -gv @cmd_clrs |grep "else" )
  color_window=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $2,$9 }' )
  color_border=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $3,$10}' )
  color_status=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $4,$11}' )
  color_stalft=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $5,$12}' )
  color_starft=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $6,$13}' )
  color_stawfc=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s,bg=%s", $7,$14}' )
  color_stawnf=$( echo $cmd_clr |awk -F"[\t ]+" '{printf "fg=%s"      , $8    }' )
  # tmux display-message "$last_cmd | $cmd_clr"
  }

set_color() {
  # tmux display-message "$last_cmd | $cmd_clr"
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


