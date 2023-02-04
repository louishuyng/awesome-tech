### Running Command
```bash
terraform apply -var bucket_suffix=hello -var bucket_name=louis-test-buckets
```

### Setting a Variable Using environment variable
```bash
export TF_VAR_bucket_name=<your-bucketname>
export TF_VAR_bucket_suffix=via-en
```

### Setting a Variable Using File
> `terraform.tfvars` is a special filename that Terraform looks at to discover values for variables. Terraform will look in this file and use any values given for a variable. To set the value of the variable you simply put the variable identifier, an equals sign, and the value you want to give ite

> The other way we could have named our file is by using anything ending in .auto.tfvars. Terraform examines files with that ending for set variables. It is also possible to define multiple files and put the value for different variables in each of them.
