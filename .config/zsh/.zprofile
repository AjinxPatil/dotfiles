# ==========================
# Package Managers
# ==========================
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ==========================
# PATH Modifications
# ==========================
# Prefer GNU utilities over macOS
gnuutils=(coreutils findutils gnu-sed gnu-tar gnu-which gawk grep make diffutils)
for gnuutil in "${gnuutils[@]}"; do
	gnuutil_path="/opt/homebrew/opt/$gnuutil/libexec/gnubin"
	if [[ -e "$gnuutil_path" ]]; then
		export PATH="$gnuutil_path:$PATH"
	fi
	gnuutil_manpath="/opt/homebrew/opt/$gnuutil/libexec/gnuman"
	if [[ -e "$gnuutil_manpath" ]]; then
		export MANPATH="$gnuutil_manpath:$MANPATH"
	fi
done
unset gnuutils gnuutil gnuutil_path gnuutil_manpath
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH" # gnu-getopt has no libexec/gnubin

# Python
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"

# ==========================
# Environment Variables
# ==========================
# Groovy
export GROOVY_HOME="/opt/homebrew/opt/groovy/libexec"

# ==========================
# Local/Extra Config
# ==========================
# Extend profile with Adobe config
if [[ -f ~/.config/adobe/zprofile ]]; then
	source ~/.config/adobe/zprofile
fi
