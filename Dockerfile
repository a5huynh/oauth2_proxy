FROM golang:latest
MAINTAINER Andrew Huynh <a5thuynh@gmail.com>

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2016-06-28
ENV OAUTH2_PROXY_VERSION 2.1

# Checkout bitly's latest google-auth-proxy code from Github
ADD https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz /tmp
RUN tar -xf /tmp/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz -C /bin && rm /tmp/*.tar.gz

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
