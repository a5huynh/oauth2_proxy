[![Build Status](https://travis-ci.org/a5huynh/oauth2_proxy.svg?branch=master)](https://travis-ci.org/a5huynh/oauth2_proxy) [![license: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Official fork for `bitly/oauth2_proxy`
FYI for those coming here, as of 03/2019 the bitly project is no longer getting updated and has been 
officially forked to a new project: https://github.com/pusher/oauth2_proxy

This new project has been getting updates and has it's own Docker image. If you're interested in
using the latest and greatest, please check them out! Otherwise this repo + Docker image will stay
as is 🙂.

## oauth2_proxy dockerization

This is a Dockerization of the handy dandy
[bitly OAuth Proxy](https://github.com/bitly/oauth2_proxy).

Check out the bitly github page for more details on the different command line
options that can be passed in.

This is also an automated
[Docker Hub build](https://hub.docker.com/r/a5huynh/oauth2_proxy/)

### Supported tags and respective `Dockerfile` links
* `2.2-debian` ([Dockerfile](https://github.com/a5huynh/oauth2_proxy/blob/cb657302b1a433e654a6cd97e30aa0c0dee8075c/Dockerfile))
* `2.2` ([Dockerfile](https://github.com/a5huynh/oauth2_proxy/blob/5c18f223851745d3132faf64cab6ea9bb056fe7f/Dockerfile))
* `2.1` ([Dockerfile](https://github.com/a5huynh/oauth2_proxy/blob/77b5f5afb919bb9d7983f901504987c9aaf2dfb9/Dockerfile))

### Quickstart with Docker Compose
First, configure your client secret/id/cookie secret in the `docker-compose.yml` file
and replace all references to `example.com` with your domain.

Then simply run:

    docker-compose up

The container will be built and an nginx proxy automatically configure to
connect to the oauth2 proxy. Navigate to http://localhost:4180/ping to check
out whether the proxy is up and running.

You will be asked to authenticated and if successful, redirected to the upstream
nginx container serving a simple HTML page.

### Quickstart without Docker Compose

The following example assumes you have your upstream host located at `upstream:80`

    docker run -P a5huynh/oauth2_proxy \
        --cookie-secure=false \
        --upstream="http://upstream:80" \
        --http-address="0.0.0.0:4180" \
        --redirect-url="http://example.com/oauth2/callback" \
        --email-domain="example.com" \
        --cookie-secret=<cookie-secret> \
        --client-id=<client-id> \
        --client-secret=<client-secret>

## Configuration
By default I set the upstream and http-address to the following:

    --upstream=http://0.0.0.0:8080/
    --http-address=0.0.0.0:4180

This allows us to easily configure our upstream or nginx proxy to those addresses.

### Environment Variables
Alternatively you can set the cookie-secret, client-id, and/or client-secret as
environment variables using the following variables below:

    OAUTH2_PROXY_COOKIE_SECRET     # The seed string for secure cookies
    OAUTH2_PROXY_CLIENT_ID         # The Google OAuth Client ID
    OAUTH2_PROXY_CLIENT_SECRET     # The Google OAuth Client Secret

### Example Usage w/ environment variables
    docker run -e OAUTH2_PROXY_COOKIE_SECRET=<cookie-secret> \
        -e OAUTH2_PROXY_CLIENT_ID=<client-id> \
        -e OAUTH2_PROXY_CLIENT_SECRET=<client-secret> \
        a5huynh/oauth2_proxy
