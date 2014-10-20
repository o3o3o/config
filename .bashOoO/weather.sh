#!/bin/bash
 cd /tmp
 if [ ! -f '101070101.html' ];
     then
         wget http://m.weather.com.cn/data/101070101.html
     fi
 cat 101070101.html | awk -F',' '{ for(x=1; x<=83; x++) print $x }' | egrep 'temp1|weather1|img_title_single|wind1|fx1|\"index\"|index_d|index_cl'
 #http://www.weather.com.cn/data/sk/101070101.html
