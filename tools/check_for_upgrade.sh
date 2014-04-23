#!/bin/sh

function _current_epoch() {
  echo $(($(date +%s) / 60 / 60 / 24))
}

function _update_vim_update() {
  echo "LAST_EPOCH=$(_current_epoch)" > ~/.vim-update
}

function _upgrade_vim() {
  /usr/bin/env OH_MY_VIM=$OH_MY_VIM /bin/sh $OH_MY_VIM/tools/upgrade.sh
  # update the vim file
  _update_vim_update
}

epoch_target=$UPDATE_VIM_DAYS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=13
fi

if [ -f ~/.vim-update ]
then
  . ~/.vim-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_vim_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    echo "[Oh My Vim] Would you like to check for updates?"
    echo "Type Y to update oh-my-vim: \c"
    read line
    if [ "$line" = Y ] || [ "$line" = y ]; then
      _upgrade_vim
      echo "Press any key to continue."
      read line
    else
      _update_vim_update
    fi
  fi
else
  # create the vim file
  _update_vim_update
fi

