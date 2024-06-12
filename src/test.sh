# Constant PDB_NAME - valid for 23cfree, 23aifree
readonly PDB_NAME="FREEPDB1"

# Start the timer
start_time=$(date +%s)

cd apex

# Configuring REST
sqlplus / as sysdba <<EOF
ALTER SESSION SET CONTAINER = $PDB_NAME;
@apex_rest_config.sql
E
E
EXIT;
EOF