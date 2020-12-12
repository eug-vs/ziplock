# ziplock
Flutter application for managing zip-codes - FAMCS 2020 1st semester course project.

# Development with Docker
I don't want to blow up my machine with unnecessary packages, SDK's and frameworks. Therefore I run flutter in Docker.

To build and run the container in the interactive mode, run `./start.sh`. After the image is built, you will find your self in the interactive shell, where `ziplock/` directory is shared with your project directory. Therefore just plain `cd ziplock && flutter run` will do the job. Script forwards USB device into the container, but if your device doesn't show up try restarting **ADB** with `adb kill-server && adb start-server`.
