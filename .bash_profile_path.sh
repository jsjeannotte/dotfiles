# PATH additions
for another_bin in \
    $HOME/bin \
    $HOME/.rbenv/bin
do
    [[ -e $another_bin ]] && export PATH=$another_bin:$PATH
done

# Add brew coreutils to the PATH
EXIST=$(brew --prefix coreutils 2>&1 > /dev/null)
if [ $? -eq 0 ]; then
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH