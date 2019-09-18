FROM thesheff17/amazon-linux-base:latest

# time docker build . -f Dockerfile -t dsheffner/python3:latest

# install python
RUN wget -q https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -xf Python-3.7.4.tgz
RUN   cd Python-3.7.4/ && \
    ./configure --prefix=/opt/python37 --enable-shared --enable-optimizations && \
     make -j4 && \
     make altinstall

RUN \
    echo "export LD_LIBRARY_PATH=/opt/python37/lib" >> /root/.bashrc && \
    echo "export PATH=/opt/python37/bin:$PATH" >> /root/.bashrc && \
    echo "if [ ! -f /usr/local/bin/python3 ]; then" >>  /root/.bashrc && \
    echo "ln -s /opt/python37/bin/python3.7 /usr/local/bin/python3" >>  /root/.bashrc && \
    echo "fi" >> /root/.bashrc && \
    echo "if [ ! -f /usr/local/bin/pip3 ]; then" >>  /root/.bashrc && \
    echo "ln -s /opt/python37/bin/pip3.7 /usr/local/bin/pip3" >>  /root/.bashrc && \
    echo "fi" >> /root/.bashrc

# pip3 install
RUN export LD_LIBRARY_PATH=/opt/python37/lib && /opt/python37/bin/pip3.7 install awscli

CMD ["/bin/bash]

