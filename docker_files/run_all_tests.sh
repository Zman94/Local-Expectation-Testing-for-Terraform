if [ -f execstats.txt ]; then
  logs/all_testcases_exectime_stats.log
fi

for testcase in test_*
do
    printf "################ Executing test %s" $testcase
    cd $testcase
    chmod +x ./run_tests.sh
    ./run_tests.sh
    cd ..
done
echo "################ All tests complete"
exit 0
