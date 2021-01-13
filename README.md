# InfinityNextGW-AWS
Deploys CloudGuard WAAP Infinity-Next Gateway as a VM in existing VPC. VPC must have existing public &amp; private subnets, IGW. 
It also deploys an AWS Linux Instance with public IP running BWapp Pen Test app running on docker container on port 7070
We assign public IP to instance so you can test both the Web Apps attacks with Infinity Next Gateway reverse-proxy and without them to understand Check Point WAAP Infinity Next Gateway solution capabilities. 

PS: Feel free to add more line to instance user-data shoud you need to deploy more containarized vulnerable webapps.

# Pre-Requisites
 * Infinity Next-G tenant; Go to https://portal.checkpoint.com to create one
 * Valid Token from created profile under ENFORCEMENTS --> Profiles
 For more information on steps, follow Infinity Next Admin Guide
https://sc1.checkpoint.com/documents/Infinity_Portal/WebAdminGuides/EN/Infinity-Next-Admin-Guide/Default.htm

# Terraform Environment

* Using Terraform Cloud backend with existing workspace & environment variables to pass credentials. Remove backend block under provider.tf should you use alternate authentication and backend method per TF documentation. 

# Deployment Steps

* Under variables.tf - Remove existing strings & enter default values for each variable or
* Leave default line empty on each variable under variables.tf & pass required variable strings under the terraform.tfvars file. 
* Run Terraform validate
* Run Terraform plan
* Run terraform apply or terraform apply --auto-approve
