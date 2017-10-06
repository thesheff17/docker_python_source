FROM thesheff17/docker_python_pip

MAINTAINER Dan Sheffner <Dan@Sheffner.com>

# compile python3 from source
WORKDIR /root/
RUN wget --quiet https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
RUN tar -xf Python-3.6.3.tar.xz
WORKDIR /root/Python-3.6.3/
RUN ./configure --enable-loadable-sqlite-extensions
# RUN ./configure --enable-optimizations --enable-loadable-sqlite-extensions
RUN make -j2
RUN make install

CMD ["/bin/bash"]
