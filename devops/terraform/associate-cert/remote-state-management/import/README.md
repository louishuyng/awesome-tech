## Terraform Import

- Terraform import is used to import existing infrastructure into Terraform. This allows you to take resources you've created by some other means and bring it under Terraform management.

- This is a great way to slowly transition infrastructure to Terraform, or to be able to be confident that you can use Terraform in the future if you choose to do so.

From version Terraform 1.5 can import resources from a Terraform configuration file.

### Step 1: Generate config file

```bash
terraform plan -generate-config-out=sg.tfconfig
```

### Step 2: Geneate State file

```bash
terraform apply -auto-approve
```
