###From this directory 

Install all dependency and plugins and initialize remote s3 bucket for *.tfstate files:

`terraform init` or `terraform init -reconfigure`

`terraform workspace show`

Create environment workspace (dev|staging|production) (depends on the environment):

`terraform workspace new (dev|staging|production)`

Select environment:

`terraform workspace select (dev|staging|production)`

Create resources:

`terraform plan -var-file="env/(dev|staging|production).tfvars"`

`terraform apply -var-file="env/(dev|staging|production).tfvars"`