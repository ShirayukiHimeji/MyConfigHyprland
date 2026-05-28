# Hyprland Config
This is My Hyprland Config, how to use it

## 🚀 How to Install

> [!WARNING]
> I Recomend backup first on your ~/.config, to avoid lost data

If you have a aur [yay](https://github.com/jguer/yay) or [paru](https://github.com/Morganamilo/paru), this step 1 and 2, can be skipped

### I lazy Update this
Before run this step, Run this:
Just getting [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
```bash
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

### 1. Install [AUR](https://aur.archlinux.org/)
first install [aur](https://aur.archlinux.org/), i using [yay](https://github.com/jguer/yay)
```bash
# Clone dan install yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
```
### 2. Run Command Before using [yay](https://github.com/jguer/yay)
```bash
yay -Y --gen-db
yay -Syu --devel
yay -Y --devel --save
```

### 3. Install [Noctalia](https://noctalia.dev/)
Install [Noctalia](https://noctalia.dev/)
```bash
yay -S noctalia
```

### 4. Clone This Repo
forth, clone this repo :
```bash
git clone https://github.com/ShirayukiHimeji/MyConfigHyprland.git ~/MyHyprlandConfig
```

### 5. Just Copy These folder to your ~/.config
```bash
cp ~/MyHyprlandConfig/. ~/.config
```

### 6. Symlink .zshrc and hypr to config file this works
Make sure backup first
```bash
mv ~/.local/share/hypr ~/.local/share/hypr.bak
mv ~/.zshrc ~/.zshrc.bak
```
Then Symlink
```bash
ln -sf ~/.config/hypr ~/.local/share/hypr
ln -sf ~/.config/zsh/.zshrc ~/.zshrc
```

### 7. Enjoy my Config
Enjoy :)