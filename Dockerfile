FROM golang:latest
MAINTAINER Andrew Huynh <andrew@productbio.com>

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2015-08-25

# Checkout bitly's latest google-auth-proxy code from Github
RUN go get github.com/bitly/oauth2_proxy

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
