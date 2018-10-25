# About this Repo

This is a fork of [criluc/docker-nginx-http-shibboleth](https://github.com/criluc/docker-nginx-http-shibboleth).

It contains
 * The [nginx-full version 1.14.0](https://packages.debian.org/stretch-backports/nginx)
   * We modified the docker installation scripts to install the latest version of nginx. The latest version of nginx available in debian stretch (the current stable version of debian) with
  backports is 1.14.0 and this is what we have used.
 * [nginx-http-shibboleth](https://github.com/nginx-shib/nginx-http-shibboleth) which allows Nginx to work with Shibboleth, by way of Shibboleth's FastCGI authorizer.
 * [Certbot-nginx](https://certbot.eff.org/lets-encrypt/debianstretch-nginx) for SSL support, deploying Let's encrypt certificates (with cron to renew certs)

# Current Version

Current nginx version is *1.14.0 stable*.
Current ngnix-http-shibboleth module is based on commit *d954cab13859f186862a38c32b7748760b947aa8.*
The latest certbot packages from Stretch backports

# Docker Image

The docker images is available through the docker hub at
https://registry.hub.docker.com/u/anusha3/nginx-shibboleth-certbot/.

For example:

```
docker pull anusha3/nginx-shibboleth-certbot:1.0
```

# To build the docker image
```
docker build -t anusha3/nginx-shibboleth-certbot:1.0
```
