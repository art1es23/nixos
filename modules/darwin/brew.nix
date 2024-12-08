{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };

    brews = [
      "mas"
      "imagemagick"
    ];

    casks = [
      # NOTE: Homerow isn't available as a cask yet

      "1password"
      # "nordpass"

      # Loosely, social platforms
      "discord"
      "telegram"
      "microsoft-teams"
      "steam"

      # Development
      "docker"
      "figma"
      "utm" # VM on macOS
      "miro"
      "godot"
      "pixelorama"
      # "ngrock"
      # "zed"
      "insomnia" # HTTP requests like Postman

      # Browsers
      "firefox"
      "google-chrome"

      # Productivity
      "obsidian"
      "notion"
      "raycast"
      "deepl"

      # utilities
      "aldente" # battery management
      "appcleaner"
      "cleanmymac"
      "shottr"
      "keka"
      # "cursorcerer"
      "transmission"
      "plover"

      # Additional
      "spotify"
      "binance"
      # "meetingbar" # shows upcoming meetings
      "eul" # mac monitoring
      "wireshark" # network sniffer
      "keycastr" # show keystrokes on screen
      # "obs"

      # UI
      "sf-symbols" # patched font for sketchybar
    ];

    taps = [
      # default
    ];
  };
}
