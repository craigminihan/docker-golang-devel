FROM jordi/golang-run:1.10.2-beta
LABEL maintainer="Jordi Íñigo"

# Download LiteIDE prerequisites
RUN apt-get -u update && apt-get -y install \
    gdb \
    libqt4-dev \
    make \
    xterm && \
    rm -rf /var/lib/apt/lists/*

# LiteIDE
RUN wget https://github.com/visualfc/liteide/releases/download/x33.3/liteidex33.3.linux64-qt4.8.7.tar.gz -q -O - | tar xfz - -C /usr/local
COPY linux64.env /usr/local/liteide/share/liteide/liteenv/linux64.env
COPY liteide.ini /.config/liteide/liteide.ini

# shell launch
ENV QT_X11_NO_MITSHM 1
# CMD ["/usr/local/liteide/bin/liteide"]

COPY start.sh /start
COPY dliteide /
RUN chmod 700 /start
ENTRYPOINT ["/start"]
