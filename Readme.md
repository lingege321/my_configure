# my configure

## .imwheelrc
* [Description](https://ubuntu1804.blogspot.com/2018/12/linux.html)
* a file to control the speed of wheel in Linux

# software

* docker
   * [docker on wsl2](https://www.pigo.idv.tw/archives/3359)

* zsh
    * [zim](https://github.com/zimfw/zimfw)
	* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    * [powerlevel10k](https://holychung.medium.com/%E5%88%86%E4%BA%AB-oh-my-zsh-powerlevel10k-%E5%BF%AB%E9%80%9F%E6%89%93%E9%80%A0%E5%A5%BD%E7%9C%8B%E5%A5%BD%E7%94%A8%E7%9A%84-command-line-%E7%92%B0%E5%A2%83-f66846117921)
    * [zsh-completions](https://github.com/zsh-users/zsh-completions)
    * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    * [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)

* the-silver-search
	* [ag](https://github.com/ggreer/the_silver_searcher)

* vim-plug
	* [vim-plug](https://github.com/junegunn/vim-plug)

* rust
   * [rust-install](https://www.cloudbooklet.com/install-rust-on-ubuntu-18-04-lts/)
   * how to update version: rustup update nightly/stable
   * just use `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh` to install the rust
* rust-analyzer
   * first install the rust std library: `rustup component add rust-src`
   * `git clone https://github.com/rust-analyzer/rust-analyzer` to download the rust-analyzer
   * `cd rust-analyzer`
   * `cargo xtask install --server` to build a binary to $HOME/.cargo/bin

* ripgrep
   * [ripgrep github](https://github.com/BurntSushi/ripgrep)
   * rg
   * use `cargo install ripgrep`
* lsd
   * [lsd](https://github.com/Peltoche/lsd)
   * lsd
   * use `cargo install lsd`
* zellij
   * [zellij](https://github.com/zellij-org/zellij)
   * Zellij is a workspace aimed at developers, ops-oriented people and anyone who loves the terminal. At its core, it is a terminal multiplexer (similar to tmux and screen), but this is merely its infrastructure layer.
   * use `cargo install zellij`

* dust & dua
   * [dust](https://github.com/bootandy/dust)
   * [dua](https://github.com/bootandy/dust)
   * dust
       * use cargo install du-dust
   * cargo install dua-cli
       dua
* delta
   * [Github](https://github.com/dandavison/delta) 

* skim
   * [Github](https://github.com/lotabout/skim)

* ytop
   * [ytop](https://github.com/cjbassi/ytop)
   * use `cargo install ytop`

* rabbitmq
   * [How to install](https://blog.csdn.net/hongge_smile/article/details/104049292)

* boost
   * [How to install](https://www.itread01.com/content/1550417226.html)

* install gcc 10
   * [how to install](https://www.ultralinux.org/post/how-to-install-gcc-compiler-on-ubuntu-18-04/)
* install gdb
   * [gdb release ftp](https://ftp.gnu.org/gnu/gdb/)
   * wget https://ftp.gnu.org/gnu/gdb/gdb-12.1.tar.gz and tar zxvf & mkdir build & cd build
   * ../configure --with-python=<python2 binary path> --prefix=<local build path>
   * make -j
   * make install

* install fish shell
   * [GitHub](https://github.com/fish-shell/fish-shell)
   * [Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
   * Theme:
      * [GitHub](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md)
      * Bira
      * emoji-powerline

* Vim 8
   * How to install with python interface:
   * [URL](https://www.itread01.com/hklxhkpq.html)

