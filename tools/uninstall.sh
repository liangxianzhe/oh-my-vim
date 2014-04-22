echo "Removing ~/.oh-my-vim"
if [[ -d ~/.oh-my-vim ]]
then
  rm -rf ~/.oh-my-vim
fi

echo "Looking for original vim config..."
if [ -f ~/.vimrc.pre-oh-my-vim ]
then
  echo "Found ~/.vimrc.pre-oh-my-vim -- Restoring to ~/.vimrc";

  if [ -f ~/.vimrc ]
  then
    VIMRC_SAVE=".vimrc.omv-uninstalled-`date +%Y%m%d%H%M%S`";
    echo "Found ~/.vimrc -- Renaming to ~/${VIMRC_SAVE}";
    mv ~/.vimrc ~/${VIMRC_SAVE};
  fi

  mv ~/.vimrc.pre-oh-my-vim ~/.vimrc;
fi

echo "Thanks for trying out Oh My Vim. It's been uninstalled."

