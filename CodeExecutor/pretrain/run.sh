PER_NODE_GPU=8
python -m torch.distributed.launch --nproc_per_node=${PER_NODE_GPU} run.py \
    --output_dir ../saved_models/pretrain_codeexecutor_stage_3 \
    --data_cache_dir ../saved_models/pretrain_codeexecutor_stage_3 \
    --train_data_path /drive/pretrain_codenetmut.json \
    --another_train_data_path /drive/pretrain_tutorial.json \
    --third_train_data_path /drive/single_line_hard_3_million.json \
    --eval_data_path ../data/codenetmut_test.json \
    --model_name_or_path ../saved_models/pretrain_codeexecutor_stage_2 \
    --block_size 1024 \
    --per_gpu_train_batch_size 4 \
    --per_gpu_eval_batch_size 8 \
    --gradient_accumulation_steps 8 \
    --learning_rate 4e-4 \
    --node_index=0 \
    --gpu_per_node $PER_NODE_GPU \
    --weight_decay 0.01 \
    --adam_epsilon 1e-6 \
    --max_grad_norm 1.0 \
    --max_steps 1000000 \
    --warmup_steps 10000 \
    --save_steps 5000 \
    --seed 123