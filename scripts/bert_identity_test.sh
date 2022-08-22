#!/bin/bash
# Sanity check for Triton server's liveness and correctness.
# It runs the request locally on the huggingface model and compares the reference output
# with the output returned by the Triton server.

if [ "$#" -ne 1 ] || ! [ -d $1 ]; then
    echo  "Usage: $0 BERT_BASE_UNCASED_DIRECTORY" >&2
    exit 1
fi

if ! [ $(basename $(pwd)) == "fastertransformer_backend" ]; then
    echo "Mush run in the project root folder." >&2
    exit 1
fi

python3 tools/bert/identity_test.py --hf_ckpt_path $1 --inference_data_type fp16