FROM ubuntu

# Workaround https://unix.stackexchange.com/questions/2544/how-to-work-around-release-file-expired-problem-on-a-local-mirror
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" > /etc/apt/apt.conf.d/10no--check-valid-until

RUN apt-get -q update; DEBIAN_FRONTEND="noninteractive" apt-get -y install apt-utils tzdata openssh-client openssh-server git sudo
ADD ninit util.sh /root/
RUN chmod +x /root/ninit; mkdir -p /root/relay/.ssh /root/tophub/.ssh
ADD relay /root/relay/
ADD tophub /root/tophub/
CMD ["bash","-c","/root/ninit"]
