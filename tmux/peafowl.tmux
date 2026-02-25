# vim:set ft=tmux:

# Inspred by https://github.com/peafowl/tmux

source -F "#{d:current_file}/themes/peafowl_theme.tmux"

%if "#{==:#{@peafowl_status_background},default}"
  set -gF @_ctp_status_bg "#{@thm_mantle}"
  set -gF status-style "bg=#{@_ctp_status_bg},fg=#{@thm_fg}"

  %hidden CTP_MESSAGE_BACKGROUND="#{@thm_overlay_0}"
%elif "#{==:#{@peafowl_status_background},none}"
  set -g status-style "default"
  set -g @_ctp_status_bg "none"

  %hidden CTP_MESSAGE_BACKGROUND="default"
%else
  # Treat @peafowl_status_background as a format string.
  set -gF status-style "bg=#{E:@peafowl_status_background},fg=#{@thm_fg}"
  set -gF @_ctp_status_bg "#{E:@peafowl_status_background}"

  %hidden CTP_MESSAGE_BACKGROUND="#{E:@peafowl_status_background}"
%endif

# messages
set -gF message-style "fg=#{@thm_navy},bg=$CTP_MESSAGE_BACKGROUND,align=centre"
set -gF message-command-style "fg=#{@thm_navy},bg=$CTP_MESSAGE_BACKGROUND,align=centre"

# menu
%if "#{>=:#{version},3.4}"
  set -gF menu-selected-style "#{E:@peafowl_menu_selected_style}"
%endif

# panes
set -wgF pane-active-border-style "#{E:@peafowl_pane_active_border_style}"
set -wgF pane-border-style "#{E:@peafowl_pane_border_style}"

%if "#{==:#{@peafowl_pane_status_enabled},yes}"
  # "internal" variables are kept as @_ctp_p_.*
  # and then unset at the end.
  set -gq @_ctp_p_left "" # the content on the left, usually a separator
  set -gq @_ctp_p_middle ""
  set -gq @_ctp_p_right ""
  set -gq @_ctp_p_number ""
  set -gq @_ctp_p_text ""

  %if "#{==:#{@peafowl_pane_default_fill},none}"
    set -g @_ctp_p_left \
      "#[fg=#{@thm_surface_0},bg=default]#{@peafowl_pane_left_separator}"
    set -g @_ctp_p_middle \
      "#[fg=#{@thm_fg},bg=#{@thm_surface_0}]#{@peafowl_pane_middle_separator}"
    set -g @_ctp_p_right \
      "#[fg=#{@thm_surface_0},bg=default]#{@peafowl_pane_right_separator}"

    set -g @_ctp_p_number \
      "#[fg=#{@thm_fg},bg=#{@thm_surface_0}]##{pane_index}"
    set -g @_ctp_p_text \
      "#[fg=#{@thm_fg},bg=#{@thm_surface_0}]#{E:@peafowl_pane_default_text}"

  %elif "#{==:#{@peafowl_pane_default_fill},all}"

    set -g @_ctp_p_left \
      "#[fg=#{E:@peafowl_pane_color},bg=default]#{@peafowl_pane_left_separator}"
    set -g @_ctp_p_middle \
      "#[fg=#{E:@peafowl_pane_color},bg=#{E:@peafowl_pane_background_color}]#{@peafowl_pane_middle_separator}"
    set -g @_ctp_p_right \
      "#[fg=#{E:@peafowl_pane_color},bg=default]#{@peafowl_pane_right_separator}"

    set -g @_ctp_p_number \
      "#[fg=#{E:@peafowl_pane_background_color},bg=#{E:@peafowl_pane_color}]##{pane_index}"
    set -g @_ctp_p_text \
      "#[fg=#{E:@peafowl_pane_background_color},bg=#{E:@peafowl_pane_color}]#{E:@peafowl_pane_default_text}"

  %elif "#{==:#{@peafowl_pane_default_fill},number}"

    %if "#{==:#{@peafowl_pane_number_position},left}"
      set -g @_ctp_p_left \
        "#[fg=#{E:@peafowl_pane_color},bg=default]#{@peafowl_pane_left_separator}"
      set -g @_ctp_p_right \
        "#[fg=#{E:@peafowl_pane_background_color},bg=default]#{@peafowl_pane_right_separator}"
    %else
      set -g @_ctp_p_left \
        "#[fg=#{E:@peafowl_pane_background_color},bg=default]#{@peafowl_pane_left_separator}"
      set -g @_ctp_p_right \
        "#[fg=#{E:@peafowl_pane_color},bg=default]#{@peafowl_pane_right_separator}"
    %endif

    set -g @_ctp_p_middle \
      "#[fg=#{E:@peafowl_pane_color},bg=#{E:@peafowl_pane_background_color}]#{@peafowl_pane_middle_separator}"

    set -g @_ctp_p_number \
      "#[fg=#{E:@peafowl_pane_background_color},bg=#{E:@peafowl_pane_color}]##{pane_index}"
    set -g @_ctp_p_text \
      "#[fg=#{E:@peafowl_pane_color},bg=#{E:@peafowl_pane_background_color}]#{E:@peafowl_pane_default_text}"

  %endif

  %if "#{==:#{@peafowl_pane_number_position},left}"
    set -wgF pane-border-format \
      "#{E:@_ctp_p_left}#{E:@_ctp_p_number}#{E:@_ctp_p_middle} #{E:@_ctp_p_text}#{E:@_ctp_p_right}"
  %else
    set -wgF pane-border-format \
      "#{E:@_ctp_p_left}#{E:@_ctp_p_text} #{E:@_ctp_p_middle}#{E:@_ctp_p_number}#{E:@_ctp_p_right}"
  %endif

  set -ug @_ctp_p_left
  set -ug @_ctp_p_middle
  set -ug @_ctp_p_right
  set -ug @_ctp_p_number
  set -ug @_ctp_p_text
