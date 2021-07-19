FROM ubuntu:20.04

RUN apt update
RUN apt install -y strace

COPY contents/clinfo /usr/bin
COPY contents/amdgpu-pro /opt/amdgpu-pro
COPY contents/10-amdgpu-pro.conf /etc/ld.so.conf.d
COPY contents/OpenCL /etc/OpenCL
COPY contents/lib /lib
COPY contents/gminer gminer

RUN ldconfig

WORKDIR gminer
CMD ["bash", "mine.sh"]
