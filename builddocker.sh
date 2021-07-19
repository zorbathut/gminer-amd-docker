#!/bin/bash -e

rm -rf contents
mkdir contents

cp -r /usr/bin/clinfo contents
cp -r /opt/amdgpu-pro contents
cp -r /etc/ld.so.conf.d/10-amdgpu-pro.conf contents
cp -r /etc/OpenCL contents

mkdir contents/lib
mkdir contents/lib/x86_64-linux-gnu
cp /lib/x86_64-linux-gnu/libdrm* contents/lib/x86_64-linux-gnu

cp -r ~zorba/gminer contents/gminer

docker build -t climage .

echo "Finished. Run with:"
echo "    docker run --device /dev/dri:/dev/dri <extra-params> climage <command>"
