INTERFACE=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
SUBNET_ID=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/${INTERFACE}/subnet-id)
VPC_ID=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/${INTERFACE}/vpc-id)

echo SUBNET_ID

$INTERFACE=$(Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
$SUBNET_ID=$(Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/network/interfaces/macs/$INTERFACE/subnet-id)
$VPC_ID=$(Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/network/interfaces/macs/$INTERFACE/vpc-id)
$VPC_ID.content
