FROM ubuntu:latest

WORKDIR /root

# install the necessary dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y git libelf-dev bison flex build-essential ncurses-dev xz-utils libssl-dev bc kernel-package linux-virtual

# copy the kernel over
RUN git clone --depth 1 https://github.com/heikomat/linux.git --branch cx2072x --single-branch
WORKDIR /root/linux

# configure the kernel
RUN cp -v /boot/config-* .config
RUN echo "CONFIG_SND_SOC_INTEL_CHT_CX2072X_MACH=m" >> .config
RUN echo "CONFIG_SND_SOC_CX2072X=m" >> .config

# build the kernel
RUN make deb-pkg -j 12

RUN mkdir /root/build
RUN cp /root/*.deb /root/build/
