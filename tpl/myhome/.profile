# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Restart ntp
#sudo systemctl restart ntp
# ntpq -p
#
# TODO:
# tail -f /var/log/auth.log|while read;do A=${REPLY#*rhost=};[ "$A" = "$REPLY" ] && continue;echo "sshd: ${A% *}"|sudo tee -a /etc/hosts.deny;done &
#
# check () { set +m;shopt -s lastpipe;FOUND=false;H='';ps -ef|grep "$1"|{ while read A B C D E F G H T;do [ "$H" = 'tail' ] && FOUND=true;done; };set -m;echo $FOUND;if $FOUND;then return;fi;echo 'not found'; };check 'tail -f /var/log/auth.log'
# See also:
# - https://askubuntu.com/questions/1484096/bash-variable-assignment-in-a-pipeline
#
#vcgencmd measure_temp
###

. ~/.profile-functions

color_my_prompt

export DAK_HOME=$HOME/people/didalik/dak
