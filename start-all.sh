#!/bin/bash
$HBASE_PATH/bin/start-hbase.sh && \
    echo "Sleep a while to wait hbase start completely... \n" && \
    sleep 30 && $GOPATH/bin/tidb-server -store hbase -L error -path localhost/testdb
