FROM centos:latest
RUN yum update -y;yum groupinstall -y "Development Tools";  yum install wget -y;yum install gcc openssl-devel bzip2-devel -y;
RUN wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz && tar -xzf Python-3.6.6.tgz && cd Python-3.6.6 && ./configure --enable-optimizations && make altinstall
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3 && echo 'export PATH="$HOME/miniconda3/bin:$PATH"' > /etc/environment && source /etc/environment && conda config --add channels omnia --add channels conda-forge && conda install yank -y
EXPOSE 80

