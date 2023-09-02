## Terraform State Commands

### Terraform State List

Description: Lists resources in the state

```bash
terraform state list
```

### Terraform State Mv

Description: moves an item in the state. Use in case of a rename

```bash
terraform state mv <resource_name> <resource_name>
```

### Terraform State Pull

Description: Pulls use manually download and output the state from the backend

```bash
terraform state pull
```

### Terraform State Push

Description: Pushes the local state to the backend

```bash
terraform state push
```

### Terraform State Rm

Description: Removes an item from the terraform state. Items removed from the state are not physically destroyed

```bash
terraform state rm <resource_name>
```

### Terraform State Show

Description: Shows the attributes of a single resource in the state

```bash
terraform state show <resource_name>
```
