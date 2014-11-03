## google_auth_proxy

This is a Dockerization of the handy dandy [bitly Google OAuth Proxy](https://github.com/bitly/google_auth_proxy).

Check out the bitly github page for more details on the different command line
options that can be passed in.

This is also an automated [Docker Hub build](https://registry.hub.docker.com/u/a5huynh/google-auth-proxy/)

### Quickstart with [Fig](fig.sh)
First, configure your client secret/id/cookie secret in the `fig.yml` file.
Then simply run:

    fig up
   
The container will be built and an nginx proxy automatically configure to
connect to the google auth proxy. Navigate to http://<docker ip>/ping to check
out whether the proxy is up and running.

### Quickstart without Fig
    docker run -P a5huynh/google-auth-proxy \
        --cookie-secret=<cookie-secret> \
        --client-id=<client-id> \
        --client-secret=<client-secret>

## Configuration
By default I set the upstream and http-address to the following:

    --upstream=http://0.0.0.0:8080/
    --http-address=0.0.0.0:4180

This allows us to easily configure an nginx proxy to point to those addresses.
    
### Environment Variables
Alternatively you can set the cookie-secret, client-id, and/or client-secret as
environment variables using the following variables below:

    google_auth_cookie_secret # The seed string for secure cookies
    google_auth_client_id     # The Google OAuth Cliendt ID
    google_auth_secret        # The Google OAuth Client Secret
   
### Example Usage w/ environment variables
    docker run -e google_auth_cookie_secret=<cookie-secret> \
        -e google_auth_client_id=<client-id> \
        -e google_auth_secret=<client-secret> \
        a5huynh/google-auth-proxy
