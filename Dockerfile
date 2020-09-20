FROM gcc:9.3 AS builder

COPY ./GmSSL /gmssl
WORKDIR /gmssl/
RUN ./config --prefix=/usr/local/gmssl --openssldir=/usr/local/gmssl no-shared
RUN make
RUN make install

FROM debian:buster-slim
# ENV LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
COPY --from=builder /usr/local/gmssl /usr/local/gmssl
ENV PATH /usr/local/gmssl/bin:$PATH
ENV RANDFILE /tmp/.random

CMD ["gmssl", "version"]
