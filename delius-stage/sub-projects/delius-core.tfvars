# delius-stage  delius-core.tfvar
## Delius Core Specific

egress_443 = true
egress_80 = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 200 # Do not decrease this
  # total_storage  = 400 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "STGNDA"
  database_sid                  = "STGNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset         = "AL32UTF8"
  database_bootstrap_restore    = "True" # whether primary db has db restore on bootstrap
  database_backup               = "dbbackup/dev/delius" # path in S3 to directory backup files
  database_backup_sys_passwd    = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location      = "/u01/backup" #default for local testing
  oracle_dbca_template_file     = "database"
}

# LDAP
instance_type_ldap = "m5.xlarge"
ansible_vars_apacheds = {
  jvm_mem_args = "12228"  # (in MB)
}

# WebLogic
instance_type_weblogic = "m5.xlarge"
instance_count_weblogic_ndelius = "15"
ansible_vars = {
  jvm_mem_args = "-Xms12g -Xmx12g"
  database_sid = "STGNDA"
  nomis_url = "https://gateway.preprod.nomis-api.hmpps.dsd.io/elite2api"
}

env_user_access_cidr_blocks = []

# DSS Batch Task
dss_job_envvars = [
  {
    "name" = "DSS_TESTMODE"
    "value" =  "true"
  },
  {
    "name" = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  },
  {
    "name" = "DSS_ENVIRONMENT"
    "value" = "delius-stage"
  },
  {
    "name" = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.stage.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name" = "DSS_PROJECT"
    "value" = "delius"
  }
]