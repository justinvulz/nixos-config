{ pkgs, ... }:
{

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-color-emoji
    liberation_ttf
    # fira-code
    # fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    meslo-lgs-nf
    wqy_zenhei
    wqy_microhei
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    roboto
    source-sans-pro
    source-sans
    source-han-sans
    font-awesome
  ];
  fonts.fontDir.enable = true;
}
