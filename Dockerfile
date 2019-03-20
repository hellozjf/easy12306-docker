FROM centos:7

WORKDIR /
RUN yum install -y epel-release 
RUN yum install -y git wget libSM libXrender libXext python36 python36-pip
RUN ln -s /usr/bin/python3.6 /usr/bin/python3 && ln -s /usr/bin/pip3.6 /usr/bin/pip3
RUN pip3 install opencv-python keras tensorflow requests

RUN git clone https://github.com/zhaipro/easy12306.git
WORKDIR /easy12306
RUN wget https://aliyun.hellozjf.com:7004/uploads/2019/3/19/model.h5 && \
	wget https://aliyun.hellozjf.com:7004/uploads/2019/3/19/12306.image.model.h5 && \
	wget https://aliyun.hellozjf.com:7004/uploads/2019/3/20/easy12306.sh && \
	chmod 777 easy12306.sh

ENV PYTHONIOENCODING utf-8
ENTRYPOINT ["/easy12306/easy12306.sh"]
