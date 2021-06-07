#!/bin/bash
set -u
set -e

[[ ! -s ./package.json ]] && {
	echo 'You should run this script from a directory containing node project' >&2
	exit 1
}

containerid=$(docker ps -a --no-trunc --filter name='^/node16$' -q)
projectName=$(echo "node16-${PWD##*/}"|tr -dc 'a-zA-Z0-9-_')

_PS1="[41;33mdocker:${projectName}"\
"[42;35m#\\#"\
"[44;37;1m \\w "\
"[0;40mu$(id -u)"\
"\\\$"\
"[41m \$? "\
"[40;36m@\$(date +%H:%M:%S)[0m\\n"

if [[ -z "${containerid}" ]] ; then
	echo "Starting container ${projectName} as user $(id -u -n) mounting ${PWD} as ~/src"
	docker run --rm -u $(id -u) \
		-v $PWD:/home/node/src \
		-e PROJECT_NAME="${projectName}" \
		-e PS1="${_PS1}" \
		--name "${projectName}" \
		-it node:16 \
		bash --norc --noprofile
else
	echo "Attaching terminal to container ${projectName} as user $(id -u -n)"
	docker exec -u $(id -u) \
		-it "${projectName}" \
		bash --norc --noprofile
fi
exit 0
