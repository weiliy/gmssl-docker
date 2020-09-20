# GmSSL docker

以docker形式发布最新的GmSSL工具，无需编译既快速使用gmssl 命令行工具 

## 使用方式

拉取镜像

```
docker push weiliy/gmssl
```

添加下列命令别名到`~/.bashrc`或`~/.zshrc`

```
alias gmssl='docker run --rm -it -u $(id -u) -v "$PWD:/mnt" -v "/etc/passwd:/etc/passwd:ro" -w /mnt weiliy/gmssl gmssl'
```

重新打开terminal之后，便可以使用gmssl命令
```
$ gmssl version
GmSSL 2.5.4 - OpenSSL 1.1.0d  19 Jun 2019
```
