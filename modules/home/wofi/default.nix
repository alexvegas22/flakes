{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    style = ''
@define-color background #191919;
@define-color color0 #AA5577;
@define-color color1 #BB6677;
@define-color color2 #CC7788;
@define-color color3 #DD8899;
@define-color color4 #EE99AA;
@define-color color5 #FFAACB;
@define-color color6 #FFBBCC;
@define-color color7 #FFCCDD;
@define-color color8 #FFDDFF;
@define-color color9 #FFEEFF;
@define-color text rgba(255,255,255,0.8);

* {
  all: unset;
    font-family: "CaskaydiaCove Nerd Font";
    font-size: 13px;
    font-weight: 600;
    color: @text;
}

#window {
    border: 1px solid @color1;
    border-radius: 10px;
}

#outer-box {
    background-color: @background;
    border: 1px solid @color0;
    border-radius: 10px;
}

#input{
    margin: 1rem;
    padding: 5px;
    border-radius: 10px;
    color: @text;
    background-color: alpha(@color3,0.3);
}

#entry {
    margin: 0.25rem 0.75rem 0.25rem 0.75rem;
    padding: 0.25rem 0.75rem 0.25rem 0.75rem;
    color: @text;
    border-radius: 10px;
}

#entry:selected {
    background-color: alpha(@color1,0.5);
    color: @text;
}


expander > title > arrow {
    border-radius: 50%;
    background-color: @color1;
    margin-right: 5px;
}

expander > title > arrow:checked {
    background-color: @color7;
}

'';
  };
}
