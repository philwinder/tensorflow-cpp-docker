FROM praekeltfoundation/alpine-buildpack-deps

RUN apk add -U cmake

RUN git clone --recursive https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    JOB_COUNT=1 bash tensorflow/contrib/makefile/build_all_linux.sh && \
    cd .. && \
    git clone https://github.com/formath/tensorflow-predictor-cpp.git && \
    cd tensorflow-predictor-cpp && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

CMD ["sh"]