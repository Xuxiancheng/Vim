# vim自带包管理

## 使用

在 ~/.vim/pack 下创建一个新的目录，就可以作为一个 package 了。因为目前 vim 社区绝大部分插件，都是按照 plugin 的形式来组织的，所以目前想要在 package 系统中使用的话，我们需要自己创建一个 package，在其中管理需要的所有第三方 plugin。

所以可以先创建一个 ~/.vim/pack/myplugins 的目录，作为存放所有 plugin 的 package。myplugins 改成其他的也没有问题。接下来再在其中分别创建 start 和 opt 两个目录。

接下来的事情就比较简单了，将之前所有的第三方插件，一股脑丢到 ~/.vim/pack/myplugins/start 就可以，重新启动 vim 之后，就可以自动加载了。如果不想启动加载的插件，就丢到 ~/.vim/pack/myplugins/opt 里，需要用到的时候，执行 :packadd pluginname 就可以了。

## 管理

现在我们可以很容易发现，其实配合使用 git 的 submodule 功能，就可以很方便的添加/升级第三方插件，不再需要额外的第三方插件管理器了。

现在可以把整个 .vim 目录做成一个 git 仓库，然后通过 $ git submodule init 初始化 submodule。

接下来想要添加一个第三方插件，比如 ale，只要执行：

``` shell

git submodule add https://github.com/w0rp/ale.git pack/myplugins/start/ale

```

升级所有第三方插件，只要执行：

``` shell

git submodule update --recursive --remote

```

## 使用

clone此仓库,然后运行以下命令即可将第三方插件同步:

``` shell

git submodule init

git submodule update

进入到YCM安装目录:

git submodule update —init -recursive

python3 install.py --all

cp vimrc ~/.vimrc

