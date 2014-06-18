# PATH additions

pths=( /usr/local/bin /usr/local/sbin $HOME/bin /apps/cassandra/bin /apps/cassandra/tools $HOME/tools/wrapper $HOME/scripts $HOME/bin $HOME/.rbenv/bin )
for p in ${pths[@]}; do
    [ -e $p ] && ! `echo $PATH|grep -q $p` && export PATH=$p:$PATH
done

# PYTHONPATH additions
pythonpths=( /usr/local/lib/python2.7/site-packages )
for p in ${pythonpths[@]}; do
    [ -e $p ] && ! `echo $PYTHONPATH|grep -q $p` && export PYTHONPATH=$p:$PYTHONPATH
done

# Add brew coreutils to the PATH
EXIST=$(brew --prefix coreutils 2>&1 > /dev/null)
if [ $? -eq 0 ]; then
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi
