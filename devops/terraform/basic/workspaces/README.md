### List Workspace
```bash
terraform workspace list
```

### New Workspace
```bash
terraform workspace new dev
```

### Switch Workspace
```bash
terraform workspace select dev
```

### Delete Workspace
>It is important to note that the delete command will remove the Terraform state but will NOT destroy the infrastructure. This is why we ran the destroy command first!
```bash
terraform workspace select dev

terraform destroy

terraform workspace delete dev
```
