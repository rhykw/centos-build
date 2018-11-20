FROM centos:7
ENV TZ=Asia/Tokyo

RUN yum update -y && \
    yum install -y \
    iproute \
    make \
    less \
    patch \
    rpm-build \
    sudo \
    vim-common \
    which \
    && \
    usermod -s /bin/bash root && \
    groupadd -g 1000 mockbuild && \
    useradd -u 1000 -g mockbuild mockbuild && \
    usermod -s /bin/bash mockbuild && \
    echo 'mockbuild:$6$j0.6yx4Z$aSXtYtnZQN/h9UEhFxGzErmvdHDEWKcBWl41dtBNXqb0wr2.3kYRjfAp5jI76c6ooIDj524.bY5/EiMWLurWN.' | chpasswd -e && \
    echo 'mockbuild ALL=(ALL) NOPASSWD: ALL' | install --mode 0440 /dev/stdin /etc/sudoers.d/mockbuild
