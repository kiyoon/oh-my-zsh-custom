#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local"


if command -v npm &> /dev/null
then
	if ! command -v fd &> /dev/null
	then
		npm install -g fd-find
	fi
fi

if ! command -v tig &> /dev/null
then
    if [ -z "$HOME/.local/include/ncurses/curses.h" ]
    then
        echo "Ncurses not found in $HOME/.local/include"
        echo "It should have been installed with zsh-local-install.sh"
        echo "Skipping installing tig."
    else
        TEMPDIR=$(mktemp -d)
        curl -s https://api.github.com/repos/jonas/tig/releases/latest \
        | grep "browser_download_url.*.tar.gz" \
        | grep tig | grep -v .sha256 \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | wget -qi - -O - | tar xzf - -C "$TEMPDIR" --strip-components=1
        cd "$TEMPDIR"

        ./configure prefix=$INSTALL_DIR \
            CPPFLAGS="-I$INSTALL_DIR/include" \
            LDFLAGS="-L$INSTALL_DIR/lib"
        make
        make install
        echo "tig install at $(which tig)"
        \rm -rf "$TEMPDIR"
    fi
else
    echo "tig already install at $(which tig). Skipping.."
fi

if ! command -v exa &> /dev/null
then
    TEMPDIR=$(mktemp -d)
    curl -s https://api.github.com/repos/ogham/exa/releases/latest \
    | grep "browser_download_url.*exa-linux-x86_64-musl-v" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi - -O $TEMPDIR/exa.zip
    unzip "$TEMPDIR/exa.zip" -d $TEMPDIR
    mv "$TEMPDIR/bin/"* "$INSTALL_DIR/bin"
    mv "$TEMPDIR/man/"*.1 "$INSTALL_DIR/share/man/man1"
    mv "$TEMPDIR/man/"*.5 "$INSTALL_DIR/share/man/man5"
    mv "$TEMPDIR/completions/exa.zsh" "$INSTALL_DIR/share/zsh/site-functions/_exa"
    echo "exa install at $(which exa)"
    \rm -rf "$TEMPDIR"
else
    echo "exa already install at $(which exa). Skipping.."
fi


if ! command -v gh &> /dev/null
then
    TEMPDIR=$(mktemp -d)
    curl -s https://api.github.com/repos/cli/cli/releases/latest \
    | grep "browser_download_url.*_linux_amd64.tar.gz" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi - -O - | tar xvzf - -C $TEMPDIR --strip-components=1 
    rm "$TEMPDIR/LICENSE"
    rsync -av "$TEMPDIR/" "$INSTALL_DIR/"
    echo "gh install at $(which gh)"
    \rm -rf "$TEMPDIR"
else
    echo "gh already install at $(which gh). Skipping.."
fi
