# `~/.local/bin`

```bash
# 1. Create the goal directory if it doesn't exist, does nothing otherwise
mkdir -p ~/.local/bin

# 2. Create symbolic link
ln -sv ~/dotfiles/local/bin/* ~/.local/bin

# Or, if there's nothing currently in the ~/.local/bin directory
ln -sv ~/dotfiles/local/bin ~/.local
```

Note that this requires the directory of `~/.local/bin` to be within the `PATH`.

An easy way to view whether or not this is in the `PATH` or not is with:

```bash
# Prints the PATH variable, transforms all instances of the colon separator into
# newline characters, then does a grep for the directory we're looking for
echo $PATH | tr ':' '\n' | ag '\.local/bin'
```