%endif

# popups
%if "#{>=:#{version},3.4}"
  set -gF popup-style "bg=#{@thm_bg},fg=#{@thm_fg}"
  set -gF popup-border-style "fg=#{@thm_surface_1}"
%endif

%if "#{==:#{@peafowl_window_status_style},basic}"

  set -gq @peafowl_window_left_separator " "
  set -gq @peafowl_window_middle_separator " "
  set -gq @peafowl_window_right_separator " "

%elif "#{==:#{@peafowl_window_status_style},rounded}"

  set -gq @peafowl_window_left_separator "#[fg=#{@_ctp_status_bg},reverse]#[none]"
  set -gq @peafowl_window_middle_separator " "
  set -gq @peafowl_window_right_separator "#[fg=#{@_ctp_status_bg},reverse]#[none]"

%elif "#{==:#{@peafowl_window_status_style},slanted}"

  set -gq @peafowl_window_left_separator "#[fg=#{@_ctp_status_bg},reverse]#[none]"

  %if "#{==:#{@peafowl_window_number_position},left}"
    set -gq @peafowl_window_middle_separator "#[fg=#{@peafowl_window_number_color},bg=#{@peafowl_window_text_color}]"
    set -gq @peafowl_window_current_middle_separator \
      "#[fg=#{@peafowl_window_current_number_color},bg=#{@peafowl_window_current_text_color}]"
  %else
    set -gq @peafowl_window_middle_separator " #[fg=#{@peafowl_window_number_color},bg=#{@peafowl_window_text_color}]"
    set -gq @peafowl_window_current_middle_separator \
      " #[fg=#{@peafowl_window_current_number_color},bg=#{@peafowl_window_current_text_color}]"
  %endif

  set -gq @peafowl_window_right_separator "#[fg=#{@_ctp_status_bg},reverse]█#[none]"

%endif

