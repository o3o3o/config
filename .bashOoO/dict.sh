#!/bin/bash
echo "$1" | festival --tts >/dev/null 2>&1 & sdcv -n $1
