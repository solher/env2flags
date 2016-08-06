# env2flags
Convert environment variables to flags.

# Basic usage
```
$ export DOCKER_HOST="tcp://192.168.99.100:2376"
$ export DOCKER_TLS_VERIFY="1"
$ env2flags.sh DOCKER_HOST DOCKER_TLS_VERIFY
> -docker.host=tcp://192.168.99.100:2376 -docker.tls.verify=1
```