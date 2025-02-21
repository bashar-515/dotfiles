# dotfiles
## Before running the setup script, ensure that you have the proper dependencies installed! See below for details.
#### setup.sh
1. From .
```
chmod +x script.sh
```
2. Run
```
./setup.sh
```

## Darwin
### Steps
#### Requisite Tools
1. Xcode command line tools
```
xcode-select --install
```
2. Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Run the following command to make the brew command available in the current shell session.
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```
3. To complete the process, run the following command while `cd`'ed into the 'common' subdirectory to install my preferred base tools,
listed in the common/Brewfile
```
brew bundle
```
**Recap** Download the Xcode command line tools; download Homebrew and ensure that its usable from within the shell session; run `brew
bundle` from inside the 'common' subdirectory.

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

## TODO
1. Configure Git and Docker completions (in zsh & bash). Git in Bash is done.
