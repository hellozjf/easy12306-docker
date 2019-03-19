FROM centos:7

WORKDIR /
RUN yum install -y epel-release
RUN yum install -y git
RUN yum install -y wget
RUN yum install -y libSM
RUN yum install -y libXrender
RUN yum install -y libXext
RUN yum install -y python36
RUN ln -s /usr/bin/python3.6 /usr/bin/python3
RUN yum install -y python36-pip
RUN ln -s /usr/bin/pip3.6 /usr/bin/pip3
RUN pip3 install opencv-python
RUN pip3 install keras
RUN pip3 install tensorflow
RUN pip3 install requests

RUN git clone https://github.com/zhaipro/easy12306.git
WORKDIR /easy12306
RUN wget https://aliyun.hellozjf.com:7004/uploads/2019/3/19/model.h5
RUN wget https://aliyun.hellozjf.com:7004/uploads/2019/3/19/12306.image.model.h5
ENV PYTHONIOENCODING utf-8
