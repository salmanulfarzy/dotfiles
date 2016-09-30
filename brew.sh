#!/bin/sh
#
# Homebrew
#
# This installs command tools using homebrew

if test ! $(which brew) then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we're using the latest homebrew
brew update

# Upgrade any alrady-installed formulae
brew upgrade --all


# Tapping brew formulas
brew tap homebrew/science
brew tap homebrew/python


# Install GNU core utilities (those coming with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate, `updatedb`, `x-args`
# add `$(brew --prefix findutils)/libexec/gnubin` to `$PATH`, Also MANPATH.
# install without g-prefixed
brew install findutils --with-default-names

# Install some commandline utilities
brew install moreutils --without-parallel
brew install gnu-sed --with-default-names

# Install zsh
# Add `/usr/local/bin/zsh` to `/etc/shells` before running `chsh -s $(which zsh)`. 
brew install zsh
brew install zsh-completions
if ! fgrep '/usr/local/bin/zsh' /etc/shells; then
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/zsh;
fi


# Install Development tools
brew install ack
brew install gawk
brew install gcc --with-all-languages
brew install python
brew install python3
brew install gdb --wth-all-targets --with-python
brew install gdbm
brew install go
brew install node
brew install r

brew install numpy --with-python3
brew install scipy --with-python3
brew install matplotlib --with-python3
brew install opencv3 --with-contrib --with-examples --with-python3 

brew install mongodb
brew install mysql --with-test
brew install postgresql --with-python --with-python3 --with-dtrace
brew install sqlite --with-functions --with-dbstat

brew install macvim --with-override-system-vim --with-python3

brew install gist
brew install heroku
brew install tmux


# Install network tools
brew install wget --with-iri
brew install gnupg2
brew install keybase
brew install ngrep

# Install some multimedia tools
brew install cmus
brew install imagemagick
brew install youtube-dl
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265


# Install some misc utilities
brew install tree
brew install pandoc
brew install submarine
brew install screenfetch
brew install cowsay
brew install fortune

# Remove outdated versions from the cellar
brew cleanup
