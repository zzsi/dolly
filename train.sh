# Note: use this virtualenv!!
# . .venv/bin/activate
RUN=3
deepspeed --num_gpus=8 \
    --module training.trainer \
    --deepspeed /home/ubuntu/dolly/config/ds_z3_bf16_config.json \
    --epochs 1 --local-output-dir /home/ubuntu/dolly_training/dolly__2023-03-24-${RUN} \
    --dbfs-output-dir /dbfs/dolly_training/dolly__2023-03-24-${RUN} \
    --per-device-train-batch-size 8 --per-device-eval-batch-size 8 \
    --lr 1e-5 \
    2>&1 | tee train-${RUN}.log
    # Don't put the train.log in the output folder. It will be deleted automatically.