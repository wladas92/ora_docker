# Constant PDB_NAME - valid for 23cfree, 23aifree
readonly PDB_NAME="FREEPDB1"

# Start the timer
start_time=$(date +%s)

# Get APEX
curl -o apex-latest.zip https://download.oracle.com/otn_software/apex/apex-latest.zip

# Enter APEX Folder
unzip -q apex-latest.zip
rm apex-latest.zip
cd apex

# Configuring REST
sqlplus / as sysdba <<EOF
ALTER SESSION SET CONTAINER = $PDB_NAME;
@apex_rest_config.sql
EXIT;
E
E
EOF