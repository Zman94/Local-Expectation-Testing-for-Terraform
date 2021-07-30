# Executes terraform fmt on all error.tf and fixed.tf files.

for dir  in $(ls -d */ | grep ^test)
do
pushd $dir
terraform fmt error.tf
terraform fmt fixed.tf
popd
done
