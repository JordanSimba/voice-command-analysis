#!/bin/bash
# Only works with linux
# check python

DEEPSPEECH_MODULE='deepspeech'
which python
! [[ $? -eq 0 ]] && { echo "Could not find python in path"; exit 1; }

pip_exe=$(which pip)
! [[ $? -eq 0 ]] && { echo "Could not find pip in path"; exit 1; }

`$pip_exe install $DEEPSPEECH_MODULE`

# Download pre-trained English model files
[[ -e 'deepspeech-0.9.3-models.pbmm' ]] || \ 
curl -LO https://github.com/mozilla/DeepSpeech/releases/download/v0.9.3/deepspeech-0.9.3-models.pbmm

[[ -e 'deepspeech-0.9.3-models.scorer' ]] || \ 
curl -LO https://github.com/mozilla/DeepSpeech/releases/download/v0.9.3/deepspeech-0.9.3-models.scorer

# Download example audio files
[[ -e 'audio-0.9.3.tar.gz' ]] || \ 
{ curl -LO https://github.com/mozilla/DeepSpeech/releases/download/v0.9.3/audio-0.9.3.tar.gz; \ 
tar xvf audio-0.9.3.tar.gz; }

