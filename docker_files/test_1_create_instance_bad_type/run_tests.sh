export TIME="\n%E real,\n%U user,\n%S sys\n" # If using bash or ksh

stash_credentials() {
	if [ -d ~/.aws ]; then
		mv ~/.aws ~/.aws_stash
	fi
	mkdir ~/.aws
	printf "[default]\nregion = us-east-1" > ~/.aws/config
	printf "[default]\naws_access_key_id = testing\naws_secret_access_key = testing" > ~/.aws/credentials
}

unstash_credentials() {
	if [ -d ~/.aws_stash ]; then
		rm -rf ~/.aws
		mv ~/.aws_stash ~/.aws
	fi
}

for outcome in error; do
	printf "\t################ Testing for '%s' outcome\n" $outcome
	cd $outcome
	for provider in $(ls -d */ | sed -e 's-/$--'); do
		printf '\t\t----Provider %s\n' $provider
		if [ "$provider" != "aws" ]; then
			printf '\t\t------Provider is not AWS, stashing AWS credentials\n'
			stash_credentials
		fi
		cd $provider
		terraform init
                OUTFILE = "$outcome_$provider_TIME.TXT"
		printf '\t\t\t----Recording apply time\n'
		time terraform apply -auto-approve > ${OUTFILE}
		printf '\t\t\t----Recording destroy time\n'
		time terraform destroy -auto-approve
		if [ "$provider" != "aws" ]; then
			unstash_credentials
                fi
		cd ../
	done
	cd ../
done

printf "################ Tests complete\n"
