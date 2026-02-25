# vim:set ft=tmux:

# Inspred by https://github.com/catppuccin/tmux

# All options and their defaults.
#
# This is executed separately to the main configuration
# so that options are set before parsing the rest of the config.

# DO NOT USE -o IN YOUR OWN CONFIGURATION
set -ogq @peafowl_status_background "default"

# Menu styling options
set -ogq @peafowl_menu_selected_style "fg=#{@thm_fg},bold,bg=#{@thm_overlay_0}"

# Pane styling options (DO NOT USE -o IN YOUR OWN CONFIGURATION)
set -ogq @peafowl_pane_status_enabled "no" # set to "yes" to enable
set -ogq @peafowl_pane_border_status "off" # set to "yes" to enable
set -ogq @peafowl_pane_border_style "fg=#{@thm_overlay_0}"
set -ogq @peafowl_pane_active_border_style "##{?pane_in_mode,fg=#{@},##{?pane_synchronized,fg=#{@thm_sapphire},fg=#{@thm_emerald}}}"
set -ogq @peafowl_pane_left_separator "█"
set -ogq @peafowl_pane_middle_separator "█"
set -ogq @peafowl_pane_right_separator "█"
set -ogq @peafowl_pane_color "#{@thm_sapphire}"
set -ogq @peafowl_pane_background_color "#{@thm_surface_0}"
set -ogq @peafowl_pane_default_text "##{b:pane_current_path}"
set -ogq @peafowl_pane_default_fill "number"
set -ogq @peafowl_pane_number_position "left" # right, left

# NOTE: Changes to make the option names more intuitive and more closely follow
# the tmux naming conventions.
# @peafowl_window_current_background -> @peafowl_window_current_number_color
# @peafowl_window_current_color      -> @peafowl_window_current_text_color
# @peafowl_window_default_background -> @peafowl_window_number_color
# @peafowl_window_default_color      -> @peafowl_window_text_color
# @peafowl_window_status             -> @peafowl_window_flags
#
# Removed:
# @peafowl_window_default_fill, @peafowl_window_current_fill
# Just set the number and text colors.

# Window options (DO NOT USE -o IN YOUR OWN CONFIGURATION)
set -ogq @peafowl_window_status_style "basic" # basic, rounded, slanted, custom, or none
set -ogq @peafowl_window_text_color "#{@thm_surface_0}"
set -ogq @peafowl_window_number_color "#{@thm_overlay_2}"
set -ogq @peafowl_window_text " #T"
set -ogq @peafowl_window_number "#I"
set -ogq @peafowl_window_current_text_color "#{@thm_surface_1}"
set -ogq @peafowl_window_current_number_color "#{@thm_emerald}"
set -ogq @peafowl_window_current_text " #T"
set -ogq @peafowl_window_current_number "#I"
set -ogq @peafowl_window_number_position "left"

# Window flags
set -ogq @peafowl_window_flags "none"
set -ogq @peafowl_window_flags_icon_last " 󰖰" # -
set -ogq @peafowl_window_flags_icon_current " 󰖯" # *
set -ogq @peafowl_window_flags_icon_zoom " 󰁌" # Z
set -ogq @peafowl_window_flags_icon_mark " 󰃀" # M
set -ogq @peafowl_window_flags_icon_silent " 󰂛" # ~
set -ogq @peafowl_window_flags_icon_activity " 󱅫" # #
set -ogq @peafowl_window_flags_icon_bell " 󰂞" # !
# Matches icon order when using `#F` (`#!~[*-]MZ`)
set -ogq @peafowl_window_flags_icon_format "##{?window_activity_flag,#{E:@peafowl_window_flags_icon_activity},}##{?window_bell_flag,#{E:@peafowl_window_flags_icon_bell},}##{?window_silence_flag,#{E:@peafowl_window_flags_icon_silent},}##{?window_active,#{E:@peafowl_window_flags_icon_current},}##{?window_last_flag,#{E:@peafowl_window_flags_icon_last},}##{?window_marked_flag,#{E:@peafowl_window_flags_icon_mark},}##{?window_zoomed_flag,#{E:@peafowl_window_flags_icon_zoom},} "

# Status line options (DO NOT USE -o IN YOUR OWN CONFIGURATION)
set -ogq @peafowl_status_left_separator ""
set -ogq @peafowl_status_middle_separator ""
set -ogq @peafowl_status_right_separator " "
set -ogq @peafowl_status_connect_separator "yes" # yes, no

# Maintain backwards compatibility. Use @peafowl_status_module_bg_color if it is set.
set -ogq @peafowl_status_module_text_bg "#{?@peafowl_status_module_bg_color,#{E:@peafowl_status_module_bg_color},#{@thm_surface_0}}"
