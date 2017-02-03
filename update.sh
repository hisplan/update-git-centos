#!/bin/bash

# Install git 2.11.0 on CentOS when yum doen't install the latest version for you.
# Run this as root

# Set the git version that you'd like to install
GIT_VERSION="2.11.0"

yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
yum install -y gcc perl-ExtUtils-MakeMaker

yum remove -y git

cd /usr/src

wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz
tar xzf git-${GIT_VERSION}.tar.gz

cd git-${GIT_VERSION}
make prefix=/usr/local/git all
make prefix=/usr/local/git install

echo 'export PATH=$PATH:/usr/local/git/bin' >> /etc/bashrc
echo 'export PATH=$PATH:/usr/local/git/bin' > /etc/profile.d/git.sh


source /etc/bashrc

git --version
