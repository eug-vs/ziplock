docker build . --tag ziplock
docker run -it -v $(pwd):/home/developer/ziplock -v /dev/bus/usb:/dev/bus/usb --privileged ziplock:latest
