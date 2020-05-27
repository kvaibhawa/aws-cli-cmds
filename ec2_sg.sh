aws ec2 describe-security-groups --filters Name=group-name,Values=test-sg --query "SecurityGroups[*].{ID:GroupId}" --output text
