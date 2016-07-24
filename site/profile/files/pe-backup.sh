#!/bin/bash

#
# PE Backup Script

# Define our paths to tar up
PATHS="/etc/puppetlabs/ /opt/puppetlabs/puppet/modules /opt/puppetlabs/server/data/console-services/certs /opt/puppetlabs/server/data/postgresql/9.4/data/certs /etc/puppetlabs/puppetserver/conf.d/"

# Pull a unique name for the backup file
DATE=`date +"%m-%d-%y"`

# Move into the tmp folder
cd /tmp

# Tar up the files..

tar -zvcf pe-backup_${DATE}.tar.gz $PATHS

# For an added touch lets dump the database too :)

sudo -u pe-postgres /opt/puppetlabs/server/apps/postgresql/bin/pg_dumpall -c -f puppetdb_backup_${DATE}.sql

