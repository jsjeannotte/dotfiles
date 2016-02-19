# PATH additions

pths=( /usr/local/bin /usr/local/sbin $HOME/bin /apps/cassandra/bin /apps/cassandra/tools $HOME/tools/wrapper $HOME/scripts $HOME/bin $HOME/.rbenv/bin $HOME/n/stash/NEBULA/wrapper )
for p in ${pths[@]}; do
    if [ -e $p ] && [ ! `echo $PATH|grep -q $p` ]; then
        export PATH=$p:$PATH
    fi
done

# PYTHONPATH additions
pythonpths=( /usr/local/lib/python2.7/site-packages )
for p in ${pythonpths[@]}; do
    if [ -e $p ] && [ ! `echo $PYTHONPATH|grep -q $p` ]; then
        export PYTHONPATH=$p:$PYTHONPATH
    fi
done

# # Add brew coreutils to the PATH
# BREWTEST=$(brew --prefix coreutils 2>&1 > /dev/null)
# if [ $? -eq 0 ]; then
#     export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# fi
