# Delete's all terraform state files outside of AWS

for dir  in $(ls -d */ | grep ^test)
do
cd $dir
cd error/moto
rm -rf .terraform*
rm -rf terraform.tfstate*
cd ../localstack
rm -rf .terraform*
rm -rf terraform.tfstate*
cd ../../fixed/moto
rm -rf .terraform*
rm -rf terraform.tfstate*
cd ../localstack
rm -rf .terraform*
rm -rf terraform.tfstate*
cd ../../../
done
