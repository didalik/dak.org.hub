envgetkv () { # trimming the expected quotes around the value {{{1
  local key=$1 env=$2
  if [ -z "$env" ]; then
    env=$LOCAL_ENV
  fi  

  touch $env # make sure the file is there
  local value=$(cat $env | grep $key | head -n 1)
  value=${value#*=?} # assuming the value
  echo "${value%?}"  # is quoted!
}

envputkv () { # NO lines with duplicate keys {{{1
  local key=$1 value=$2 env=$3
  if [ -z "$env" ]; then
    env=$LOCAL_ENV
  fi  
  #out '- envputkv key' $key 'value' $value 'env' $env
  [ -s $env ] && cat $env | grep --invert-match $key > $env.tmp
  echo "export $key=$value" >> $env.tmp
  mv $env.tmp $env
}

envsetup () { # {{{1
  while [[ $# > 0 ]]; do
    echo "export $1=$2"; shift 2
  done
}

err () { # {{{1
  printc 'red dim' $@
}

install_node () { # {{{1
  cp $HOME/.bashrc $HOME/.bashrc-saved
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  mv $HOME/.bashrc-saved $HOME/.bashrc
}

out () { # {{{1
  printc 'blue dim' $@
}

printc () { # {{{1
  local color=$(git config --get-color color.diff.whitespace "$1")
  local reset=$(git config --get-color "" "reset")
  shift
  command printf %s\\n "${color}$*${reset}"
}
