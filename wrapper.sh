#!/bin/bash
#
# Author: Sebastian Vincent
# Date: 3 Feb 2023
# MIT License (see repository details)
#
# Wrapper for cxt2vec code 

set -e
filepath=$1
suffixes=$2
model=$3
# TMPDIR=    <-- set to tmp if not set; assumes that TMPDIR clears itself out after job exit

if [ -z $model ]; then
	model=minilm
fi
scratch=$TMPDIR/$filepath
mkdir -p $scratch

cp -r ${filepath}/context $scratch

python cxt2vec/main.py --paths $scratch --dest_path $scratch/embeddings --model $model --suffixes $suffixes

mv $scratch/embeddings $filepath
