#!/bin/bash
# create the database
aws rds create-db-instance \
    --db-instance-identifier qt-mysql-instance \
    --db-instance-class db.t3.micro \
    --engine mysql \
    --master-username admin \
    --master-user-password secret99 \
    --allocated-storage 20
# wait till the database is created
endpoint=$(aws rds describe-db-instances \
    --db-instance-identifier qt-mysql-instance \
    --query "DBInstances[].Endpoint.Address" \
    --output text)

# delete the database
aws rds delete-db-instance \
    --db-instance-identifier qt-mysql-instance \
    --skip-final-snapshot \
    --delete-automated-backups