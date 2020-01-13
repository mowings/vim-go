#!/bin/bash
mkdir -p  ~/.vim
cd ~/.vim
# Set up pathogen
mkdir -p autoload && mkdir -p bundle
cd autoload && wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Pull down any plugins we want
cd ../bundle
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/jeetsukumaran/vim-buffergator.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/cespare/vim-toml.git toml

# Set up big theme package
cd ..
git clone https://github.com/flazz/vim-colorschemes.git
mv vim-colorschemes/colors .
