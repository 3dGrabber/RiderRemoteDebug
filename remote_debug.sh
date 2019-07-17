#!/usr/bin/env bash

remote_host='username@remote.net'         # must have ssh access/key/agent, password not supported
remote_path='/path/to/deploy/dir'         # files will be overwritten/deleted !
debug_port='50000'                        # must be available on remote and local
local_bin_dir='./bin/Debug/'              # absolute or relative to this script, needs a trailing /
exe='MyProgram.exe'

remote_exe="${remote_path}/${exe}"
ssh_tunnel="ssh ${remote_host} -R ${debug_port}:localhost:${debug_port}"
mono_debug="mono --debugger-agent=address=localhost:${debug_port},server=n,transport=dt_socket --debug ${remote_exe}"

echo "# syncing"
rsync -r --delete ${local_bin_dir} ${remote_host}:${remote_path}

echo "# killing previous debug processes"
ssh ${remote_host} pkill -f '"'${mono_debug}'"'

echo "# starting mono"
${ssh_tunnel} ${mono_debug}
