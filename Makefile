.PHONY : all \
	install \
	install-vim \
	install-vim-config \
	install-vim-init \
	install-vim-plug \
	install-vim-plugins

all : 
	@echo "run \`make install\`."

install-alternate : install-vim-alternate

install-vim-alternate : install-tmux-config-alternate \
	install-vim-config-alternate \
	install-vim-init-alternate \
	install-vim-plug-alternate \
	install-vim-plugins-alternate

install-tmux-config-alternate : 
	install -m 0644 -- tmux/tmux.conf /nobackup/.tmux.conf

install-vim-config-alternate : 
	install -m 0644 -- vim/vimrc-alternate /nobackup/.vimrc

install-vim-init-alternate :
	install -m 0755 -d -- \
		/nobackup/.vim/autoload \
		/nobackup/.vim/swap \
		/nobackup/.vim/undodir \
		/nobackup/.vim/plugged

install-vim-plug-alternate :
	. vim/install-vim-plug-alternate

install-vim-plugins-alternate :
	. vim/install-plugins

install : install-vim

install-vim : install-tmux-config \
	install-vim-config \
	install-vim-init \
	install-vim-plug \
	install-vim-plugins

install-tmux-config : 
	install -m 0644 -- tmux/tmux.conf "$(HOME)"/.tmux.conf

install-vim-config : 
	install -m 0644 -- vim/vimrc "$(HOME)"/.vimrc

install-vim-init :
	install -m 0755 -d -- \
		"$(HOME)"/.vim/autoload \
		"$(HOME)"/.vim/swap \
		"$(HOME)"/.vim/undodir \
		"$(HOME)"/.vim/plugged

install-vim-plug :
	. vim/install-vim-plug

install-vim-plugins :
	. vim/install-plugins
