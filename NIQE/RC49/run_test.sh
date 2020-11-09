cd fake_data
unzip fake_images_CcGAN_hard_nsamp_179800.zip -d fake_images_CcGAN_hard_nsamp_179800/
unzip fake_images_CcGAN_limit_nsamp_179800.zip -d fake_images_CcGAN_limit_nsamp_179800/
unzip fake_images_CcGAN_soft_nsamp_179800.zip -d fake_images_CcGAN_soft_nsamp_179800/
unzip fake_images_cGAN_nclass_60_nsamp_179800.zip -d fake_images_cGAN_nclass_60_nsamp_179800/
unzip fake_images_cGAN_nclass_90_nsamp_179800.zip -d fake_images_cGAN_nclass_90_nsamp_179800/
unzip fake_images_cGAN_nclass_150_nsamp_179800.zip -d fake_images_cGAN_nclass_150_nsamp_179800/
unzip fake_images_cGAN_nclass_210_nsamp_179800.zip -d fake_images_cGAN_nclass_210_nsamp_179800/
unzip fake_images_improved_CcGAN_hard_nsamp_179800.zip -d fake_images_improved_CcGAN_hard_nsamp_179800/
unzip fake_images_improved_CcGAN_soft_nsamp_179800.zip -d fake_images_improved_CcGAN_soft_nsamp_179800/
cd ..

bash ./imgs_to_groups_fake.sh

matlab -nodisplay -nodesktop -r "run Intra_niqe_test_rc49.m"

cd fake_data
rm -rf fake_images*
