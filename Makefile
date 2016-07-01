.PHONY : all \
	install \
	install-vim \
	install-vim-config \
	install-vim-init \
	install-vim-plug \
	install-vim-plugins

all : 
	@echo "run \`make install\`."

install : install-vim

install-vim : install-vim-config \
	install-vim-init \
	install-vim-plug \
	install-vim-plugins

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
