FROM debian:stable-slim
MAINTAINER Andrew Huynh <a5thuynh@gmail.com>

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2017-10-24
ENV OAUTH2_PROXY_VERSION 2.2

# Checkout bitly's latest google-auth-proxy code from Github
ADD https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz /tmp
RUN tar -xf /tmp/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz -C ./bin --strip-components=1 && rm /tmp/*.tar.gz

# Install CA certificates
RUN apt-get update -y && apt-get install -y ca-certificates

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
