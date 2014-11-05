FROM golang:1.3.3
MAINTAINER Andrew Huynh <andrew@productbio.com>

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2014-11-03

# Checkout bitly's latest google-auth-proxy code from Github
RUN go get github.com/bitly/google_auth_proxy

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/google_auth_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
