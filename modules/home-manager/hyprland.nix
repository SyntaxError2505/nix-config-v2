# Hyprland configuration (Lua format).
#
# Only the *config files* are managed here (wayland.windowManager.hyprland
# renders ~/.config/hypr/hyprland.lua). The compositor itself, XWayland and
# the desktop entry are installed by the NixOS module in
# modules/desktop/hyprland.nix, and portals are set up system-wide in
# modules/services/xdg.nix — hence package/systemd/portalPackage = null.
#
# The declarative parts (monitor, look & feel, input, animations, window
# rules, autostart) live in `settings` and are rendered to hl.*() calls.
# Keybindings use Lua locals, string concatenation and a `for` loop, which
# are hard to express declaratively, so they live in ./keybinds.lua and are
# auto-required from the generated hyprland.lua.

{ lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;          # installed by the NixOS module
    portalPackage = null;    # portals are configured system-wide
    systemd.enable = false;  # NixOS module handles the session
    configType = "lua";      # generate hyprland.lua (not hyprland.conf)

    settings = {
      # ------------------------------------------------------------------
      # Monitor
      # ------------------------------------------------------------------
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = "1";
      };

      # ------------------------------------------------------------------
      # Environment variables
      # ------------------------------------------------------------------
      env = [
        { _args = [ "XCURSOR_SIZE" "24" ]; }
        { _args = [ "HYPRCURSOR_SIZE" "24" ]; }
      ];

      # ------------------------------------------------------------------
      # Look and feel (each list element is one hl.config(...) call)
      # ------------------------------------------------------------------
      config = [
        {
          general = {
            gaps_in = 2;
            gaps_out = 5;
            border_size = 2;
            col = {
              active_border = "rgb(fabd2f)";
              inactive_border = "rgba(595959aa)";
            };
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };
          decoration = {
            rounding = 0;
            rounding_power = 0;
            active_opacity = 1.0;
            inactive_opacity = 1.0;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = 3994688026; # 0xee1a1a1a — Nix has no hex literals
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };
          animations.enabled = false;
        }
        {
          dwindle.preserve_split = true;
          master.new_status = "master";
          scrolling.fullscreen_on_one_column = true;
        }
        {
          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
          };
        }
        {
          input = {
            kb_layout = "de";
            kb_variant = "";
            kb_model = "";
            kb_options = "";
            kb_rules = "";

            follow_mouse = 1;
            sensitivity = 0;

            touchpad.natural_scroll = true;
          };
        }
      ];

      # ------------------------------------------------------------------
      # Default curves and animations
      # ------------------------------------------------------------------
      curve = [
        {
          _args = [
            "easeOutQuint"
            { type = "bezier"; points = [ [ 0.23 1 ] [ 0.32 1 ] ]; }
          ];
        }
        {
          _args = [
            "easeInOutCubic"
            { type = "bezier"; points = [ [ 0.65 0.05 ] [ 0.36 1 ] ]; }
          ];
        }
        {
          _args = [
            "linear"
            { type = "bezier"; points = [ [ 0 0 ] [ 1 1 ] ]; }
          ];
        }
        {
          _args = [
            "almostLinear"
            { type = "bezier"; points = [ [ 0.5 0.5 ] [ 0.75 1 ] ]; }
          ];
        }
        {
          _args = [
            "quick"
            { type = "bezier"; points = [ [ 0.15 0 ] [ 0.1 1 ] ]; }
          ];
        }
        {
          _args = [
            "easy"
            { type = "spring"; mass = 1; stiffness = 71.2633; dampening = 15.8273644; }
          ];
        }
      ];

      animation = [
        { leaf = "global"; enabled = true; speed = 10; bezier = "default"; }
        { leaf = "border"; enabled = true; speed = 5.39; bezier = "easeOutQuint"; }
        { leaf = "windows"; enabled = true; speed = 4.79; spring = "easy"; }
        { leaf = "windowsIn"; enabled = true; speed = 4.1; spring = "easy"; style = "popin 87%"; }
        { leaf = "windowsOut"; enabled = true; speed = 1.49; bezier = "linear"; style = "popin 87%"; }
        { leaf = "fadeIn"; enabled = true; speed = 1.73; bezier = "almostLinear"; }
        { leaf = "fadeOut"; enabled = true; speed = 1.46; bezier = "almostLinear"; }
        { leaf = "fade"; enabled = true; speed = 3.03; bezier = "quick"; }
        { leaf = "layers"; enabled = true; speed = 3.81; bezier = "easeOutQuint"; }
        { leaf = "layersIn"; enabled = true; speed = 4; bezier = "easeOutQuint"; style = "fade"; }
        { leaf = "layersOut"; enabled = true; speed = 1.5; bezier = "linear"; style = "fade"; }
        { leaf = "fadeLayersIn"; enabled = true; speed = 1.79; bezier = "almostLinear"; }
        { leaf = "fadeLayersOut"; enabled = true; speed = 1.39; bezier = "almostLinear"; }
        { leaf = "workspaces"; enabled = true; speed = 1.94; bezier = "almostLinear"; style = "fade"; }
        { leaf = "workspacesIn"; enabled = true; speed = 1.21; bezier = "almostLinear"; style = "fade"; }
        { leaf = "workspacesOut"; enabled = true; speed = 1.94; bezier = "almostLinear"; style = "fade"; }
        { leaf = "zoomFactor"; enabled = true; speed = 7; bezier = "quick"; }
      ];

      # ------------------------------------------------------------------
      # Touchpad gesture
      # ------------------------------------------------------------------
      gesture = {
        fingers = 3;
        direction = "horizontal";
        action = "workspace";
      };

      # ------------------------------------------------------------------
      # Window rules
      # ------------------------------------------------------------------
      window_rule = [
        {
          name = "suppress-maximize-events";
          match.class = ".*";
          suppress_event = "maximize";
        }
        {
          name = "fix-xwayland-drags";
          match = {
            class = "^$";
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }
        {
          name = "move-hyprland-run";
          match.class = "hyprland-run";
          move = "20 monitor_h-120";
          float = true;
        }
      ];

      # ------------------------------------------------------------------
      # Autostart
      # ------------------------------------------------------------------
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("noctalia-shell")
            end
          '')
        ];
      };
    };

    # Keybindings, kept as plain Lua because they use locals, string
    # concatenation and a loop (see ./keybinds.lua).
    extraLuaFiles = {
      keybinds = ./keybinds.lua;
    };
  };
}