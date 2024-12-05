# TMUX hook,
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.11.20


pts=''
  block_cmds=''
  last_cmd=''
  color_cmd00=''
  color_cmd10=''
  color_cmd20=''
  color_cmd30=''
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
  color_cmd00=$( tmux show -gv @style_colorful_cmd00 )
  color_cmd10=$( tmux show -gv @style_colorful_cmd10 )
  color_cmd20=$( tmux show -gv @style_colorful_cmd20 )
  color_cmd30=$( tmux show -gv @style_colorful_cmd30 )
  # tmux display-message "#{pane_tty}"
  # tmux display-message "$last_cmd | $color_cmd10 $color_cmd10 $color_cmd20 $color_cmd30"
  # echo $color_cmd00
  # echo $color_cmd10
  # echo $color_cmd20
  # echo $color_cmd30
  }

get_color() {
  # set app in different color
case $last_cmd in
  $color_cmd00 )
    color_window=$( tmux show -sv @color_cmd00_window )
    color_border=$( tmux show -sv @color_cmd00_border )
    color_status=$( tmux show -sv @color_cmd00_status )
    color_stalft=$( tmux show -sv @color_cmd00_statlt )
    color_starft=$( tmux show -sv @color_cmd00_statrt )
    color_stawnf=$( tmux show -sv @color_cmd00_statnf )
    color_stawfc=$( tmux show -sv @color_cmd00_statfc )
    ;;
  $color_cmd10 )
    color_window=$( tmux show -sv @color_cmd10_window )
    color_border=$( tmux show -sv @color_cmd10_border )
    color_status=$( tmux show -sv @color_cmd10_status )
    color_stalft=$( tmux show -sv @color_cmd10_statlt )
    color_starft=$( tmux show -sv @color_cmd10_statrt )
    color_stawnf=$( tmux show -sv @color_cmd10_statnf )
    color_stawfc=$( tmux show -sv @color_cmd10_statfc )
    ;;
  $color_cmd20 )
    color_window=$( tmux show -sv @color_cmd20_window )
    color_border=$( tmux show -sv @color_cmd20_border )
    color_status=$( tmux show -sv @color_cmd20_status )
    color_stalft=$( tmux show -sv @color_cmd20_statlt )
    color_starft=$( tmux show -sv @color_cmd20_statrt )
    color_stawnf=$( tmux show -sv @color_cmd20_statnf )
    color_stawfc=$( tmux show -sv @color_cmd20_statfc )
    ;;
  $color_cmd30 )
    color_window=$( tmux show -sv @color_cmd30_window )
    color_border=$( tmux show -sv @color_cmd30_border )
    color_status=$( tmux show -sv @color_cmd30_status )
    color_stalft=$( tmux show -sv @color_cmd30_statlt )
    color_starft=$( tmux show -sv @color_cmd30_statrt )
    color_stawnf=$( tmux show -sv @color_cmd30_statnf )
    color_stawfc=$( tmux show -sv @color_cmd30_statfc )
    ;;
  * )
    color_window=$( tmux show -sv @color_cmd80_window )
    color_border=$( tmux show -sv @color_cmd80_border )
    color_status=$( tmux show -sv @color_cmd80_status )
    color_stalft=$( tmux show -sv @color_cmd80_statlt )
    color_starft=$( tmux show -sv @color_cmd80_statrt )
    color_stawnf=$( tmux show -sv @color_cmd80_statnf )
    color_stawfc=$( tmux show -sv @color_cmd80_statfc )
    ;;
  esac
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


