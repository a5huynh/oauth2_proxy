## google_auth_proxy

This is a Dockerization of the handy dandy [bitly Google OAuth Proxy](https://github.com/bitly/google_auth_proxy).

Check out the bitly github page for more details on the different command line options that can be passed in.

### Quick Start
    docker run a5huynh/google_auth_proxy \
        --cookie-secret=<cookie-secret> \
        --client-id=<client-id> \
        --client-secret=<client-secret>

### Defaults
By default I set the upstream and http-address to the following:

    --upstream=http://0.0.0.0:8080/
    --http-address=0.0.0.0:4180

This allows us to easily configure an nginx proxy to point to those addresses.
    
### Environment Variables
Alternatively you can set the cookie-secret, client-id, and/or client-secret as environment variables using the following variables below:

    google_auth_cookie_secret # The seed string for secure cookies
    google_auth_client_id     # The Google OAuth Cliendt ID
    google_auth_secret        # The Google OAuth Client Secret
   
#### Example Usage w/ environment variables
    docker run -e google_auth_cookie_secret=<cookie-secret> \
        -e google_auth_client_id=<client-id> \
        -e google_auth_secret=<client-secret> \
        a5huynh/google_auth_proxy
        