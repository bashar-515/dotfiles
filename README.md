# Bashar's Dotfiles

This is kind of a reference/handbook/guide for me to use while setting up a new Macbook. Maybe in the distant future this'll be worth automating, but I'm really not setting up Apple computers often enough for this to become especially burdensome. Plus, I think it's kind of good to actually go through the steps manually each time as a final defense anything out of the ordinary. Happy ricing!

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

That concludes the initalization from within the Mac Terminal. The next steps are more fun to do in Alacritty!

### The Fun Stuff (Alacritty! Neovim! Tmux!)

No instructions required. Nvim and Alacritty should configure upon launch and be ready for use. Tmux has been giving me some trouble. Before launching Alacritty, exit the current Mac Terminal session. Open a new shell- still using the Mac Terminal. I think you have to manually install tmux packages here. Once that's done, you can uncomment the colorscheme line in .tmux.conf. Only then will Alacritty work exactly as expected.

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
