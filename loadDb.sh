#!/bin/bash
#put data in postgres
mkdir -p /opt/data
psql -U postgres -d postgres -a -f /opt/data/create_user.sql
psql -U postgres -d postgres -a -f /opt/data/create_database.sql
psql -U ecr_user -d ecr < /opt/data/create_schema.sql
if [[ $ECR_USER_PASSWORD ]]; then
  psql -c "ALTER USER ecr_user PASSWORD '$ECR_USER_PASSWORD';"
fi
#psql -U ecr_user -d ecr < /opt/data/ecrdb.bk
rm -rf /opt/data/*
