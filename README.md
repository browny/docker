docker
======

The collection of useful Dockerfile

docker commands
======

```bash

	// Get host binding port by docker container id
	$ docker inspect 2da3ea4f0124 | grep HostPort -m1 | awk '{print $2}' | cut -d'"' -f2"

```
