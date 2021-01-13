############################################
#### WAAP INFINITY NEXT GATEWAY-AWS ########
############################################

# Created by Eugene Tcheby - Cloud Security Architect - Canada
# Deploys CloudGuard WAAP Infinity-Next Gateway as a VM in existing VPC
# VPC must have existing public & private subnets, IGW

resource "aws_cloudformation_stack" "chkpinfinity" {
  name = var.cft_name

  parameters = {

    VPC                     = var.vpc  
    PublicSubnet            = var.public_subnet
    PrivateSubnet           = var.private_subnet
    InternalRouteTable      = var.internal_rt
    GatewayName             = var.gateway_name
    GatewayInstanceType     = var.instance_type
    KeyName                 = var.key_name
    AllocatePublicAddress   = "true"
    EnableInstanceConnect   = "false"
    InboundSources          = var.inbound_sources
    GatewayPasswordHash     = var.password_hash    
    InfinityToken           = var.infinity_token
    GatewayHostname         = var.gateway_name
    GatewayBootstrapScript  = ""
 
  }

  template_url       = "https://cgi-cfts.s3.amazonaws.com/waap/waap-gateway.yaml"
  capabilities       = ["CAPABILITY_IAM"]
  disable_rollback   = true
  timeout_in_minutes = 30

}
