FROM centos:7


RUN yum update -y && \
    yum install -y wget

ENV NESSUS_VERSION 6.11.1

RUN wget -O /tmp/Nessus-${NESSUS_VERSION}-es7.x86_64.rpm \
    --user-agent='Mozillqa/5.0 (Windows NT 10.0; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0' \
    --header='Upgrade-Insecure-Requests: 1' \
    "http://downloads.nessus.org/nessus3dl.php?file=Nessus-${NESSUS_VERSION}-es7.x86_64.rpm&licence_accept=yes&t=a601dbd72df42f14e2e8d8f6ef5c5700"

RUN rpm -ivh /tmp/Nessus-${NESSUS_VERSION}-es7.x86_64.rpm

EXPOSE 8834

ENTRYPOINT [ "systemctl start nessusd.service" ]
