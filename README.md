# My Linux Config files and Bits

Here i will put my Linux config files and other scrips and bits so i can quickly configure a fresh Linux instal

## Terminal : Alacritty

To Install Alacritty terminal
```bash
sudo pacman -S alacritty
```
Alacritty searhces for a configuration file at the following palces in this order:
> - `$XDG_CONFIG_HOME/alacritty/alacritty.yml`
> - `$XDG_CONFIG_HOME/alacritty.yml`
> - `$HOME/.config/alacritty/alacritty.yml`
> - `$HOME/.alacritty.yml`

I personally put my Alacritty config in:
> `$HOME/.config/alacritty/alacritty.yml`