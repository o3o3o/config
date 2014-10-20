#!/bin/bash
echo "$1" | festival --tts  > /dev/null &2>1
sleep 2 
echo "$1" | festival --tts  > /dev/null &2>1
