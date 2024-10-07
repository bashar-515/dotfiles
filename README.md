# Bashar's Dotfiles

This is kind of a reference/handbook/guide for me to use while setting up a new Macbook. Maybe in the distant future this'll be worth automating, but I'm really not setting up Apple computers often enough for this to become especially burdensome. Plus, I think it's kind of good to actually go through the steps manually each time as a final defense against anything out of the ordinary. Happy ricing!

## Instructions

### INITIALIZATION (from Mac Terminal)

Install Xcode Command Line Tools.

```bash
xcode-select --install
```

Globally set Git configuration values.

```bash
git config --global user.name "First Last"
```

```bash
git config --global user.email me@example.com
```

Generate an SSH key. Save the key in the default file with no passphrase.

```bash
ssh-keygen -t ed25519 -C "me@example.com"
```

Start the ssh-agent in the background.

```bash
eval "$(ssh-agent -s)"
```

Add the key to the ssh-agent.

```bash
ssh-add ~/.ssh/id_ed25519
```

Make sure to add the public key to your GitHub account's public keys! Copy the key from the file it was saved to.

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

Install [Homebrew](https://brew.sh).

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to your PATH.

```bash
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Clone this repository. CD into it.

```bash
git clone --recurse-submodules git@github.com:bashar-515/dotfiles.git
```

```bash
cd dotfiles
```

Install the desired Homebrew packages, and then return to HOME.

```bash
brew bundle
```
Install pyenv-pyright

```
git clone https://github.com/alefpereira/pyenv-pyright.git $(pyenv root)/plugins/pyenv-pyright
```

```bash
cd ~
```

Remove the .zprofile file created when adding Homebrew to PATH from your home directory.

```bash
rm .zprofile
```

Move the .ssh directory and .gitconfig file into the dotfiles repository.

```bash
mv .gitconfig dotfiles/git/.gitconfig
```

```bash
mv .ssh dotfiles/ssh/
```

Now, it's finally time to stow our configuration and dot files! CD back into this directory and stow away.

```bash
cd dotfiles
```

```bash
stow alacritty
```

```bash
stow bash
```

```bash
stow git
```

```bash
stow ssh
```

```bash
stow zsh
```

```bash
stow tmux
```

```bash
stow starship
```

```bash
stow fastfetch
```

```bash
stow nvim
```

```bash
stow aliases
```

```bash
stow wezterm
```

```bash
stow viam
```

That concludes the initalization from within the Mac Terminal. The next steps are more fun to do in Alacritty!

### The Fun Stuff (Alacritty! Neovim! Tmux!)

Everything should be ready on launch. With Tmux, you might have to press "Shift+i" after pressing the leader from within a Tmux session. You might also have to potentially source the Tmux configuration file afterwards by entering "r" after pressing the leader.

For Sublime, enter the app and open the command palette (CMD+Shift-p). Select "Install Package Control" to be able to install packages (themes, plugins, etc.).

### OS Settings

Some desired settings can be set by simply running the the .macos script in this repository after giving it the right permissions.

```bash
chmod u+x .macos
```

```bash
./.macos
```

The settings that follow must be changed manually through a GUI (like the computers system settings).

1. Navigate desktops using CTRL+DesktopNumber: System Settings -> Keyboard -> Keyboard Shortcuts -> Mission Control -> "check" the Mission Control option
2. Stop automatically rearranging desktops: System Settings -> Desktop & Dock -> turn off "Automatically rearrange Spaces based on most recent use"
3. Turn dock hiding off: System Settings -> Keyboard -> Keyboard Shortcuts -> Launchpad & Dock -> uncheck "Turn Dock hiding on/off"

Once step 3 is completed, Rectangle's settings can be imported from RectangleConfig.json.

4. Swap control and Caps Lock keys: System Settings -> Keybaord -> Keyboard Shortcuts -> Modifier Keys -> Swap Control and Caps Lock from their respective dropdown menus
5. Install Sublime's package manager: open command palette from within Sublime (cmd+shift+p) -> type "Install Package Control" -> hit enter
6. Install and set Sublime colorscheme to Dracula
7. (Finder) show path bar: from "view" in top bar of screen, select "show path bar"
8. (Finder) show status bar: from "view" in top bar of screen, select "show status bar"
9. Prevent screen from dimming on batter: System Settings -> battery -> options -> turn off "Slightly dim the display on battery"
10. Stop automatically adjusting brightness: System Settings -> Displays -> turn off "automatically adjust brightness"
11. Turn off keyboard backlighting: System Settings -> Keyboards -> turn keyboard brightness all the way down and turn off "Adjust keyboard brightness in low light"
12. Automatically show and hide the dock: System Settings -> Desktop & Dock -> Turn on "Automatically show and hide the dock"
13. Make dock smaller: System Settings -> Desktop & Dock -> decrease "size" slider
14. Show scroll bar: System Settings -> Appearance -> check "Always" under "Show scroll bars"
15. Click scroll bar: System Settings -> Appearance -> check "Jump to spot that's clicked" under "Click in the scroll bar to"
16. Don't play sound on startup: System Settings -> sound -> turn off "Play sound on startup"
18. Stop rearranging apps in dock: System Settings -> Desktop and Dock -> turn off "show suggested and recent apps in dock"
19. Set firefox as default browser
20. Lock screen: Start screen saver when inactive (for 20 min), turn display off on battery when inactive for 30 min, turn display off on power adapter when inactive for 1 hour, require password after screen saver begins or display is turned off immediately
21. Don't autofill passwords: System Settings -> Passwords -> password options -> turn off autofill passwords and passkeys

Note: Every shell uses zsh (i.e., it's the default shell, and it's used in wezterm, tmux on wezterm, and tmux on alacritty). Pure alacritty, though, uses bash.

WORK installs
download 1-3 through brew on non-work computer
1. Slack (jamf)
2. Zoom (jamf)
3. 1password (jamf)

HOME installs
1. Slack (Brew)
2. Zoom (Brew)
3. 1password (Brew)
4. Numbers (App store)
5. Google Chrome (Brew)

BOTH installs
1. delve (go install)
2. Logi Options+ (online)

Python workflow
```
pyenv install 3.12 # installs python version
pyenv virtualenv project # creates virtual environment
pyenv local project # sets local python version (i.e., within cwd) to be virtual environment
pyenv pyright # points pyright lsp to use local environment
```

TODO
- have WezTerm use zsh and Alacritty use Bash regardless of tmux
- figure out why virtual env name shows up above prompt in zsh
- fix starship space between cwd and git branch bug
- nvim "go to declaration" not working
- configure bash completions
