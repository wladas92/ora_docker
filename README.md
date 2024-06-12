# About this Repository

This repository is alternative for "Single Step Oracle 23c DB + APEX Docker Container" run. It contains copy of [pretius-23cfree-unattended-apex-installer](https://github.com/Pretius/pretius-23cfree-unattended-apex-installer) with small changes. These changes are not that they did it wrong or it needs to be fixed - it is just my opinion to do some stuff in other way.

Big thanks for original code to guys from Pretius and original blogpost [Single Step Oracle 23c DB + APEX Docker Container](https://mattmulvaney.hashnode.dev/single-step-oracle-23c-db-apex-docker-container). I just "borrowed" and slightly modified code from Pretius GitHub repository

# Where are the changes

If you decide to use these scripts instead of original ones, there are some minor changes in comparison to orgiginal:

- PDB name as constant - not strict need for FREEPDB1
- APEX profile (no password expiration policy)
- APEX tablespace (not installing to sysaux)
- Configuring REST (calling @apex_rest_config.sql)
- renamed files to make them shorter and more global (no `23c` in filenames, etc)

# How to run

Read original blogpost or just try something like this replacing container_name with your value (like `23aifree`):

```
docker create -it --name container_name -p 1521:1521 -p 5500:5500 -p 8080:8080 -p 8443:8443 -p 8022:22 -e ORACLE_PWD=E container-registry.oracle.com/database/free:latest
curl -o install_apex_ords.sh https://raw.githubusercontent.com/wladas92/ora_docker/main/src/install_apex_ords.sh
curl -o 00_start_apex_ords.sh https://raw.githubusercontent.com/wladas92/ora_docker/main/src/00_start_apex_ords.sh
docker cp install_apex_ords.sh container_name:/home/oracle
docker cp 00_start_apex_ords.sh container_name:/opt/oracle/scripts/startup
docker start container_name
```

When all is allright, APEX should be availible on [http://localhost:8023/ords/apex](http://localhost:8023/ords/apex).
