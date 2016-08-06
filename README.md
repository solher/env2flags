# env2flags
Run commands converting environment variables to flags.

# Basic usage
```
$ export SECOND_VAR="foo"
$ export THIRD_VAR="bar"
$ env2flags.sh FIRST_VAR SECOND_VAR -- app -first.var=foobar
> app -first.var=foobar -second.var=foo -third.var=bar
```

The main point is to use it in a `Dockerfile` as follows:

```
ENTRYPOINT ["env2flags", "FIRST_VAR", "SECOND_VAR", "--"]
CMD ["app"]
```