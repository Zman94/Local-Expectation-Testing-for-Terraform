# cs598-research-project

A place to collaborate and share code and related files with the team.

### Structure

#### docker_files

This directory is used to write our tests. When running our experiments in docker, it will copy this directory to our container

Files:

`run_all_tests.sh` - Automation to run all our tests sequentially

`mock_error_template` - The template file. When creating a new error to test, copy this template to a number. The strucure exists to help our automation

`mock_error_<number>` - A specific error we are testing

`mock_error_<number>/.tool_versions` - Versioning for terraform specific to that error

`mock_error_<number>/run_tests.sh` - Automation to run a specific error's tests

`mock_error_<number>/main_error.tf` - The error we are testing. Sym linked to all providers for our automation

`mock_error_<number>/main_solve.tf` - The error we are testing, but fixed. Sym linked to all providers for our automation

`mock_error_<number>/<provider>` - Our three providers we're testing on

`mock_error_<number>/<provider>/main_error.tf` - sym linked file, edit the `mock_error_<number>/main_error.tf` instead

`mock_error_<number>/<provider>/main_solve.tf` - sym linked file, edit the `mock_error_<number>/main_solve.tf` instead

#### research_paper_files

`final_doc.tex` - Our current latex file

`final_doc.pdf` - The current pdf of our latex file

`img/` - Any images used in our latex file
