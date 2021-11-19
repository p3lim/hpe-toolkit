#!/bin/bash

if [[ -z "$FWPP_TOKEN" ]]; then
	echo "Missing envvar 'FWPP_TOKEN', required to authenticate with FWPP repo."
	echo "https://downloads.linux.hpe.com/sdr/project/fwpp/"
	exit 1
fi

# write the FWPP token to dnf vars so the repo can read it
echo "$FWPP_TOKEN" > /etc/dnf/vars/fwpptoken

exec "$@"
