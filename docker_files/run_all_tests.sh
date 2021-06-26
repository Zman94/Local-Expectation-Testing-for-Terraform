export AWS_ACCESS_KEY_ID="<access_key_id from aws administrator>"
export AWS_SECRET_ACCESS_KEY="<secret_access_key from aws administrator>"

for mock in 1 2 3 4 5
do
    echo "################ Tests for mock error $number"
    cd "mock_error_$number"
    chmod +x ./run_tests.sh
    ./run_tests.sh
    cd ..
done
echo "################ All tests complete"
exit 0