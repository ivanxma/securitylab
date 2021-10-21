export MYSQL_HOME=/usr/local/mysql
export SHELL_HOME=/usr/local/shell
export ROUTER=/usr/local/router
export PATH=$MYSQL_HOME/bin:$SHELL_HOME/bin:$ROUTER/bin:$PATH
export LD_LIBRARY_PATH=$ROUTER/lib:$ROUTER/lib/mysqlrouter:$LD_LIBRARY_PATH

export BRIDGE_HOST=$HOSTNAME
export BRIDGE_CHANNEL=channel1
export BRIDGE_DRCHANNEL=drchannel1
export CLUSTER_HOST=$HOSTNAME
export CLUSTER_IPALLOWLIST=10.0.0.0/16
export SECONDARY_HOST=$HOSTNAME
export PRIMARY_HOST=$HOSTNAME


