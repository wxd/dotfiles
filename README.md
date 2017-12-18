# [Vladimir](http://vl-dz.net)’s dotfiles [![Build Status](https://travis-ci.org/wxd/dotfiles.svg?branch=master)](https://travis-ci.org/wxd/dotfiles)

A fork of [Cătălin Mariș](https://github.com/alrra)’s dotfiles.
See the [README](https://github.com/alrra/dotfiles/blob/master/README.md) file over there for all details.

## Installation sequence

- `os/setup.sh`: the core script (asks for `sudo` rights)
    - `create_directories.sh`: creates directories from a user-specified list
    - `create_symbolic_links.sh`: symlinks the dotfiles to their locations
    - `create_local_config_files.sh`: creates extra "local" dotfiles
    - `install/${OS}/main.sh`: installs software using the `$OS`'s package manager
    - `preferences/${OS}/main.sh`: set `$OS`-specific preferences (e.g., for UI)


## License

The code is available under the [MIT license](LICENSE.txt).
