find ./roots/api/env/ -type d -exec touch {}/{production.tfvars,staging.tfvars,dev.tfvars} \;

terraform workspace show

terraform workspace new (dev|staging|production)

terraform plan -var-file="env/(dev|staging|production).tfvars"
