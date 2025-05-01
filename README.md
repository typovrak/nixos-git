# 🫆 NixOS Git

> Declarative NixOS module to install Git and deploy a per-user ```.gitconfig``` with your preferred identity and defaults.

## 📦 Features

- 🔒 **Secure config deployment :** Copies your ```.gitconfig``` into the user’s home with ```600``` permissions and correct ownership.

- 🌐 **Git installation :** Ensures ```git``` is available in ```environment.systemPackages```.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, will overwrite stale config but preserve file integrity.

- ⚙️ **Simple defaults :** Configure user name, email, default branch, pull‐rebase and push behavior in one file.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.gitconfig``` before applying.

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

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-git = fetchGit {
    url = "https://github.com/typovrak/nixos-git.git";
    ref = "main";
    rev = "5909c9068bd02261a2379121b85b10c6400e1238"; # update to the desired commit
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

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
