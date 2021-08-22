# $HOME dotfiles organization using yadm

Selective config dotfiles in the $HOME dir are managed using [yadm](https://yadm.io). 

## Caveats

### Templates

Some config files like `bashrc` may differ only slightly for different OS. For such files, use [yadm templates](https://yadm.io/docs/templates).

### Git

User info in [Git config](.config/git/config) is not shared. Add it to `~/.gitconfig`.

### [XDG Base Directory Spec](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

Follow XDG Base Directory Spec but not religiously, only if possible. _Convention over configuration!_
- Some utilities use $HOME dir for storing their config files. There is no need to reconfigure them to store the files in locations as per the spec. No point in excessively cleaning the home directory when there is yadm.
- Some utilities support the spec. Ensure that their config files are in spec default location, `~/.config/`.
- Any user-defined config should adhere the spec, consequently should reside in `~/.config/`.

