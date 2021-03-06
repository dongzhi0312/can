#!/bin/bash

export PYTHONPATH="`pwd`:${PYTHONPATH}"
if [ $# != 4 ]
then 
  echo "Please specify 1) cfg; 2) gpus; 3) method; 4) exp_name."
  exit
fi

cfg=${1}
gpus=${2}
method=${3}
exp_name=${4}

out_dir=./experiments/ckpt/${exp_name}
if [ -d ${out_dir} ]
then
  rm -rf ${out_dir}
fi
mkdir -p ${out_dir}

CUDA_VISIBLE_DEVICES=${gpus} python ./tools/train.py --cfg ${cfg} \
           --method ${3} --exp_name ${4} 2>&1 | tee ${out_dir}/log.txt
#           CUDA_VISIBLE_DEVICES=0
python ./tools/train.py --cfg ./experiments/config/VisDA-2017/CAN/visda17_train_train2val_cfg.yaml --method CAN --exp_name visda17_train2val 2>&1 | tee ./experiments/ckpt/visda17_train2val/log.txt