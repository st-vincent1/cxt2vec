#!/bin/bash

set -e
filepath=$1
lang=$2
model=$3

if [ -z $model ]; then
	model=minilm
fi
scratch=$TMPDIR/$filepath
mkdir -p $scratch

cp -r ${filepath}/context $scratch

python main.py --paths $scratch --dest_path $scratch --model $model --lang $lang

mv $scratch/*.{json,bin,idx} $filepath
