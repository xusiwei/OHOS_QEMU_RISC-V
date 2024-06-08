#!/bin/bash

sudo apt install curl git git-lfs python3 python3-pip

if [ -e /usr/bin/python3 && ! -e /usr/bin/python ]; then
    sudo ln -s /usr/bin/python3 /usr/bin/python
fi

# 创建目录
mkdir ~/bin

# 下载repo脚本
curl https://gitee.com/oschina/repo/raw/fork_flow/repo-py3 > ~/bin/repo

# 下载repo依赖的软件包
pip3 install -i https://repo.huaweicloud.com/repository/pypi/simple requests

