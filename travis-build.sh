#! /bin/sh
# vim:set sw=8 ts=8 noet:
#
# Copyright (c) 2016-2017 Torchbox Ltd.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely. This software is provided 'as-is', without any express or implied
# warranty.

set -e

printf '####################################################################\n'
printf '>>> Building Docker image.\n\n'
docker build --pull -t torchbox/pgbouncer:$COMMIT .

# If this is a release, push the Docker image to Docker Hub.
if [ "$TRAVIS_PULL_REQUEST" = "false" -a -n "$TRAVIS_TAG" ]; then
	printf '####################################################################\n'
	printf '>>> Creating release.\n\n'

	docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
	docker tag torchbox/pgbouncer:$COMMIT torchbox/pgbouncer:1.7
	docker push torchbox/pgbouncer:1.7
	docker tag torchbox/pgbouncer:$COMMIT torchbox/pgbouncer:latest
	docker push torchbox/pgbouncer:latest
fi
