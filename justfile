build:
    docker build -f Dockerfile.amd -t strata-amd .

run: build
    docker run --rm \
    --device /dev/kfd --device /dev/dri \
    --group-add video --group-add render --ipc=host \
    --ulimit memlock=-1 --ulimit core=0 \
    -p 8079:8080 -v /home/allen/dev/Strata/strata-data:/data \
    -e MODEL=IQ3_S strata-amd
