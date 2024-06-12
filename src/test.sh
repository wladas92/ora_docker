# Configuring REST
sqlplus / as sysdba <<EOF
ALTER SESSION SET CONTAINER = FREEPDB1;
@apex_rest_config.sql
EXIT;
E
E
EOF