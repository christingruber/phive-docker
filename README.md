# PHIVE docker image

Docker image for the PHAR installation and verification environment (PHIVE). For more information 
about PHIVE visit the official website from the [PHAR](https://phar.io/) maintainers.

## Install

Pull the image from docker hub.
```shell
docker pull christingruber/phive
```
## Execute

Show us the current phive version.
```shell
docker run christingruber/phive version
```
## Usage

As multistage inside your own container.
```shell
COPY --from=christingruber/phive /usr/local/bin/phive /usr/local/bin/phive
```