FROM alpine:3.14

### Install asdf for version management ###
RUN apk add curl git
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

###  Copy in required directories ###
COPY docker_files /tmp/experiments

### Run our whole experiment ###
# RUN cd tmp && chmo +x run_all_tests.sh && ./run_all_tests.sh