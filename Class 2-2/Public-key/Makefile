virginia:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform apply --var-file Regions/virginia.tfvars --auto-approve

ohio:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform apply --var-file Regions/ohio.tfvars --auto-approve

california:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform apply --var-file Regions/california.tfvars --auto-approve

oregon:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform apply --var-file Regions/oregon.tfvars --auto-approve

apply-all: virginia ohio oregon california


virginia-destroy:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy --var-file Regions/virginia.tfvars --auto-approve

ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy --var-file Regions/ohio.tfvars --auto-approve

california-destroy:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform destroy --var-file Regions/california.tfvars --auto-approve

oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy --var-file Regions/oregon.tfvars --auto-approve

destroy-all: virginia ohio oregon california