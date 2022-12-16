#!/bin/bash
policy_arn=$(aws iam list-policies --scope Local --query 'Policies[].Arn|[0]' --output text)
echo "found ${policy_arn}"
while [[ ! -z "$policy_arn" ]]
do
    # lets get first arn

    echo "The policy arn to be deleted is ${policy_arn}"
    aws iam delete-policy --policy-arn ${policy_arn} --output text
    echo "The policy arn is successfully deleted"
    policy_arn=$(aws iam list-policies --scope Local --query 'Policies[].Arn|[0]'  --output text)
done