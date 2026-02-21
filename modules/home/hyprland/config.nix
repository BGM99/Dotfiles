{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {

      "$mod" = "SUPER";

      # monitor settings from nwg-displays
      source = "~/.config/hypr/monitors.conf";

      # autostart
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "nm-applet &"
        "swww-daemon &"
        "sleep 5 && swww img $(find ~/Pictures/wallpapers -maxdepth 1 -type f)"
        "hyprctl setcursor Nordzy-cursors 22 &"
        "poweralertd &"
        "waybar &"
        "swaync &"
        "wl-paste --watch cliphist store &"
        "hyprlock"
      ];

      input = {
        kb_layout = "de";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        "col.inactive_border" = "0x00000000";
      };

      misc = {
        disable_autoreload = false;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          ignore_window = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        # show keybinds list
        "$mod, F1, exec, show-keybinds"

        # keybindings
        "$mod, Return, exec, kitty"
        "ALT, Return, exec, kitty --title float_kitty"
        "$mod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "$mod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen, 0"
        "$mod SHIFT, F, fullscreen, 1"
        "$mod, Space, togglefloating,"
        "$mod, D, exec, fuzzel"
        "$mod SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'"
        "$mod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mod, Escape, exec, swaylock"
        "$mod SHIFT, Escape, exec, shutdown-script"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, E, exec, nautilus"
        "$mod SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped"
        "$mod, C ,exec, codium"
        "$mod, W,exec, wallpaper-picker"
        "$mod SHIFT, W, exec, live-wp-picker"

        # screenshot
        "$mod, Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --cursor --freeze copy area"

        # switch focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # switch workspace
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # same as above, but switch to the workspace
        "$mod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"
        "$mod CTRL, c, movetoworkspace, empty"

        # window control
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
        "$mod CTRL, left, resizeactive, -80 0"
        "$mod CTRL, right, resizeactive, 80 0"
        "$mod CTRL, up, resizeactive, 0 -80"
        "$mod CTRL, down, resizeactive, 0 80"
        "$mod ALT, left, moveactive,  -80 0"
        "$mod ALT, right, moveactive, 80 0"
        "$mod ALT, up, moveactive, 0 -80"
        "$mod ALT, down, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "$mod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      ];

      # mouse binding
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
