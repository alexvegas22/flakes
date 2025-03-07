#!/usr/bin/env bash

init() {
    # Vars
    CURRENT_USERNAME='alex'

    # Colors
    NORMAL=$(tput sgr0)
    WHITE=$(tput setaf 7)
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    BRIGHT=$(tput bold)
    UNDERLINE=$(tput smul)
}

confirm() {
    echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
    read -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
}

print_header() {
    echo -E "$CYAN
__/\\\________/\\\_____/\\\\\\\\\\_____________/\\\_____/\\\_____________                       
 _\/\\\_______\/\\\___/\\\///////\\\__________/\\\\\____\/\\\_____________                      
  _\//\\\______/\\\___\///______/\\\_________/\\\/\\\____\/\\\_____________                     
   __\//\\\____/\\\___________/\\\//________/\\\/\/\\\____\/\\\_____________                    
    ___\//\\\__/\\\___________\////\\\_____/\\\/__\/\\\____\/\\\_____________                   
     ____\//\\\/\\\_______________\//\\\__/\\\\\\\\\\\\\\\\_\/\\\_____________                  
      _____\//\\\\\_______/\\\______/\\\__\///////////\\\//__\/\\\_____________                 
       ______\//\\\_______\///\\\\\\\\\/_____________\/\\\____\/\\\\\\\\\\\\\\\_                
        _______\///__________\/////////_______________\///_____\///////////////__
           
__/\\\\\\\\\\\\\\\__/\\\\\\_____________________________________________________________        
 _\/\\\///////////__\////\\\____________________/\\\_____________________________________       
  _\/\\\________________\/\\\___________________\/\\\_____________________________________      
   _\/\\\\\\\\\\\________\/\\\_____/\\\\\\\\\____\/\\\\\\\\________/\\\\\\\\___/\\\\\\\\\\_     
    _\/\\\///////_________\/\\\____\////////\\\___\/\\\////\\\____/\\\/////\\\_\/\\\//////__    
     _\/\\\________________\/\\\______/\\\\\\\\\\__\/\\\\\\\\/____/\\\\\\\\\\\__\/\\\\\\\\\\_   
      _\/\\\________________\/\\\_____/\\\/////\\\__\/\\\///\\\___\//\\///////___\////////\\\_  
       _\/\\\______________/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\_\///\\\__\//\\\\\\\\\\__/\\\\\\\\\\_ 
        _\///______________\/////////___\////////\//__\///____\///____\//////////__\//////////__

                  $BLUE https://github.com/Frost-Phoenix $RED 
      ! To make sure everything runs correctly DONT run as root ! $GREEN
                        -> '"./install.sh"' $NORMAL

    "
}

get_username() {
    echo -en "Enter your$GREEN username$NORMAL : $YELLOW"
    read username
    echo -en "$NORMAL"
    echo -en "Use$YELLOW "$username"$NORMAL as ${GREEN}username${NORMAL} ? "
    confirm
}

set_username() {
    sed -i -e "s/username = \".*\";/username = \"$username\";/g" ./flake.nix
}


get_details() {
    echo -en "Enter your$GREEN name$NORMAL : $YELLOW"
    read name
    echo -en "$NORMAL"
    echo -en "Enter your$GREEN email$NORMAL : $YELLOW"
    read email
    echo -en "$NORMAL"
    echo -en "Use$YELLOW "$name"$NORMAL as ${GREEN}name${NORMAL} and $YELLOW "$email"$NORMAL as ${GREEN}email${NORMAL} ? "
    confirm
}

set_details() {
    sed -i -e "s/name = \".*\";/name = \"$name\";/g" ./modules/core/user.nix
    sed -i -e "s/email = \".*\";/email = \"$email\";/g" ./modules/core/user.nix
    sed -i -e "s/userName = \".*\";/name = \"$name\";/g" ./modules/home/git/default.nix
    sed -i -e "s/userEmail = \".*\";/email = \"$email\";/g" ./modules/home/git/default.nix
}

get_host() {
    echo -en "Choose a ${GREEN}host${NORMAL} - [${YELLOW}D${NORMAL}]esktop, [${YELLOW}L${NORMAL}]aptop, [${YELLOW}T${NORMAL}]ouch or [${YELLOW}V${NORMAL}]irtual machine: "
    read -n 1 -r
    echo

    if [[ $REPLY =~ ^[Dd]$ ]]; then
        HOST='desktop'
    elif [[ $REPLY =~ ^[Ll]$ ]]; then
        HOST='laptop'
    elif [[ $REPLY =~ ^[Tl]$ ]]; then
        HOST='touch'
    elif [[ $REPLY =~ ^[Vv]$ ]]; then
        HOST='vm'
    else
        echo "Invalid choice. Please select 'D' for desktop, 'L' for laptop or 'V' for virtual machine."
        exit 1
    fi

    echo -en "$NORMAL"
    echo -en "Use the$YELLOW "$HOST"$NORMAL ${GREEN}host${NORMAL} ? "
    confirm
}

install() {
    echo -e "\n${RED}START INSTALL PHASE${NORMAL}\n"

    # Create basic directories
    echo -e "Creating folders:"
    echo -e "    - ${MAGENTA}~/Music${NORMAL}"
    echo -e "    - ${MAGENTA}~/Documents${NORMAL}"
    echo -e "    - ${MAGENTA}~/Images/Screenshots${NORMAL}"
    mkdir -p ~/Music
    mkdir -p ~/Documents
    mkdir -p ~/Images/Screenshots
    mkdir -p ~/Images/Wallpapers
    # Copy the wallpapers
    echo -e "Copying all ${MAGENTA}wallpapers${NORMAL}"
    cp -r wallpapers/* ~/Images/Wallpapers

    # Get the hardware configuration
    echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${HOST}/${NORMAL}\n"

    cp /etc/nixos/hardware-configuration.nix hosts/${HOST}/hardware-configuration.nix

    # Last Confirmation
    echo -en "You are about to start the system build, do you want to process ? "
    confirm

    # Build the system (flakes + home manager)
    echo -e "\nBuilding the system...\n"
    sudo nixos-rebuild switch --flake .#${HOST}
}

main() {
    init

    print_header

    get_username
    set_username
    get_details
    set_details
    get_host

    install
}

main && exit 0
