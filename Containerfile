FROM fedora-minimal

RUN microdnf install -y python3 pip && \
    microdnf clean all

# otter deps
RUN microdnf install -y pandoc pandoc-pdf \
    texlive-xecjk texlive-upquote texlive-eurosym \
    texlive-ucs texlive-adjustbox texlive-titling \
    texlive-jknapltx && \
    microdnf clean all

RUN pip3 install otter-grader

RUN mkdir /workdir
WORKDIR /workdir
VOLUME /workdir

ENTRYPOINT [ "/usr/local/bin/otter" ]
