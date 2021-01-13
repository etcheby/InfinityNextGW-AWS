# InfinityNextGW-AWS
Deploys CloudGuard WAAP Infinity-Next Gateway as a VM in existing VPC. VPC must have existing public &amp; private subnets, IGW

# Pre-Requisites
 * Infinity Next-G tenant; Go to https://portal.checkpoint.com to create one
 * Valid Token from created profile under ENFORCEMENTS --> Profiles
 For more information on steps, follow Infinity Next Admin Guide
https://sc1.checkpoint.com/documents/Infinity_Portal/WebAdminGuides/EN/Infinity-Next-Admin-Guide/Default.htm

# Terraform Environment

* Using Terraform Cloud backend with existing workspace & environment variables to pass credentials. Remove backend block under provider.tf should you use alternate authentication and backend method per TF documentation. 

# Deployment Steps

