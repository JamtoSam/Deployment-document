#!/bin/bash
#指定文件或搜索文件进行修改内容
#如：singsig123 修改为Sinosig123
find /etc/  -type f -name "password"|xargs sed -i 's#singsig123#Sinosig123@#g'

