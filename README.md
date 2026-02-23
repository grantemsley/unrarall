# unrarall

This is a wrapper around arfoll's [unrarall script](https://github.com/arfoll/unrarall) which runs constantly looking for newly added files to extract.

## Environment variables

| Variable | Default | Description |
|---|---|---|
| `DELAY` | `300` | Seconds to sleep between runs |
| `CLEANMODE` | `all` | Passed to `--clean=`. Some valid values include: `none`, `rar`, `nfo`, `all` (see script for more options)|
| `UNRARALL_ARGS` | _(empty)_ | Extra flags forwarded verbatim to `unrarall` (e.g. `--force --verbose`) |

The target directory is always `/input`.

## Running with docker

```sh
docker run -d \
  -v /path/to/media:/input \
  -e DELAY=300 \
  -e CLEANMODE=all \
  ghcr.io/grantemsley/unrarall
```

## Docker Compose

```yaml
services:
  unrarall:
    image: ghcr.io/grantemsley/unrarall
    restart: unless-stopped
    volumes:
      - /path/to/media:/input
    environment:
      DELAY: 300
      CLEANMODE: all      # delete all files after successful extraction
      UNRARALL_ARGS: ""   # e.g. "--force --verbose"
```
