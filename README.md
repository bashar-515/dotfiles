To clone, run `git clone --recursive git@github.com:bashar-515/dotfiles.git`.

# dotfiles
## Before running the scripts, ensure that you have the proper dependencies installed! See below for details.
Once you have the requisite tools installed, you may proceed by first running 'install.sh', found in the top level of this repository.
Then, you can run 'stow.sh' to ensure that the proper dot files are located in the correct folder. The installation script may require root
access. 'stow.sh' will not, however both scripts expect to take in a directory as a parameter. The same directory should be passed to both,
and it should be the home directory of the non-root user with which you will be using this setup. This design choice is to allow the
installation script to be executed by 'USER root' when using Docker.

## Darwin
### Steps
#### Requisite Tools
1. Xcode command line tools
```
xcode-select --install
```

#### Settings
##### System
- Navigate desktops using CTRL: Settings -> Keyboard -> Keyboard Shortcuts -> Mission Control -> "Mission Control"
- Stop automatically rearranging desktops: Settings -> Desktop & Dock -> "Automatically rearrange Spaces based on most recent use"
- Swap CTRL and CAPS LOCK keys: Settings -> Keyboard -> Keyboard Shortcuts -> Modifier Keys -> Swap the keys using their respective dropdown menus
- Prevent screen from dimming on battery: Settings -> Battery -> Options -> "Slightly dim the display on battery"
- Stop automatically adjusting brightness: Settings -> Displays -> "Automatically adjust brightness"
- Turn off keyboard backlighting: Settings -> Keyboards -> "Adjust keyboard brightness in lowlight"
- Always show scroll bar: Settings -> Appearance -> Show scroll bars -> "Always"
- Click scroll bar: Settings -> Appearance -> Click the scroll bar to -> "Jump to the spot that's clicked"
- Don't play sound on startup: Settings -> Sound -> "Play sound on startup"
- Stop rearranging apps in dock: Settings -> Desktop & Dock -> "Show suggested and recent apps in dock"
- Don't autofill passwords: Settings -> Autofill & Passwords -> "Autofill Passwords and Passkeys"
##### Finder
- Show Finder path bar: View -> "Show Path Bar"
- Show Finder status bar: View -> "Show Status Bar"

## Linux
### Steps 
#### Requisite tools
Other that `apt`, there are none!

_The Linux installation script is meant specifically for setting up an Ubuntu Docker image. Other distributions will not work because the
script relies on `apt`._

## TODO
1. Configure Git and Docker completions (in zsh & bash). Git in Bash is done.
2. Automate _everything_ so that no manual steps are necessary.
