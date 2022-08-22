#!/bin/bash
# Launch the Triton Server in the container.
# The number of visible devices must equal to T * P * instance_num (fastertransformer constraint).
# No need to worry about the WORKSPACE environment variable because it is set during the container launch process.

if [ "$#" -ne 1 ]; then
    echo  "Usage: $0 CUDA_VISIBLE_DEVICES" >&2
    exit 1
fi

CUDA_VISIBLE_DEVICES=$1 mpirun -n 1 --allow-run-as-root /opt/tritonserver/bin/tritonserver  --model-repository=${WORKSPACE}/all_models/bert/