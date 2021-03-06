#!/bin/sh


# ./odoo/odoo-bin.py -c odoo/config/local.conf

if [ $1 = "start" ]; then
    ./odoo/odoo-bin -c config/local.conf

elif [ $1 = "start_dev" ]; then
    ./odoo/odoo-bin -c config/local.conf --dev=reload

elif [ $1 = "startwithport" ]; then
    ./odoo/odoo-bin -c config/local.conf --xmlrpc-port=$2

elif [ $1 = "upgradewithport" ]; then
    ./odoo/odoo-bin -c config/local.conf --xmlrpc-port=$2  -u $3 -d $4

elif [ $1 = "serverstart" ]; then
    ./odoo/odoo-bin -c config/server.conf

elif [ $1 = "--help" ]; then
    echo "=================================OPTIONS ============================"
    echo "      Run command line 'sh odoo.sh [option]' with options below:"
    echo "      [start]                                       Start Odoo with default port in file config."
    echo "      - Ex: sh odoo.sh start"
    echo "      [upgrade MODULE_NAME DB_NAME]                 Upgrade Odoo with module and database."
    echo "      - Ex: sh odoo.sh upgrade base db_demo"
    echo "      [startwithport PORT]                          Start Odoo with port define."
    echo "      - Ex: sh odoo.sh startwithport 8069"
    echo "      [upgradewithport PORT MODULE_NAME DB_NAME]    upgrade Odoo with port define."
    echo "      - Ex: sh odoo.sh upgradewithport 8069 base db_demo"
    echo "      [serverstart]    start Odoo on server."
    echo "      - Ex: sh odoo.sh serverstart"
    echo "      [--help]                                      Show more options."
    echo "================================ END ================================"

else [ $1 = "upgrade" ]
    ./odoo/odoo-bin -c config/local.conf -u $2 -d $3
fi
