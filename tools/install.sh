set -e

if [ ! -n "$OH_MY_VIM" ]; then
  OH_MY_VIM=~/.oh-my-vim
fi

if [ -d "$OH_MY_VIM" ]; then
  echo "\033[0;33mYou already have Oh My Vim installed.\033[0m You'll need to remove $OH_MY_VIM if you want to install"
  exit
fi

echo "\033[0;34mCloning Oh My Vim...\033[0m"
hash git >/dev/null 2>&1 && /usr/bin/env git clone https://github.com/liangxianzhe/oh-my-vim.git $OH_MY_VIM || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.pre-oh-my-vim\033[0m";
  mv ~/.vimrc ~/.vimrc.pre-oh-my-vim;
fi

echo "\033[0;34mUsing the Oh My Vim template file and adding it to ~/.vimrc\033[0m"
cp $OH_MY_VIM/templates/vimrc-template ~/.vimrc
sed -i -e "/^OH_MY_VIM=/ c\\
OH_MY_VIM=$OH_MY_VIM
" ~/.vimrc

if [ ! -d "bundle" ]; then
    echo "\033[0;34mCreating a bundle directory...\033[0m"
    mkdir $OH_MY_VIM/bundle
fi

# Copy the font if using mac
if [[ `uname` == 'Darwin' ]]; then
    echo "\033[0;34mInstalling font...\033[0m"
    cp $OH_MY_VIM"/dotvim/font/DroidSansMono/Droid Sans Mono for Powerline.otf" ~/Library/fonts/
fi

echo "\033[0;32m"'  ____  __     __  _____  __  _   ________  ___  '"\033[0m"
echo "\033[0;32m"' / __ \/ /    /  |/  /\ \/ / | | / /  _/  |/  /  '"\033[0m"
echo "\033[0;32m"'/ /_/ / _ \  / /|_/ /  \  /  | |/ // // /|_/ /   '"\033[0m"
echo "\033[0;32m"'\____/_//_/ /_/  /_/   /_/   |___/___/_/  /_/    '"\033[0m"
                                                  
echo "\n\n \033[0;32mPlease look over the ~/.vimrc file to select plugins, themes, and options.\033[0m"
echo "\n\n \033[0;32mThen open you vim and it will install plugins for you.\033[0m"
echo "\n\n \033[0;32mEnjoy!.\033[0m"
