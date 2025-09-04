# Sketchybar

## Installing

First install Sketchybar:
https://github.com/FelixKratz/SketchyBar

```sh
brew tap FelixKratz/formulae
brew install sketchybar
```

Then if using the Lua API:
https://github.com/FelixKratz/SbarLua

```sh
git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/
```

For LUA to actually find the module, it has to reside in a path included in the lua cpath (TODO: Install module into the default lua cpath), e.g.:

```sh
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"
```

TODO -> Install the config:

```sh
curl -L https://raw.githubusercontent.com/john-json/Ilstr01-sketchybar/master/install_sketchybar.sh | sh
```

## Usage

Start Sketchybar:

```sh
brew services start sketchybar
```

Reload sketchybar:

```sh
brew services reload sketchybar
```

OR

```sh
sketchybar --reload
```

And/or add alias in .zshrc or .bashrc
and reload it in terminal with "sbrld":

```sh
 echo "alias sbrld = "brew services reload sketchybar" " >> ~/.zshrc
```
