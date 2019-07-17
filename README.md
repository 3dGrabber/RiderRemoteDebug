# RiderRemoteDebug

_One-click deploy and debug a .Net executable on a remote machine (almost)._

Remote debugging with Rider is possible, but cumbersome. You need to manually upload the binaries, run them and then attach your local debugger to the remote process.  
The goal of this project is to be able to just hit alt-F5 and start debugging.

This Bash script does the following:

- upload the binaries to the remote server (efficiently via rsync)
- open an ssh tunnel (no need for port forwarding and whatnot)
- start and connect the remote debuggee to the local IDE

# Setup

- Copy the script into the root of your project
- Adjust settings, line 3 to 7
- Create a run configuration for the script
- Create a "Mono Remote" debug configuration (port number must match)

# Debug

1. Run "Mono Remote"
2. Run "RiderRemoteDebug"

# Possible Improvements

- Find a way to run "Mono Remote" & "RiderRemoteDebug" at once
- .Net Core support
- Create a standalone Run configuration with UI to fill in `remote_host`, `remote_path` etc.
- Windows support (rsync?)
- support for ssh key files/passwords
- integrate with Rider's `Debugger/Remote debug`


*Contributions are most welcome*



