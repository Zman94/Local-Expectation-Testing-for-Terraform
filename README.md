# cs598-research-project

A place to collaborate and share code and related files with the team.

## Structure

### Files

This directory is used to write our tests. When running our experiments in docker, it will copy this directory to our container

`run_all_tests.sh` - Automation to run all our tests sequentially

`mock_error_template` - The template file. When creating a new error to test, copy this template to a number. The strucure exists to help our automation

`mock_error_<number>` - A specific error we are testing

`mock_error_<number>/.tool_versions` - Versioning (using asdf) for terraform specific to that error

`mock_error_<number>/run_tests.sh` - Automation to run a specific error's tests

`mock_error_<number>/error.tf` - The error we are testing. Sym linked to all providers for our automation

`mock_error_<number>/fixed.tf` - The error we are testing, but fixed. Sym linked to all providers for our automation

`mock_error_<number>/<error, fixed>/<provider>` - Our three providers we're testing on

`mock_error_<number>/<error, fixed>/provider>/error.tf` - sym linked file, edit the `mock_error_<number>/error.tf` instead

`mock_error_<number>/<error, fixed><provider>/fixed.tf` - sym linked file, edit the `mock_error_<number>/fixed.tf` instead

## How to Recreate Experiments

### Dependencies

[Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli): For our tests, we us version 0.15.5.

[Moto](https://github.com/spulec/moto#stand-alone-server-mode): We recommend using the stand-alone server mode.

[Localstack](https://github.com/localstack/localstack#installing): Also requires Docker

[Docker](https://www.docker.com/): Localstack runs within Docker

[asdf](https://asdf-vm.com/): Optional if you have Terraform 0.15.5 installed already.

### Running the Tests

1. Start docker

2. Start Moto in one tab. `localsack start`

3. Start Localstack in a second tab. `moto_server -p13000`

4. Run `run_all_tests.sh` and your logs will appear in `logs`.

## Creating new test cases

To create a new test case, copy the `template` directory into a new `test_X_<name>` directory. `run_all_tests.sh` will automatically pick it up and record logs.
