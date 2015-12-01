#!/bin/bash
$HBASE_PATH/bin/start-hbase.sh && \
    echo "Sleep a while to wait hbase start completely..." && \
    sleep 30 && $GOPATH/bin/tidb-server -store hbase -L error -path localhost/testdb
