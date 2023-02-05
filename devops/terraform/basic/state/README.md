### Import Resource
> Firstly, create vpc resource on aws, then copy the vpc id and replace in <VPC ID> command below
```bash
terraform import aws_vpc.example <VPC_ID>
```

### Move Resource
> Move state to another project
```bash
terraform state mv -state-out=./another-project/terraform.tfstate aws_vpc.example aws_vpc.main
```
> List State
```bash
terraform state list
```

> Testing remove resource in another project => Check on AWS UI and see vpc now is removed
```bash
terraform destroy
```
