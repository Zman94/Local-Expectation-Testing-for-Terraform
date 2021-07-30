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


SCRIPTPATH=`pwd`
testcase_name=`echo ${SCRIPTPATH} | rev | cut -d / -f 1 | rev`

outcomes="error fixed"
for outcome in ${outcomes}; do
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
		printf '\t\t\t----Recording apply time\n'
		log_dir="${SCRIPTPATH}/../logs"
		this_test_execution_time_stats_log="${log_dir}/${testcase_name}_${outcome}_${provider}_exectime_stats.log"
    all_execution_time_stats_log="${log_dir}/all_testcases_exectime_stats.log"
	  { time terraform apply -auto-approve ; } 2>> ${this_test_execution_time_stats_log}
    exec_time=`cat ${this_test_execution_time_stats_log} | grep real`
		echo "${testcase_name}:${outcome}:${provider}:${exec_time} " >> ${all_execution_time_stats_log}
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