#!/bin/bash
var1="/pic/"
var2=$1
# echo $var1
# echo $var2
var3=${var1}${var2}
/usr/bin/python3 /easy12306/main.py $var3