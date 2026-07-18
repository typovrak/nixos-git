[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 🫆 NixOS Git

> Declarative NixOS module to install Git and deploy a per-user ```.gitconfig``` with your preferred identity and defaults.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config deployment :** Copies your ```.gitconfig``` into the user’s home with ```600``` permissions and correct ownership.
- 🌐 **Git installation :** Ensures ```git``` is available in ```environment.systemPackages```.
- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, will overwrite stale config but preserve file integrity.
- ⚙️ **Simple defaults :** Configure user name, email, default branch, pull‐rebase and push behavior in one file.
- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.gitconfig``` before applying.

## 📂 Repository structure

```bash
❯ tree -a -I ".git|.github"
.
├── configuration.nix # module configuration
├── .gitconfig        # git configuration with great defaults
├── LICENSE.md        # MIT license
└── README.md         # this documentation

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.gitconfig{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-git = fetchGit {
    url = "https://github.com/typovrak/nixos-git.git";
    ref = "main";
    rev = "5909c9068bd02261a2379121b85b10c6400e1238
"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-git}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-git = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-git.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-git}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-git.git &&
cd nixos-git &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Git global username value
```bash
git config --global user.name
```

Git global email value
```bash
git config --global user.email
```
And more like the default branch to ```main```, no need to push with the flag ```--set-upstream``` and ```rebasing``` by default instead of merging.

## 📚 Learn more

- 📘 [Git book](https://git-scm.com/book/en/v2) : A complete guide to using Git effectively, from beginner to advanced usage.
- ⚙️ [Git configuration reference](https://git-scm.com/docs/git-config) : Full list of all config options available in ```.gitconfig```.
- 🧩 [Git aliases inspiration](https://github.com/GitAlias/gitalias) : Large curated list of useful and time saving Git aliases.
- 🎓 [GitHub Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf) : Quick printable PDF reference from GitHub.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
