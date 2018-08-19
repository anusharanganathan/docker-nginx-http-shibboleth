# About this Repo

This is a fork of [criluc/docker-nginx-http-shibboleth](https://github.com/criluc/docker-nginx-http-shibboleth).

It contains
 * The nginx-full version
 * [nginx-http-shibboleth](https://github.com/nginx-shib/nginx-http-shibboleth)
which allows authorization based on the result of a subrequest to
Shibboleth
 * [Certbot-nginx](https://certbot.eff.org/lets-encrypt/debianstretch-nginx) for SSL deploying Let's encrypt certificates (with cron to renew certs)

# Current Version

Current nginx version is *1.14.0 stable*.
Current ngnix-http-shibboleth module is based on commit *d954cab13859f186862a38c32b7748760b947aa8.*
The latest certbot packages from Stretch backports

# Docker Image

The docker images is available through the docker hub at
https://registry.hub.docker.com/u/criluc/docker-nginx-http-shibboleth/.

For example:

```
docker pull criluc/docker-nginx-http-shibboleth
```