# DO NOT USE -o IN YOUR OWN CONFIGURATION
set -ogqF @peafowl_window_current_left_separator "#{@peafowl_window_left_separator}"
set -ogqF @peafowl_window_current_middle_separator "#{@peafowl_window_middle_separator}"
set -ogqF @peafowl_window_current_right_separator "#{@peafowl_window_right_separator}"

# window status
%if "#{!=:#{@peafowl_window_status_style},none}"
  set -gF window-status-activity-style "bg=#{@thm_amethyst},fg=#{@thm_crust}"
  set -gF window-status-bell-style "bg=#{@thm_yellow},fg=#{@thm_crust}"

   %if "#{==:#{@peafowl_window_flags},icon}"
    set -gqF @_ctp_w_flags "#{E:@peafowl_window_flags_icon_format}"
  %elif "#{==:#{@peafowl_window_flags},text}"
    set -gq @_ctp_w_flags "#F"
  %else
    set -gq @_ctp_w_flags ""
  %endif

  set -g @_ctp_w_number_style "#[fg=#{@thm_crust},bg=#{@peafowl_window_number_color}]"
  set -g @_ctp_w_text_style "#[fg=#{@thm_fg},bg=#{@peafowl_window_text_color}]"
  %if "#{==:#{@peafowl_window_number_position},left}"
    set -gF window-status-format \
      "#{E:@_ctp_w_number_style}#{E:@peafowl_window_left_separator}#{@peafowl_window_number}"
    set -agF window-status-format "#{E:@peafowl_window_middle_separator}"
    set -agF window-status-format \
      "#{E:@_ctp_w_text_style}#{@peafowl_window_text}#{@_ctp_w_flags}#{E:@peafowl_window_right_separator}"
  %else
    set -gF window-status-format \
      "#{E:@_ctp_w_text_style}#{E:@peafowl_window_left_separator}#{E:@_ctp_w_text_style}#{@peafowl_window_text}#{@_ctp_w_flags}"
    set -agF window-status-format "#{E:@peafowl_window_middle_separator}"
    set -agF window-status-format \
      "#{E:@_ctp_w_number_style} #{@peafowl_window_number}#{E:@peafowl_window_right_separator}"
  %endif

  # =======================================
  # And do the same for the current window.
  # =======================================

  set -g @_ctp_w_number_style "#[fg=#{@thm_crust},bg=#{@peafowl_window_current_number_color}]"
  set -g @_ctp_w_text_style "#[fg=#{@thm_fg},bg=#{@peafowl_window_current_text_color}]"
  %if "#{==:#{@peafowl_window_number_position},left}"
    set -gF window-status-current-format \
      "#{E:@_ctp_w_number_style}#{E:@peafowl_window_current_left_separator}#{@peafowl_window_current_number}"
    set -agF window-status-current-format "#{E:@peafowl_window_current_middle_separator}"
    set -agF window-status-current-format \
      "#{E:@_ctp_w_text_style}#{@peafowl_window_current_text}#{@_ctp_w_flags}#{E:@peafowl_window_current_right_separator}"
  %else
    set -gF window-status-current-format \
      "#{E:@_ctp_w_text_style}#{E:@peafowl_window_current_left_separator}#{E:@_ctp_w_text_style}#{@peafowl_window_current_text}#{@_ctp_w_flags}"
    set -agF window-status-current-format "#{E:@peafowl_window_current_middle_separator}"
    set -agF window-status-current-format \
      "#{E:@_ctp_w_number_style} #{@peafowl_window_current_number}#{E:@peafowl_window_current_right_separator}"
  %endif


  # Cleanup (unset) all of the internal variables.
  set -ug @_ctp_w_number_style
  set -ug @_ctp_w_text_style
  set -ug @_ctp_w_flags
%endif

# Mode style. This is used for copy mode highlighting to style the current selection.
set -gF mode-style "bg=#{@thm_surface_0},bold"
set -gF clock-mode-colour "#{@thm_blue}"
