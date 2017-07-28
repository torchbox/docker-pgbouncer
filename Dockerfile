# vim:set sw=8 ts=8 noet:
# Copyright (c) 2016-2017 Torchbox Ltd.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely. This software is provided 'as-is', without any express or implied
# warranty.

FROM alpine:3.6

RUN apk add --no-cache pgbouncer su-exec
CMD [ "/sbin/su-exec", "pgbouncer", "/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini" ]
