export EDITOR="/usr/bin/vim"
export HISTCONTROL="ignoreboth"
export HISTFILESIZE="50000"
set -o vi


export LANG="en_US.utf8"
export LC_CTYPE="en_US.utf8"
export LC_NUMERIC="en_US.utf8"
export LC_TIME="en_US.utf8"
export LC_COLLATE="en_US.utf8"
export LC_MONETARY="en_US.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_PAPER="en_US.utf8"
export LC_NAME="en_US.utf8"
export LC_ADDRESS="en_US.utf8"
export LC_TELEPHONE="en_US.utf8"
export LC_MEASUREMENT="en_US.utf8"
export LC_IDENTIFICATION="en_US.utf8"
export LC_ALL="en_US.utf8"

if [ "${TERM}" == "rxvt-unicode" ]; then
  #echo "Set LC_CTYPE to ${LC_CTYPE}"
  printf "\33]701;$LC_CTYPE\007"
fi

hg_ps1() {
    hg prompt "({branch}) " 2> /dev/null
}

PS1="\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;32m\]\$(hg_ps1)\[\033[01;35m\]\$ \[\033[00m\]"

export GTEST_COLOR=yes
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export PATH=$PATH:/opt/vtss-cross-ecos-mips32-24kec-v2/bin
