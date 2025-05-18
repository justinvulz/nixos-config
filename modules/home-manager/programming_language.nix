{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    #gnat14

    typst
    lean4
    #rustc 

    #cargo 

  ];

}
