# Hyprland Config
This is My Hyprland Config, how to use it

## 🚀 How to Install

> [!WARNING]
> I Recomend backup first on your ~/.config, to avoid lost data

If you have a aur yay or paru, this step 1 and 2, can be skipped

### 1. Install AUR
first install aur, i using yay
```bash
# Clone dan install yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
```
### 2. Run Command Before using yay
```bash
yay -Y --gen-db
yay -Syu --devel
yay -Y --devel --save
```

### 3. Install Noctalia
Install Noctalia
```bash
yay -S noctalia
```

### 4. Clone This Repo
forth, clone this repo :
```bash
git clone https://github.com/ShirayukiHimeji/MyConfigHyprland.git ~/MyHyprlandConfig
```

### 4. Just Copy These folder to your ~/.config
```bash
cp ~/MyHyprlandConfig/. ~/.config
```