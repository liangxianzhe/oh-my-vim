printf '\033[0;34m%s\033[0m\n' "Upgrading Oh My Vim"
cd "$OH_MY_VIM"
if git pull --rebase --stat origin master
then
  printf '\033[0;32m%s\033[0m\n' '  ____  __     __  _____  __  _   ________  ___ '
  printf '\033[0;32m%s\033[0m\n' ' / __ \/ /    /  |/  /\ \/ / | | / /  _/  |/  /  '
  printf '\033[0;32m%s\033[0m\n' '/ /_/ / _ \  / /|_/ /  \  /  | |/ // // /|_/ /   '
  printf '\033[0;32m%s\033[0m\n' '\____/_//_/ /_/  /_/   /_/   |___/___/_/  /_/    '
  printf '\033[0;32m%s\033[0m\n' ''
  printf '\033[0;34m%s\033[0m\n' 'Hooray! Oh My Vim has been updated and/or is at the current version.'
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi
