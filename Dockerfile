FROM centos:7

# 安装必要的软件
WORKDIR /
RUN yum install -y epel-release 
RUN yum install -y git wget libSM libXrender libXext python36 python36-pip java-1.8.0-openjdk-devel maven
RUN ln -s /usr/bin/python3.6 /usr/bin/python3 && ln -s /usr/bin/pip3.6 /usr/bin/pip3
RUN pip3 install opencv-python keras tensorflow requests

# 下载必要的源代码
RUN git clone https://github.com/zhaipro/easy12306.git
RUN git clone https://github.com/hellozjf/easy12306-java.git

# 编译java代码
WORKDIR /easy12306-java
RUN mvn clean install && mkdir /app && mv target/easy12306-java-1.0.0.jar /app

# 下载模型和执行脚本
WORKDIR /easy12306
RUN wget https://raw.githubusercontent.com/hellozjf/easy12306-docker/master/model.h5 && \
	wget https://raw.githubusercontent.com/hellozjf/easy12306-docker/master/12306.image.model.h5 && \
	wget https://raw.githubusercontent.com/hellozjf/easy12306-docker/master/easy12306.sh && \
	chmod 777 easy12306.sh

# 下载执行脚本
WORKDIR /app/shell
RUN wget https://raw.githubusercontent.com/hellozjf/easy12306-java/master/shell/predict.sh && chmod 777 predict.sh

# 暴露tomcat端口
EXPOSE 8080

# 启动程序
WORKDIR /app
ENTRYPOINT ["/usr/bin/java", "-jar", "easy12306-java-1.0.0.jar"]
