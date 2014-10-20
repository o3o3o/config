#!/bin/bash
set -o nounset
set -o errexit
dig +short txt ${1}.wp.dg.cx


