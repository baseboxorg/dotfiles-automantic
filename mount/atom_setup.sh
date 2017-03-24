#!/bin/sh

echo Install Oh-my-zsh and syntax highlight plugin
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo Remember to update .zshrc plugin list

echo Install Homebrew and other libs
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ccat coreutils heroku htop-osx jsawk osquery tree w3m wget yank
#brew install nginx mongodb mysql postgresql redis

echo Install Node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
#nvm install v4
nvm install v6
npm install -g \
  firebase-tools \
  forever \
  gulp \
  lyrics-cli \
  nodemon \
  nsp \
  mocha \
  pm2 \
#  sequelize-cli \
  strongloop \
#  vue-cli \
  webpack

echo Install Brew Cask
brew tap caskroom/cask

echo Install Software with Brew Cask
brew cask install --appdir="~/Applications" \
  dropbox \
#  expandrive \
  google-chrome \
  google-drive \
  screenhero \
  skype \
  spotify

echo Install Dev Software with Brew Cask
brew cask install --appdir="~/Applications" \
  atom \
  docker \
#  gas-mask \
#  gimp \
#  gitx \
  java \
  kitematic \
  shiftit \
  viscosity

echo Install atom packages and theme
apm install \
  atom-beautify \
  atom-material-ui \
  atom-typescript \
  editorconfig \
  emmet \
  file-icons \
#  language-ejs \
  language-javascript-jsx \
#  language-vue \
  linter \
  linter-csslint \
  linter-eslint \
  minimap \
  minimap-cursorline \
  pretty-json \
  todo-show

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
