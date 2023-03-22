FROM quay.io/centos/centos:stream9
RUN yum install -y java
RUN yum install -y telnet
RUN yum install -y hostname
RUN yum install -y passwd

RUN { echo "password"; echo "password"; } | passwd root
RUN useradd admin
RUN { echo "password"; echo "password"; } | passwd admin
RUN mkdir /home/admin/App
COPY kafka_2.13-3.2.0.tgz /home/admin/Install/
COPY kafka-start.sh /home/admin/App/kafka-start.sh
RUN chown -R admin:admin /home/admin
USER admin
RUN chmod 777 /home/admin/App/kafka-start.sh
RUN cd /home/admin/Install \
&& tar -xvf kafka_2.13-3.2.0.tgz  \
&& rm /home/admin/Install/kafka_2.13-3.2.0.tgz \
&& mv /home/admin/Install/* /home/admin/App/Kafka
RUN cat > 
CMD /home/admin/App/kafka-start.sh