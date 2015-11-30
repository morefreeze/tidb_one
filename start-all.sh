#!/bin/bash
$HBASE_PATH/bin/start-hbase.sh && sleep 20 && $GOPATH/bin/tidb-server -store hbase -path localhost/testdb
