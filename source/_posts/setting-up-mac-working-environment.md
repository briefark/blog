title: 【独立产品 - 研发】 Mac工作环境配置
tags:
  - OPP
  - DRY
categories:
  - 独立产品
  - 研发
date: 2015-06-03 16:51:19
---

对独立产品研发来说，Mac OS X无疑是最佳拍档，但在使用之前，我们还是需要一些基础的配置：

#安装基础编译环境
安装Xcode和Xcode command line tools
{% codeblock %}
xcode-select --install
{% endcodeblock %}
#Shell环境配置
{% codeblock ZSH配置 http://underscorejs.org/#compact Underscore.js %}
# 切换shell至zsh
chsh -s /bin/zsh
# 安装oh-my-zsh快速配置zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
{% endcodeblock %}
更多的配置可以请看 {% link 这里 https://github.com/robbyrussell/oh-my-zsh oh-my-zsh %}
#安装Java开发环境
到 {% link Oracle http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html#javasejdk JDK官网 %} 下载JDK。
可以同时安装JDK7和JDK8，并使用如下方式切换
{% codeblock Homebrew安装 %}
#在~/.zshrc 中添加
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home
export JAVA_HOME=$JAVA_7_HOME
alias jdk7='export JAVA_HOME=$JAVA_7_HOME'
alias jdk8='export JAVA_HOME=$JAVA_8_HOME'
{% endcodeblock %}
之后就可以使用指令jdk7和jdk8来切换java版本。
#使用Homebrew安装服务
##安装Homebrew
{% codeblock Homebrew安装 %}
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{% endcodeblock %}
脚本会解释它的作用，然后在我们的确认下执行安装。高级安装选项和使用方式请看 {% link 这里 http://brew.sh/index_zh-cn.html Homebrew官网 %}。
{% codeblock 使用前的准备 %}
brew doctor
brew tap homebrew/versions
brew tap homebrew/dupes
brew update
{% endcodeblock %}
##一些工具更新安装
{% codeblock %}
brew install curl git subversion
{% endcodeblock %}
##后端服务安装
{% codeblock %}
brew install nginx mysql redis mongodb sqlite
{% endcodeblock %}
##设置服务开机启动
以Nginx为例，其他类似
{% codeblock %}
mkdir -p ~/Library/LaunchAgents
cp /usr/local/opt/nginx/homebrew.mxcl.nginx.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
{% endcodeblock %}
##NodeJS运行环境安装
{% codeblock %}
brew install node
{% endcodeblock %}
##PHP运行环境安装
{% codeblock %}
brew tap josegonzalez/homebrew-php
brew install php56 --with-mysql
{% endcodeblock %}
##Ruby运行环境安装
使用rbenv来管理Ruby版本
{% codeblock %}
brew install rbenv 
#在~/.zshrc中添加如下内容
eval "$(rbenv init -)"
#重启Shell后可以执行如下指令
#查看可用版本
rbenv install --list
#安装版本2.2.2
rbenv install 2.2.2
#设置2.2.2为当前版本
rbenv global 2.2.2
{% endcodeblock %}
##Python运行环境安装
使用pyenv来管理Python版本
{% codeblock %}
brew install pyenv 
#在~/.zshrc中添加如下内容
eval "$(pyenv init -)"
#重启Shell后可以执行如下指令
#查看可用版本
pyenv install --list
#安装版本2.2.2
pyenv install 3.4.3
#设置2.2.2为当前版本
rbenv global 3.4.3
{% endcodeblock %}
