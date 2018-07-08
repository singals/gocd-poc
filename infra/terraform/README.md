We will be using [Terraform](https://www.terraform.io/) for provisioning all the infra that we need for the demo environment. 
The infra will be available on AWS.

####Setup
- Create file named `terraform.tfvars` in `infra/terraform` directory
- Add the following content to it:
```bash
access_key = "access_key"
secret_key = "secret_key"
```
- Replace the access_key and secret_key by your own key