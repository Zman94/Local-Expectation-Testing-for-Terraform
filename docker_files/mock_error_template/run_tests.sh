export TIME="\n%E real,\n%U user,\n%S sys\n" # If using bash or ksh
echo '\t################ Installing Terraform version'
asdf install

echo '\t################ Running tests on Terraform version:'
asdf current
terraform version

echo '\t################ Tests for mock error AWS'
echo '\t\t----Apply times for mock error AWS'
time terraform apply -auto-approve -target aws/main_error.tf
echo '\t\t----Destroy times for mock error AWS'
time terraform destroy -auto-approve -target aws/main_error.tf

echo '\t################ Tests for mock error localstack'
echo '\t\t----Apply times for mock error localstack'
time terraform apply -auto-approve -target localstack/main_error.tf
echo '\t\t----Destroy times for mock error localstack'
time terraform destroy -auto-approve -target localstack/main_error.tf

echo '\t################ Tests for mock error moto'
echo '\t\t----Apply times for mock error moto'
time terraform apply -auto-approve -target moto/main_error.tf
echo '\t\t----Destroy times for mock error moto'
time terraform destroy -auto-approve -target moto/main_error.tf

echo '\t################ Tests for mock solve AWS'
echo '\t\t----Apply times for mock solve AWS'
time terraform apply -auto-approve -target aws/main_solve.tf
echo '\t\t----Destroy times for mock solve AWS'
time terraform destroy -auto-approve -target aws/main_solve.tf

echo '\t################ Tests for mock solve localstack'
echo '\t\t----Apply times for mock solve localstack'
time terraform apply -auto-approve -target localstack/main_solve.tf
echo '\t\t----Destroy times for mock solve localstack'
time terraform destroy -auto-approve -target localstack/main_solve.tf

echo '\t################ Tests for mock solve moto'
echo '\t\t----Apply times for mock solve moto'
time terraform apply -auto-approve -target moto/main_solve.tf
echo '\t\t----Destroy times for mock solve moto'
time terraform destroy -auto-approve -target moto/main_solve.tf

echo "\t################ Tests complete"
