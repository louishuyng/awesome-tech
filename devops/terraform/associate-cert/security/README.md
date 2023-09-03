## Dependency Lock File

When specific versions of dependencies are required, a lock file is used to ensure that the same versions are installed on all machines.

This is done by running `terraform init` which will create a lock file `terraform.lock.hcl.`

Change the version of the `aws` provider in `main.tf` to a different version and run `terraform init` again. This will get an error that the versions do not match and will not allow you to proceed until the versions match.

To fix this, change the version back to the original version and run `terraform init` again. This will update the lock file to the correct version and allow you to proceed.

Or you can use upgrade option to update the provider version in the lock file. Run `terraform init -upgrade` and it will update the lock file to the latest version of the provider.
