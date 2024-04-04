#!/bin/zsh -e

for file in $HOME/.vim/pack/gbernady/{opt,start}/*; do
	echo "Updating $file"
	pushd $file
	git pull --ff-only
	popd
done

