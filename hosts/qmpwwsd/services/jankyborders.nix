
{
  pkgs,
  ...
}:

{
  services = {
    jankyborders = {
      enable = true;
      package = pkgs.jankyborders;
      width = 8.0;
      style = "round";
      active_color = "gradient(top_left=0xffffc640,bottom_right=0xffba3aa5)";
      inactive_color = "gradient(top_left=0xaa45c4c0,bottom_right=0xaaba3aa5)";
      hidpi = true;
      ax_focus = true;
    };
  };
}
