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
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/bae/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Clone this repository.

```bash
git clone git@github.com:bashar-515/dotfiles.git
```

Install the desired Homebrew packages.

```bash
brew bundle
```

Remove the .zprofile file created when adding Homebrew to PATH from your home directory.

```bash
rm .zprofile
```

Move the .ssh directory and .gitconfig file into the dotfiles repository.

```bash
mv .gitconfig dotfiles/git/.gitconfig
mv .ssh dotfiles/ssh/
```

Now, it's finally time to stow our configuration and dot files!

```bash
stow alacritty
stow bash
stow git
stow ssh
stow zsh
```

That concludes the initalization from within the Mac Terminal. The next steps are more fun to do in Alacritty!

### The Fun Stuff (Alacritty! Neovim! Tmux!)
