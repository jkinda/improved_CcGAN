ROOT_PATH="./improved_CcGAN/RC-49-improved"
DATA_PATH="./improved_CcGAN/dataset/RC-49"

SEED=2020
MIN_LABEL=0.0
MAX_LABEL=90.0
MAX_N_IMG_PER_LABEL=25
MAX_N_IMG_PER_LABEL_AFTER_REPLICA=0
NITERS=30000
BATCH_SIZE_D=256
BATCH_SIZE_G=256
SIGMA=-1.0
KAPPA=-2.0
LR_G=1e-4
LR_D=1e-4

DIM_GAN=256
DIM_EMBED=128
LOSS_TYPE='vanilla'

FID_EPOCH_CNN=200
NUM_EVAL_LABELS=-1
NFAKE_PER_LABEL=200
SAMP_BATCH_SIZE=1000
FID_RADIUS=0
FID_NUM_CENTERS=-1


# echo "-------------------------------------------------------------------------------------------------"
# echo "Pre-trained CNN for evaluation"
# CUDA_VISIBLE_DEVICES=1,0 python3 pretrain_CNN_regre.py --root_path $ROOT_PATH --data_path $DATA_PATH --CNN ResNet34_regre --epochs $FID_EPOCH_CNN --batch_size_train 256 --batch_size_valid 64 --base_lr 0.01 --seed $SEED --min_label $MIN_LABEL --max_label $MAX_LABEL


echo "-------------------------------------------------------------------------------------------------"
echo "Continuous cGAN Hard"
CUDA_VISIBLE_DEVICES=1,0 python3 main.py --root_path $ROOT_PATH --data_path $DATA_PATH --GAN CcGAN --seed $SEED --min_label $MIN_LABEL --max_label $MAX_LABEL --max_num_img_per_label $MAX_N_IMG_PER_LABEL --max_num_img_per_label_after_replica $MAX_N_IMG_PER_LABEL_AFTER_REPLICA --threshold_type hard --kernel_sigma $SIGMA --kappa $KAPPA --dim_gan $DIM_GAN --niters_gan $NITERS --resume_niters_gan 0 --save_niters_freq 2000 --lr_g_gan $LR_G --lr_d_gan $LR_D --batch_size_disc $BATCH_SIZE_D --batch_size_gene $BATCH_SIZE_G --num_eval_labels $NUM_EVAL_LABELS --nfake_per_label $NFAKE_PER_LABEL --visualize_fake_images --dim_embed $DIM_EMBED --comp_FID --samp_batch_size $SAMP_BATCH_SIZE --FID_radius $FID_RADIUS --FID_num_centers $FID_NUM_CENTERS --dump_fake_for_NIQE 2>&1 | tee output_hard.txt

echo "-------------------------------------------------------------------------------------------------"
echo "Continuous cGAN Soft"
CUDA_VISIBLE_DEVICES=1,0 python3 main.py --root_path $ROOT_PATH --data_path $DATA_PATH --GAN CcGAN --seed $SEED --min_label $MIN_LABEL --max_label $MAX_LABEL --max_num_img_per_label $MAX_N_IMG_PER_LABEL --max_num_img_per_label_after_replica $MAX_N_IMG_PER_LABEL_AFTER_REPLICA --threshold_type soft --kernel_sigma $SIGMA --kappa $KAPPA --dim_gan $DIM_GAN --niters_gan $NITERS --resume_niters_gan 0 --save_niters_freq 2000 --lr_g_gan $LR_G --lr_d_gan $LR_D --batch_size_disc $BATCH_SIZE_D --batch_size_gene $BATCH_SIZE_G --num_eval_labels $NUM_EVAL_LABELS --nfake_per_label $NFAKE_PER_LABEL --visualize_fake_images --dim_embed $DIM_EMBED --comp_FID --samp_batch_size $SAMP_BATCH_SIZE --FID_radius $FID_RADIUS --FID_num_centers $FID_NUM_CENTERS --dump_fake_for_NIQE 2>&1 | tee output_soft.txt
