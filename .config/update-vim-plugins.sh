#!/bin/zsh -e

for file in ../.vim/pack/gbernady/{opt,start}/*; do
	echo "Updating $file"
	pushd $file
	git pull --ff-only
	popd
done

