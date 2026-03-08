-- @formatter:off
SHOW APPS;
SHOW CLUSTER;
SHOW CLUSTER ALIVE;
SHOW CLUSTER MACHINES;
SHOW CONNECTIONS;
SHOW CONSUMERS;
SHOW CREATE DATABASE db_name;
SHOW CREATE STABLE stb_name;
SHOW CREATE STABLE db_name.stb_name;
SHOW CREATE TABLE tb_name;
SHOW CREATE TABLE db_name.tb_name;
SHOW DATABASES;
SHOW USER DATABASES;
SHOW SYSTEM DATABASES;
SHOW DNODES;
SHOW FUNCTIONS;
SHOW LICENCES;
SHOW GRANTS;
SHOW GRANTS FULL;
SHOW INDEXES FROM tb_name;
SHOW INDEXES FROM db_name.tb_name;
SHOW INDEXES FROM tb_name;
SHOW INDEXES FROM db_name.tb_name;
SHOW LOCAL VARIABLES;
SHOW LOCAL VARIABLES LIKE 'pattern';
SHOW MNODES;
SHOW QNODES;
SHOW QUERIES;
SHOW SCORES;
SHOW STABLES LIKE 'pattern';
SHOW db_name.STABLES LIKE 'pattern';
SHOW STABLES;
SHOW db_name.STABLES;
SHOW STREAMS;
SHOW db_name.STREAMS;
SHOW SUBSCRIPTIONS;
SHOW NORMAL TABLES LIKE 'pattern';
SHOW CHILD TABLES LIKE 'pattern';
SHOW NORMAL db_name.TABLES LIKE 'pattern';
SHOW CHILD db_name.TABLES LIKE 'pattern';
SHOW NORMAL TABLES;
SHOW CHILD TABLES;
SHOW NORMAL db_name.TABLES;
SHOW CHILD db_name.TABLES;
SHOW TABLE DISTRIBUTED TABLE_NAME;
SHOW TAGS FROM child_table_name;
SHOW TAGS FROM db_name.child_table_name;
SHOW TAGS FROM child_table_name;
SHOW TAGS FROM db_name.child_table_name;
SHOW TOPICS;
SHOW TRANSACTIONS;
SHOW TRANSACTION transaction_id;
SHOW USERS;
SHOW CLUSTER VARIABLES;
SHOW CLUSTER VARIABLES LIKE 'pattern';
SHOW DNODE dnode_id VARIABLES;
SHOW DNODE dnode_id VARIABLES LIKE 'pattern';
SHOW VGROUPS;
SHOW db_name.VGROUPS;
SHOW VNODES;
SHOW VNODES ON DNODE dnode_id;
CREATE DATABASE db_name;
CREATE DATABASE IF NOT EXISTS db_name;
CREATE DATABASE db_name VGROUPS 2;
CREATE DATABASE IF NOT EXISTS db_name VGROUPS 2;
CREATE DATABASE db_name PRECISION 'ms';
CREATE DATABASE db_name PRECISION 'us';
CREATE DATABASE db_name PRECISION 'ns';
CREATE DATABASE IF NOT EXISTS db_name PRECISION 'ms';
CREATE DATABASE IF NOT EXISTS db_name PRECISION 'us';
CREATE DATABASE IF NOT EXISTS db_name PRECISION 'ns';
CREATE DATABASE db_name REPLICA 1;
CREATE DATABASE IF NOT EXISTS db_name REPLICA 1;
CREATE DATABASE db_name BUFFER 256;
CREATE DATABASE IF NOT EXISTS db_name BUFFER 256;
CREATE DATABASE db_name PAGES 64;
CREATE DATABASE IF NOT EXISTS db_name PAGES 64;
CREATE DATABASE db_name PAGESIZE 4096;
CREATE DATABASE IF NOT EXISTS db_name PAGESIZE 4096;
CREATE DATABASE db_name CACHEMODEL 'none';
CREATE DATABASE db_name CACHEMODEL 'last_row';
CREATE DATABASE db_name CACHEMODEL 'last_value';
CREATE DATABASE db_name CACHEMODEL 'both';
CREATE DATABASE IF NOT EXISTS db_name CACHEMODEL 'none';
CREATE DATABASE IF NOT EXISTS db_name CACHEMODEL 'last_row';
CREATE DATABASE IF NOT EXISTS db_name CACHEMODEL 'last_value';
CREATE DATABASE IF NOT EXISTS db_name CACHEMODEL 'both';
CREATE DATABASE db_name CACHESIZE 128;
CREATE DATABASE IF NOT EXISTS db_name CACHESIZE 128;
CREATE DATABASE db_name COMP 0;
CREATE DATABASE db_name COMP 1;
CREATE DATABASE db_name COMP 2;
CREATE DATABASE IF NOT EXISTS db_name COMP 0;
CREATE DATABASE IF NOT EXISTS db_name COMP 1;
CREATE DATABASE IF NOT EXISTS db_name COMP 2;
CREATE DATABASE db_name DURATION 30;
CREATE DATABASE IF NOT EXISTS db_name DURATION 30;
CREATE DATABASE db_name MAXROWS 100000;
CREATE DATABASE IF NOT EXISTS db_name MAXROWS 100000;
CREATE DATABASE db_name MINROWS 100;
CREATE DATABASE IF NOT EXISTS db_name MINROWS 100;
CREATE DATABASE db_name KEEP 3650;
CREATE DATABASE IF NOT EXISTS db_name KEEP 3650;
CREATE DATABASE db_name KEEP_TIME_OFFSET 0;
CREATE DATABASE IF NOT EXISTS db_name KEEP_TIME_OFFSET 0;
CREATE DATABASE db_name STT_TRIGGER 1;
CREATE DATABASE IF NOT EXISTS db_name STT_TRIGGER 1;
CREATE DATABASE db_name SINGLE_STABLE 0;
CREATE DATABASE db_name SINGLE_STABLE 1;
CREATE DATABASE IF NOT EXISTS db_name SINGLE_STABLE 0;
CREATE DATABASE IF NOT EXISTS db_name SINGLE_STABLE 1;
CREATE DATABASE db_name TABLE_PREFIX 16;
CREATE DATABASE IF NOT EXISTS db_name TABLE_PREFIX 16;
CREATE DATABASE db_name TABLE_SUFFIX 16;
CREATE DATABASE IF NOT EXISTS db_name TABLE_SUFFIX 16;
CREATE DATABASE db_name DNODES 3;
CREATE DATABASE IF NOT EXISTS db_name DNODES 3;
CREATE DATABASE db_name TSDB_PAGESIZE 16384;
CREATE DATABASE IF NOT EXISTS db_name TSDB_PAGESIZE 16384;
CREATE DATABASE db_name WAL_LEVEL 1;
CREATE DATABASE db_name WAL_LEVEL 2;
CREATE DATABASE IF NOT EXISTS db_name WAL_LEVEL 1;
CREATE DATABASE IF NOT EXISTS db_name WAL_LEVEL 2;
CREATE DATABASE db_name WAL_FSYNC_PERIOD 3000;
CREATE DATABASE IF NOT EXISTS db_name WAL_FSYNC_PERIOD 3000;
CREATE DATABASE db_name WAL_RETENTION_PERIOD 86400;
CREATE DATABASE IF NOT EXISTS db_name WAL_RETENTION_PERIOD 86400;
CREATE DATABASE db_name WAL_RETENTION_SIZE 1048576;
CREATE DATABASE IF NOT EXISTS db_name WAL_RETENTION_SIZE 1048576;
CREATE DATABASE db_name COMPACT_INTERVAL 600;
CREATE DATABASE IF NOT EXISTS db_name COMPACT_INTERVAL 600;
CREATE DATABASE db_name COMPACT_TIME_RANGE 3600;
CREATE DATABASE IF NOT EXISTS db_name COMPACT_TIME_RANGE 3600;
CREATE DATABASE db_name COMPACT_TIME_OFFSET 0;
CREATE DATABASE IF NOT EXISTS db_name COMPACT_TIME_OFFSET 0;
CREATE DATABASE db_name SS_KEEPLOCAL 1;
CREATE DATABASE IF NOT EXISTS db_name SS_KEEPLOCAL 1;
CREATE DATABASE db_name SS_CHUNKPAGES 64;
CREATE DATABASE IF NOT EXISTS db_name SS_CHUNKPAGES 64;
CREATE DATABASE db_name SS_COMPACT 1;
CREATE DATABASE IF NOT EXISTS db_name SS_COMPACT 1;
CREATE DATABASE db_name VGROUPS 2 REPLICA 1;
CREATE DATABASE IF NOT EXISTS db_name VGROUPS 2 REPLICA 1;
CREATE DATABASE db_name PRECISION 'ms' REPLICA 1 WAL_LEVEL 1;
CREATE DATABASE IF NOT EXISTS db_name PRECISION 'us' REPLICA 2 WAL_LEVEL 2;
CREATE DATABASE db_name BUFFER 256 PAGES 64 PAGESIZE 4096 TSDB_PAGESIZE 16384;
CREATE DATABASE db_name CACHEMODEL 'both' CACHESIZE 128;
CREATE DATABASE db_name KEEP 3650 KEEP_TIME_OFFSET 0 DURATION 30;
CREATE DATABASE db_name SINGLE_STABLE 1 TABLE_PREFIX 16 TABLE_SUFFIX 16;
CREATE DATABASE db_name WAL_LEVEL 2 WAL_FSYNC_PERIOD 3000 WAL_RETENTION_PERIOD 86400 WAL_RETENTION_SIZE 1048576;
CREATE DATABASE db_name COMPACT_INTERVAL 600 COMPACT_TIME_RANGE 3600 COMPACT_TIME_OFFSET 0;
CREATE DATABASE db_name SS_KEEPLOCAL 1 SS_CHUNKPAGES 64 SS_COMPACT 1;
CREATE DATABASE db_name
    VGROUPS 2
    PRECISION 'ns'
    REPLICA 1
    BUFFER 256
    PAGES 64
    PAGESIZE 4096
    CACHEMODEL 'last_value'
    CACHESIZE 128
    COMP 2
    DURATION 30
    MAXROWS 100000
    MINROWS 100
    KEEP 3650
    KEEP_TIME_OFFSET 0
    STT_TRIGGER 1
    SINGLE_STABLE 1
    TABLE_PREFIX 16
    TABLE_SUFFIX 16
    DNODES 3
    TSDB_PAGESIZE 16384
    WAL_LEVEL 2
    WAL_FSYNC_PERIOD 3000
    WAL_RETENTION_PERIOD 86400
    WAL_RETENTION_SIZE 1048576
    COMPACT_INTERVAL 600
    COMPACT_TIME_RANGE 3600
    COMPACT_TIME_OFFSET 0
    SS_KEEPLOCAL 1
    SS_CHUNKPAGES 64
    SS_COMPACT 1;
CREATE DATABASE IF NOT EXISTS db_name
    VGROUPS 2
    PRECISION 'ms'
    REPLICA 1
    BUFFER 256
    PAGES 64
    PAGESIZE 4096
    CACHEMODEL 'both'
    CACHESIZE 128
    COMP 1
    DURATION 30
    MAXROWS 100000
    MINROWS 100
    KEEP 3650
    KEEP_TIME_OFFSET 0
    STT_TRIGGER 1
    SINGLE_STABLE 0
    TABLE_PREFIX 16
    TABLE_SUFFIX 16
    DNODES 3
    TSDB_PAGESIZE 16384
    WAL_LEVEL 1
    WAL_FSYNC_PERIOD 3000
    WAL_RETENTION_PERIOD 86400
    WAL_RETENTION_SIZE 1048576
    COMPACT_INTERVAL 600
    COMPACT_TIME_RANGE 3600
    COMPACT_TIME_OFFSET 0
    SS_KEEPLOCAL 1
    SS_CHUNKPAGES 64
    SS_COMPACT 1;
USE db_name;
DROP DATABASE db_name;
DROP DATABASE IF EXISTS db_name;
ALTER DATABASE db_name;
ALTER DATABASE db_name CACHEMODEL 'none';
ALTER DATABASE db_name CACHEMODEL 'last_row';
ALTER DATABASE db_name CACHEMODEL 'last_value';
ALTER DATABASE db_name CACHEMODEL 'both';
ALTER DATABASE db_name CACHESIZE 128;
ALTER DATABASE db_name BUFFER 256;
ALTER DATABASE db_name PAGES 64;
ALTER DATABASE db_name REPLICA 1;
ALTER DATABASE db_name STT_TRIGGER 1;
ALTER DATABASE db_name WAL_LEVEL 1;
ALTER DATABASE db_name WAL_LEVEL 2;
ALTER DATABASE db_name WAL_FSYNC_PERIOD 3000;
ALTER DATABASE db_name KEEP 3650;
ALTER DATABASE db_name WAL_RETENTION_PERIOD 86400;
ALTER DATABASE db_name WAL_RETENTION_SIZE 1048576;
ALTER DATABASE db_name MINROWS 100;
ALTER DATABASE db_name COMPACT_INTERVAL 600;
ALTER DATABASE db_name COMPACT_TIME_RANGE 3600;
ALTER DATABASE db_name COMPACT_TIME_OFFSET 0;
ALTER DATABASE db_name CACHEMODEL 'both' CACHESIZE 128;
ALTER DATABASE db_name BUFFER 256 PAGES 64;
ALTER DATABASE db_name REPLICA 1 WAL_LEVEL 1 WAL_FSYNC_PERIOD 3000;
ALTER DATABASE db_name KEEP 3650 MINROWS 100;
ALTER DATABASE db_name WAL_RETENTION_PERIOD 86400 WAL_RETENTION_SIZE 1048576;
ALTER DATABASE db_name COMPACT_INTERVAL 600 COMPACT_TIME_RANGE 3600 COMPACT_TIME_OFFSET 0;
ALTER DATABASE db_name
    CACHEMODEL 'last_value'
    CACHESIZE 128
    BUFFER 256
    PAGES 64
    REPLICA 1
    STT_TRIGGER 1
    WAL_LEVEL 2
    WAL_FSYNC_PERIOD 3000
    KEEP 3650
    WAL_RETENTION_PERIOD 86400
    WAL_RETENTION_SIZE 1048576
    MINROWS 100
    COMPACT_INTERVAL 600
    COMPACT_TIME_RANGE 3600
    COMPACT_TIME_OFFSET 0;
TRIM DATABASE db_name;
TRIM DATABASE db_name WAL;
FLUSH DATABASE db_name;
REDISTRIBUTE VGROUP vgroup_no DNODE dnode_id1;
REDISTRIBUTE VGROUP vgroup_no DNODE dnode_id1 DNODE dnode_id2;
REDISTRIBUTE VGROUP vgroup_no DNODE dnode_id1 DNODE dnode_id2 DNODE dnode_id3;
BALANCE VGROUP LEADER;
SHOW db_name.ALIVE;
CREATE TABLE tb_name (col_name TIMESTAMP);
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP);
CREATE TABLE db_name.tb_name (col_name TIMESTAMP);
CREATE TABLE IF NOT EXISTS db_name.tb_name (col_name TIMESTAMP);
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE IF NOT EXISTS tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE db_name.tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE IF NOT EXISTS db_name.tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY);
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b');
CREATE TABLE tb_name (col_name TIMESTAMP COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPOSITE KEY,
    col_name3 TIMESTAMP ENCODE 'simple8b',
    col_name4 TIMESTAMP COMPRESS 'lz4',
    col_name5 TIMESTAMP LEVEL 'h'
);
CREATE TABLE tb_name (col_name TIMESTAMP) COMMENT 'string_value';
CREATE TABLE tb_name (col_name TIMESTAMP) SMA(col_name);
CREATE TABLE tb_name (col_name TIMESTAMP) SMA(col_name1, col_name2);
CREATE TABLE tb_name (col_name TIMESTAMP) TTL 100;
CREATE TABLE tb_name (col_name TIMESTAMP) COMMENT 'string_value' SMA(col_name);
CREATE TABLE tb_name (col_name TIMESTAMP) COMMENT 'string_value' TTL 100;
CREATE TABLE tb_name (col_name TIMESTAMP) SMA(col_name) TTL 100;
CREATE TABLE tb_name (col_name TIMESTAMP) COMMENT 'string_value' SMA(col_name) TTL 100;
CREATE TABLE db_name.tb_name (col_name TIMESTAMP) COMMENT 'string_value';
CREATE TABLE db_name.tb_name (col_name TIMESTAMP) SMA(col_name);
CREATE TABLE db_name.tb_name (col_name TIMESTAMP) TTL 100;
CREATE TABLE IF NOT EXISTS db_name.tb_name (col_name TIMESTAMP) COMMENT 'string_value' SMA(col_name) TTL 100;
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP
);
CREATE TABLE IF NOT EXISTS tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP
);
CREATE TABLE db_name.tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP
);
CREATE TABLE IF NOT EXISTS db_name.tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP
);
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
);
CREATE TABLE tb_name (
    col_name1 TIMESTAMP COMPOSITE KEY,
    col_name2 TIMESTAMP ENCODE 'simple8b'
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
)
COMMENT 'string_value';
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPRESS 'lz4'
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
)
SMA(col_name1);
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP LEVEL 'h'
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
)
TTL 100;
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
)
COMMENT 'string_value'
SMA(col_name1, col_name2)
TTL 100;
CREATE TABLE stb_name USING super_tb TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS stb_name USING super_tb TAGS (tag_value1);
CREATE TABLE db_name.tb_name USING stb_name TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS db_name.tb_name USING stb_name TAGS (tag_value1);
CREATE TABLE tb_name USING db_name.stb_name TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS tb_name USING db_name.stb_name TAGS (tag_value1);
CREATE TABLE db_name.tb_name USING db_name.stb_name TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS db_name.tb_name USING db_name.stb_name TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE db_name.tb_name USING db_name.stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE db_name.tb_name USING db_name.stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS db_name.tb_name USING db_name.stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS db_name.tb_name USING db_name.stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE tb_name USING stb_name TAGS (tag_value1)
tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name TAGS (tag_value1)
IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE db_name.tb_name USING db_name.stb_name (tag_name1) TAGS (tag_value1)
db_name.tb_name2 USING db_name.stb_name (tag_name1) TAGS (tag_value2);
CREATE TABLE IF NOT EXISTS db_name.tb_name USING db_name.stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2)
IF NOT EXISTS db_name.tb_name2 USING db_name.stb_name (tag_name1, tag_name2) TAGS (tag_value3, tag_value4);
CREATE TABLE tb_name (col_name TIMESTAMP);
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP);
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE IF NOT EXISTS tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
);
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY);
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b');
CREATE TABLE tb_name (col_name TIMESTAMP COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY);
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP ENCODE 'simple8b');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPRESS 'lz4');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE IF NOT EXISTS tb_name (col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h');
CREATE TABLE tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPOSITE KEY,
    col_name3 TIMESTAMP ENCODE 'simple8b',
    col_name4 TIMESTAMP COMPRESS 'lz4',
    col_name5 TIMESTAMP LEVEL 'h'
);
CREATE TABLE IF NOT EXISTS tb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPOSITE KEY,
    col_name3 TIMESTAMP ENCODE 'simple8b',
    col_name4 TIMESTAMP COMPRESS 'lz4',
    col_name5 TIMESTAMP LEVEL 'h'
);
CREATE TABLE tb_name USING stb_name TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name TAGS (tag_value1, tag_value2);
CREATE TABLE tb_name USING stb_name TAGS (tag_value1, tag_value2, tag_value3);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name TAGS (tag_value1, tag_value2, tag_value3);
CREATE TABLE tb_name USING stb_name TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE tb_name USING stb_name (tag_name1, tag_name2, tag_name3) TAGS (tag_value1, tag_value2, tag_value3);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1, tag_name2, tag_name3) TAGS (tag_value1, tag_value2, tag_value3);
CREATE TABLE tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2);
CREATE TABLE IF NOT EXISTS tb_name USING stb_name (tag_name1) TAGS (tag_value1);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1) tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1) tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1, tag_value2) tb_name2 USING stb_name TAGS (tag_value3, tag_value4);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1, tag_value2) tb_name2 USING stb_name TAGS (tag_value3, tag_value4);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1, tag_value2) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value3, tag_value4);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1, tag_value2) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value3, tag_value4);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1) tb_name2 USING stb_name TAGS (tag_value2) tb_name3 USING stb_name TAGS (tag_value3);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1) tb_name2 USING stb_name TAGS (tag_value2) tb_name3 USING stb_name TAGS (tag_value3);
CREATE TABLE tb_name1 USING stb_name TAGS (tag_value1) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2) IF NOT EXISTS tb_name3 USING stb_name TAGS (tag_value3);
CREATE TABLE IF NOT EXISTS tb_name1 USING stb_name TAGS (tag_value1) IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2) IF NOT EXISTS tb_name3 USING stb_name TAGS (tag_value3);
CREATE TABLE
  tb_name1 USING stb_name TAGS (tag_value1)
  IF NOT EXISTS tb_name2 USING stb_name TAGS (tag_value2);
CREATE TABLE USING stb_name (field1_name, field2_name) FILE 'data.csv';
CREATE TABLE IF NOT EXISTS USING db_name.stb_name (field1_name) FILE 'data.csv';
CREATE TABLE USING stb_name (field1_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING stb_name (field1_name) FILE 'csv_file_path';
CREATE TABLE USING db_name.stb_name (field1_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING db_name.stb_name (field1_name) FILE 'csv_file_path';
CREATE TABLE USING stb_name (field1_name, field2_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING stb_name (field1_name, field2_name) FILE 'csv_file_path';
CREATE TABLE USING db_name.stb_name (field1_name, field2_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING db_name.stb_name (field1_name, field2_name) FILE 'csv_file_path';
CREATE TABLE USING stb_name (field1_name, field2_name, field3_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING stb_name (field1_name, field2_name, field3_name) FILE 'csv_file_path';
CREATE TABLE USING db_name.stb_name (field1_name, field2_name, field3_name) FILE 'csv_file_path';
CREATE TABLE IF NOT EXISTS USING db_name.stb_name (field1_name, field2_name, field3_name) FILE 'csv_file_path';
ALTER TABLE tb_name TTL 100;
ALTER TABLE db_name.tb_name TTL 100;
ALTER TABLE tb_name COMMENT 'string_value';
ALTER TABLE db_name.tb_name COMMENT 'string_value';
ALTER TABLE tb_name TTL 100 COMMENT 'string_value';
ALTER TABLE db_name.tb_name TTL 100 COMMENT 'string_value';
ALTER TABLE tb_name COMMENT 'string_value' TTL 100;
ALTER TABLE db_name.tb_name COMMENT 'string_value' TTL 100;
ALTER TABLE tb_name ADD COLUMN col_name TIMESTAMP;
ALTER TABLE db_name.tb_name ADD COLUMN col_name TIMESTAMP;
ALTER TABLE tb_name DROP COLUMN col_name;
ALTER TABLE db_name.tb_name DROP COLUMN col_name;
ALTER TABLE tb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER TABLE db_name.tb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER TABLE tb_name RENAME COLUMN old_col_name new_col_name;
ALTER TABLE db_name.tb_name RENAME COLUMN old_col_name new_col_name;
ALTER TABLE tb1 TTL 10 COMMENT 'x';
ALTER TABLE db1.tb1 ADD COLUMN c1 INT;
ALTER TABLE tb1 DROP COLUMN c1;
ALTER TABLE tb1 MODIFY COLUMN c1 BIGINT;
ALTER TABLE tb1 RENAME COLUMN c1 c2;
ALTER TABLE tb_name ADD COLUMN field_name TIMESTAMP;
ALTER TABLE tb_name SET TAG tag_name = 1;
ALTER TABLE tb_name SET TAG tag_name = 'x', tag_name2 = 2;
ALTER TABLE db_name.tb_name SET TAG tag_name = NULL;
ALTER TABLE tb_name TTL 100;
ALTER TABLE db_name.tb_name TTL 100;
ALTER TABLE tb_name COMMENT 'string_value';
ALTER TABLE db_name.tb_name COMMENT 'string_value';
ALTER TABLE tb_name TTL 100 COMMENT 'string_value';
ALTER TABLE db_name.tb_name TTL 100 COMMENT 'string_value';
ALTER TABLE tb_name COMMENT 'string_value' TTL 100;
ALTER TABLE db_name.tb_name COMMENT 'string_value' TTL 100;
ALTER TABLE tb_name SET TAG tag_name = new_tag_value;
ALTER TABLE db_name.tb_name SET TAG tag_name = new_tag_value;
ALTER TABLE tb_name SET TAG tag_name = new_tag_value, tag_name2 = new_tag2_value;
ALTER TABLE db_name.tb_name SET TAG tag_name = new_tag_value, tag_name2 = new_tag2_value;
ALTER TABLE tb_name SET TAG tag_name = new_tag_value, tag_name2 = new_tag2_value, tag_name3 = new_tag3_value;
ALTER TABLE db_name.tb_name SET TAG tag_name = new_tag_value, tag_name2 = new_tag2_value, tag_name3 = new_tag3_value;
ALTER TABLE tb_name SET TAG tag_name1 = new_tag_value1;
ALTER TABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2;
ALTER TABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2, tag_name3 = new_tag_value3;
DROP TABLE tb_name;
DROP TABLE IF EXISTS tb_name;
DROP TABLE db_name.tb_name;
DROP TABLE IF EXISTS db_name.tb_name;
DROP TABLE tb_name, tb_name2;
DROP TABLE IF EXISTS tb_name, tb_name2;
DROP TABLE tb_name, IF EXISTS tb_name2;
DROP TABLE IF EXISTS tb_name, IF EXISTS tb_name2;
DROP TABLE db_name.tb_name, db_name.tb_name2;
DROP TABLE IF EXISTS db_name.tb_name, db_name.tb_name2;
DROP TABLE db_name.tb_name, IF EXISTS db_name.tb_name2;
DROP TABLE IF EXISTS db_name.tb_name, IF EXISTS db_name.tb_name2;
DROP TABLE tb_name, db_name.tb_name2;
DROP TABLE IF EXISTS tb_name, db_name.tb_name2;
DROP TABLE tb_name, IF EXISTS db_name.tb_name2;
DROP TABLE IF EXISTS tb_name, IF EXISTS db_name.tb_name2;
DROP TABLE tb_name, tb_name2, tb_name3;
DROP TABLE IF EXISTS tb_name, tb_name2, tb_name3;
DROP TABLE tb_name, IF EXISTS tb_name2, IF EXISTS tb_name3;
DROP TABLE IF EXISTS tb_name, IF EXISTS tb_name2, IF EXISTS tb_name3;
DROP TABLE db_name.tb_name, db_name.tb_name2, db_name.tb_name3;
DROP TABLE IF EXISTS db_name.tb_name, db_name.tb_name2, db_name.tb_name3;
DROP TABLE db_name.tb_name, IF EXISTS db_name.tb_name2, IF EXISTS db_name.tb_name3;
DROP TABLE IF EXISTS db_name.tb_name, IF EXISTS db_name.tb_name2, IF EXISTS db_name.tb_name3;
ALTER TABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2;
ALTER TABLE tb_name SET TAG tag_name1=new_tag_value1, tag_name2=new_tag_value2;
ALTER TABLE tb_name TTL 10;
ALTER TABLE db_name.tb_name TTL 3650;
ALTER TABLE tb_name COMMENT 'string_value';
ALTER TABLE db_name.tb_name COMMENT 'string_value';
DROP TABLE tb_name;
DROP TABLE IF EXISTS tb_name;
DROP TABLE db_name.tb_name, IF EXISTS db2.tb2;
SHOW TABLES;
SHOW TABLES LIKE 'pattern';
SHOW CREATE TABLE tb_name;
DESCRIBE tb_name;
DESCRIBE db_name.tb_name;
CREATE STABLE stb1 (ts TIMESTAMP, v INT) TAGS (t1 INT);
CREATE STABLE IF NOT EXISTS stb1 (ts TIMESTAMP, v INT) TAGS (t1 INT) KEEP 3650;
CREATE STABLE stb1 (ts TIMESTAMP, v INT) TAGS (t1 INT) VIRTUAL 1 COMMENT 'x';
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP ENCODE 'simple8b'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP ENCODE 'simple8b'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP COMPOSITE KEY ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'h'
)
TAGS (
    tag_name TIMESTAMP
);
CREATE STABLE stb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPOSITE KEY,
    col_name3 TIMESTAMP ENCODE 'simple8b',
    col_name4 TIMESTAMP COMPRESS 'lz4',
    col_name5 TIMESTAMP LEVEL 'h'
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name1 TIMESTAMP,
    col_name2 TIMESTAMP COMPOSITE KEY,
    col_name3 TIMESTAMP ENCODE 'simple8b',
    col_name4 TIMESTAMP COMPRESS 'lz4',
    col_name5 TIMESTAMP LEVEL 'h'
)
TAGS (
    tag_name1 TIMESTAMP,
    tag_name2 TIMESTAMP
);
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value';
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
SMA(col_name);
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
SMA(col_name1, col_name2);
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
KEEP 3650;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
VIRTUAL 0;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
VIRTUAL 1;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value' SMA(col_name);
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value' KEEP 3650;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value' VIRTUAL 1;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
SMA(col_name) KEEP 3650;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
SMA(col_name) VIRTUAL 1;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
KEEP 3650 VIRTUAL 1;
CREATE STABLE stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value' SMA(col_name) KEEP 3650 VIRTUAL 1;
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value';
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
SMA(col_name);
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
KEEP 3650;
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
VIRTUAL 0;
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
VIRTUAL 1;
CREATE STABLE IF NOT EXISTS stb_name (
    col_name TIMESTAMP
)
TAGS (
    tag_name TIMESTAMP
)
COMMENT 'string_value' SMA(col_name) KEEP 3650 VIRTUAL 1;
SHOW TABLE TAGS FROM table_name;
SHOW TABLE TAGS FROM table_name FROM db_name;
SHOW STABLES;
SHOW STABLES LIKE 'pattern';
SHOW CREATE STABLE stb_name;
DESCRIBE stb_name;
DESCRIBE db_name.stb_name;
SHOW TABLE TAGS FROM table_name;
SHOW TABLE TAGS FROM db_name.table_name;
SHOW TABLE TAGS FROM table_name FROM db_name;
SHOW TAGS FROM child_table_name;
SHOW TAGS FROM db_name.child_table_name;
SHOW TAGS FROM child_table_name FROM db_name;
SHOW TAGS FROM st1s1;
DROP STABLE stb_name;
DROP STABLE IF EXISTS stb_name;
DROP STABLE db_name.stb_name;
DROP STABLE IF EXISTS db_name.stb_name;
DROP STABLE stb_name;
DROP STABLE IF EXISTS db_name.stb_name;
ALTER STABLE tb_name COMMENT 'string_value';
ALTER STABLE db_name.tb_name COMMENT 'string_value';
ALTER STABLE tb_name KEEP 3650;
ALTER STABLE db_name.tb_name KEEP 3650;
ALTER STABLE tb_name COMMENT 'string_value' KEEP 3650;
ALTER STABLE db_name.tb_name COMMENT 'string_value' KEEP 3650;
ALTER STABLE tb_name KEEP 3650 COMMENT 'string_value';
ALTER STABLE db_name.tb_name KEEP 3650 COMMENT 'string_value';
ALTER STABLE tb_name ADD COLUMN col_name TIMESTAMP;
ALTER STABLE db_name.tb_name ADD COLUMN col_name TIMESTAMP;
ALTER STABLE tb_name DROP COLUMN col_name;
ALTER STABLE db_name.tb_name DROP COLUMN col_name;
ALTER STABLE tb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER STABLE db_name.tb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER STABLE tb_name ADD TAG tag_name TIMESTAMP;
ALTER STABLE db_name.tb_name ADD TAG tag_name TIMESTAMP;
ALTER STABLE tb_name DROP TAG tag_name;
ALTER STABLE db_name.tb_name DROP TAG tag_name;
ALTER STABLE tb_name MODIFY TAG tag_name TIMESTAMP;
ALTER STABLE db_name.tb_name MODIFY TAG tag_name TIMESTAMP;
ALTER STABLE tb_name RENAME TAG old_tag_name new_tag_name;
ALTER STABLE db_name.tb_name RENAME TAG old_tag_name new_tag_name;
ALTER STABLE stb1 COMMENT 'x';
ALTER STABLE stb1 KEEP 3650;
ALTER STABLE stb1 ADD COLUMN c1 INT;
ALTER STABLE stb1 ADD TAG t1 INT;
ALTER STABLE db1.stb1 RENAME TAG t1 t2;
ALTER STABLE stb_name ADD COLUMN col_name TIMESTAMP;
ALTER STABLE stb_name DROP COLUMN col_name;
ALTER STABLE stb_name MODIFY COLUMN col_name NCHAR(20);
ALTER STABLE stb_name ADD TAG tag_name TIMESTAMP;
ALTER STABLE stb_name DROP TAG tag_name;
ALTER STABLE stb_name RENAME TAG old_tag_name new_tag_name;
ALTER STABLE stb_name MODIFY TAG tag_name NCHAR(20);
ALTER STABLE stb_name MODIFY TAG tag_name NCHAR(20);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM table_name.col_name
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM db_name.table_name.col_name
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM db_name.table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM table_name.col_name1,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM table_name.col_name1,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM db_name.table_name.col_name1,
    vtb_col_name2 TIMESTAMP FROM db_name.table_name.col_name2
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM db_name.table_name.col_name1,
    vtb_col_name2 TIMESTAMP FROM db_name.table_name.col_name2
);
CREATE VTABLE vtb_name (
  ts TIMESTAMP,
  c1 INT,
  c2 DOUBLE FROM db1.t1.col_name
);
CREATE VTABLE db_name.vtb_name (
  ts_col_name TIMESTAMP,
  vtb_col_name TIMESTAMP FROM table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
  ts_col_name TIMESTAMP,
  vtb_col_name TIMESTAMP FROM db_name.table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM table_name.col_name
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM db_name.table_name.col_name
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name TIMESTAMP FROM db_name.table_name.col_name
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM table_name.col_name1,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM table_name.col_name1,
    vtb_col_name2 TIMESTAMP
);
CREATE VTABLE db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM db_name.table_name.col_name1,
    vtb_col_name2 TIMESTAMP FROM db_name.table_name.col_name2
);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name TIMESTAMP,
    vtb_col_name1 TIMESTAMP FROM db_name.table_name.col_name1,
    vtb_col_name2 TIMESTAMP FROM db_name.table_name.col_name2
);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2
)
USING stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM db_name.table_name.col_name1,
    stb_col_name2 FROM db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    table_name.col_name2
)
USING stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM db_name.table_name.col_name1,
    db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2,
    table_name.col_name3
)
USING stb_name
TAGS (tag_value1, tag_value2, tag_value3);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2,
    stb_col_name3 FROM table_name.col_name3
)
USING stb_name
(tag_name1, tag_name2, tag_name3)
TAGS (tag_value1, tag_value2, tag_value3);
CREATE VTABLE db_name.vtb_name (
  table1.ts,
  v1 FROM table1.col_name3
) USING stb_name TAGS ('x');
CREATE VTABLE db_name.vtb_name (
  db1.t1.ts,
  stb_col_name FROM db1.t1.col_name
) USING db2.stb_name (tag1, tag2) TAGS (1, 'a');
CREATE VTABLE db_name.vtb_name (
    table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name FROM db_name.table_name.col_name
)
USING db_name.stb_name
TAGS (tag_value);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2
)
USING stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM db_name.table_name.col_name1,
    stb_col_name2 FROM db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    table_name.col_name2
)
USING stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM db_name.table_name.col_name1,
    db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    table_name.col_name1,
    table_name.col_name2,
    table_name.col_name3
)
USING stb_name
TAGS (tag_value1, tag_value2, tag_value3);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2,
    stb_col_name3 FROM table_name.col_name3
)
USING stb_name
(tag_name1, tag_name2, tag_name3)
TAGS (tag_value1, tag_value2, tag_value3);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    db_name.table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    db_name.table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    stb_col_name1 FROM db_name.table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    stb_col_name1 FROM db_name.table_name.col_name1
)
USING stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1
)
USING db_name.stb_name
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1,
    table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2
)
USING stb_name
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    db_name.table_name.col_name1,
    db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    stb_col_name1 FROM db_name.table_name.col_name1,
    stb_col_name2 FROM db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1, tag_name2)
TAGS (tag_value1, tag_value2);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1,
    table_name.col_name2
)
USING stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM db_name.table_name.ts_col,
    stb_col_name1 FROM db_name.table_name.col_name1,
    db_name.table_name.col_name2
)
USING db_name.stb_name
(tag_name1)
TAGS (tag_value1);
CREATE VTABLE db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    table_name.col_name1,
    table_name.col_name2,
    table_name.col_name3
)
USING stb_name
TAGS (tag_value1, tag_value2, tag_value3);
CREATE VTABLE IF NOT EXISTS db_name.vtb_name (
    ts_col_name FROM table_name.ts_col,
    stb_col_name1 FROM table_name.col_name1,
    stb_col_name2 FROM table_name.col_name2,
    stb_col_name3 FROM table_name.col_name3
)
USING stb_name
(tag_name1, tag_name2, tag_name3)
TAGS (tag_value1, tag_value2, tag_value3);
ALTER VTABLE vtb_name ADD COLUMN vtb_col_name TIMESTAMP;
ALTER VTABLE db_name.vtb_name ADD COLUMN vtb_col_name TIMESTAMP;
ALTER VTABLE vtb_name ADD COLUMN vtb_col_name TIMESTAMP FROM table_name.col_name;
ALTER VTABLE db_name.vtb_name ADD COLUMN vtb_col_name TIMESTAMP FROM table_name.col_name;
ALTER VTABLE vtb_name DROP COLUMN vtb_col_name;
ALTER VTABLE db_name.vtb_name DROP COLUMN vtb_col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE db_name.vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET NULL;
ALTER VTABLE db_name.vtb_name ALTER COLUMN vtb_col_name SET NULL;
ALTER VTABLE vtb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER VTABLE db_name.vtb_name MODIFY COLUMN col_name TIMESTAMP;
ALTER VTABLE vtb_name RENAME COLUMN old_col_name new_col_name;
ALTER VTABLE db_name.vtb_name RENAME COLUMN old_col_name new_col_name;
ALTER VTABLE vtb1 ADD COLUMN c1 INT;
ALTER VTABLE vtb1 ADD COLUMN c1 INT FROM t1.c1;
ALTER VTABLE vtb1 DROP COLUMN c1;
ALTER VTABLE vtb1 ALTER COLUMN c1 SET t1.c2;
ALTER VTABLE vtb1 ALTER COLUMN c1 SET NULL;
ALTER VTABLE vtb1 MODIFY COLUMN c1 BIGINT;
ALTER VTABLE vtb1 RENAME COLUMN c1 c2;
ALTER VTABLE vtb_name ADD COLUMN vtb_col_name TIMESTAMP;
ALTER VTABLE vtb_name ADD COLUMN vtb_col_name TIMESTAMP FROM db_name.table_name.col_name;
ALTER VTABLE vtb_name MODIFY COLUMN vtb_col_name NCHAR(20);
ALTER VTABLE vtb_name DROP COLUMN vtb_col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET db_name.table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET NULL;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE db_name.vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name SET TAG tag_name = new_tag_value;
ALTER VTABLE db_name.vtb_name SET TAG tag_name = new_tag_value;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET db_name.table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET NULL;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE db_name.vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name SET TAG tag_name = new_tag_value;
ALTER VTABLE db_name.vtb_name SET TAG tag_name = new_tag_value;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name SET TAG tag_name = new_tag_value;
ALTER VTABLE tb_name SET TAG tag_name1 = new_tag_value1;
ALTER VTABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2;
ALTER VTABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2, tag_name3 = new_tag_value3;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET db_name.table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET NULL;
ALTER VTABLE tb_name SET TAG tag_name1 = new_tag_value1, tag_name2 = new_tag_value2;
ALTER VTABLE tb_name SET TAG tag_name1=new_tag_value1, tag_name2=new_tag_value2;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET db_name.table_name.col_name;
ALTER VTABLE vtb_name ALTER COLUMN vtb_col_name SET NULL;
DROP VTABLE dbname.vtb_name;
DROP VTABLE IF EXISTS dbname.vtb_name;
SHOW VTABLES;
SHOW VTABLES LIKE 'pattern';
SHOW db_name.VTABLES;
SHOW db_name.VTABLES LIKE 'pattern';
SHOW NORMAL VTABLES;
SHOW NORMAL VTABLES LIKE 'pattern';
SHOW NORMAL db_name.VTABLES;
SHOW NORMAL db_name.VTABLES LIKE 'pattern';
SHOW CHILD VTABLES;
SHOW CHILD VTABLES LIKE 'pattern';
SHOW CHILD db_name.VTABLES;
SHOW CHILD db_name.VTABLES LIKE 'pattern';
DROP VTABLE vtb_name;
DROP VTABLE IF EXISTS dbname.vtb_name;
SHOW CREATE VTABLE vtable_name;
SHOW CREATE VTABLE db_name.vtable_name;
DESCRIBE vtb_name;
DESCRIBE db_name.vtb_name;
DROP VTABLE vtb_name;
DROP VTABLE IF EXISTS dbname.vtb_name;
SHOW VTABLES;
SHOW db_name.VTABLES;
SHOW VTABLES;
SHOW NORMAL VTABLES;
SHOW CHILD VTABLES;
SHOW db_name.VTABLES;
SHOW NORMAL db_name.VTABLES;
SHOW CHILD db_name.VTABLES LIKE 'pattern';
INSERT INTO tb_name VALUES (ts_value, col_value1);
INSERT INTO tb_name VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name (ts_col, col_name1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name TAGS (tag_value1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) FILE 'csv_file_path';
INSERT INTO tb_name
VALUES (ts_value, col_value1)
tb2_name
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
(ts_col, col_name1)
VALUES (ts_value, col_value1)
tb2_name
(ts_col, col_name1)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
USING stb_name TAGS (tag_value1)
VALUES (ts_value, col_value1)
tb2_name
USING stb_name TAGS (tag_value2)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
USING stb_name (tag_name1) TAGS (tag_value1)
(ts_col, col_name1)
VALUES (ts_value, col_value1)
tb2_name
USING stb_name (tag_name1) TAGS (tag_value2)
(ts_col, col_name1)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
FILE 'csv_file_path'
tb2_name
FILE 'csv_file_path2';
INSERT INTO tb_name
USING stb_name TAGS (tag_value1)
FILE 'csv_file_path'
tb2_name
USING stb_name TAGS (tag_value2)
FILE 'csv_file_path2';
INSERT INTO tb_name
USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2)
(ts_col, col_name1)
VALUES (ts_value, col_value1) (ts_value2, col_value2)
tb2_name
USING stb_name (tag_name1, tag_name2) TAGS (tag_value3, tag_value4)
(ts_col, col_name1)
VALUES (ts_value3, col_value3) (ts_value4, col_value4);
INSERT INTO tb_name SELECT ts_col, col_name1 FROM src_tb_name;
INSERT INTO tb_name (ts_col, col_name1) SELECT ts_col, col_name1 FROM src_tb_name;
INSERT INTO tb_name VALUES (1, 2);
INSERT INTO tb_name (c1, c2) VALUES (1, 2) (3, 4);
INSERT INTO tb_name USING stb_name TAGS ('x') VALUES (1, 2);
INSERT INTO tb_name USING stb_name (tag1) TAGS ('x') (c1, c2) VALUES (1, 2);
INSERT INTO tb_name FILE 'a.csv';
INSERT INTO tb_name (c1, c2) SELECT c1, c2 FROM src;
INSERT INTO tb1 VALUES (1) tb2 VALUES (2);
SELECT DATABASE();
SELECT CLIENT_VERSION();
SELECT SERVER_VERSION();
SELECT SERVER_STATUS();
SELECT NOW();
SELECT TODAY();
SELECT TIMEZONE();
SELECT CURRENT_USER();
SELECT USER();
SELECT * FROM tb_name t1;
SELECT DISTINCT * FROM tb_name t1;
SELECT TAGS * FROM tb_name t1;
SELECT DISTINCT TAGS * FROM tb_name t1;
SELECT /*+ BATCH_SCAN() */ * FROM tb_name t1;
SELECT /*+ NO_BATCH_SCAN() */ * FROM tb_name t1;
SELECT /*+ SORT_FOR_GROUP() */ * FROM tb_name t1;
SELECT /*+ PARTITION_FIRST() */ * FROM tb_name t1;
SELECT /*+ PARA_TABLES_SORT() */ * FROM tb_name t1;
SELECT /*+ SMALLDATA_TS_SORT() */ * FROM tb_name t1;
SELECT /*+ BATCH_SCAN() SORT_FOR_GROUP() */ * FROM tb_name t1;
SELECT * FROM tb_name t1;
SELECT t1.* FROM tb_name t1;
SELECT db_name.tb_name.* FROM db_name.tb_name t1;
SELECT v1.* FROM view_name v1;
SELECT t_alias.* FROM tb_name t_alias;
SELECT ts_col FROM tb_name t1;
SELECT ts_col AS ts_alias FROM tb_name t1;
SELECT ts_col ts_alias FROM tb_name t1;
SELECT col_name1, col_name2 FROM tb_name t1;
SELECT col_name1 + 1 AS c_alias FROM tb_name t1;
SELECT * FROM tb_name t1;
SELECT * FROM view_name v1;
SELECT * FROM (SELECT * FROM tb_name t1) sub1;
SELECT * FROM tb_name t1, tb_name2 t2;
SELECT t1.ts_col, t2.col_name1 FROM tb_name t1, tb_name2 t2;
SELECT * FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 LEFT JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 RIGHT JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 FULL JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 OUTER JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 LEFT OUTER JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 RIGHT OUTER JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 FULL OUTER JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 SEMI JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 ANTI JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 ASOF JOIN tb_name2 t2 ON t1.ts_col = t2.ts_col;
SELECT * FROM tb_name t1 WINDOW JOIN tb_name2 t2 ON t1.id = t2.id;
SELECT * FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id WINDOW_OFFSET(10s, 20s);
SELECT * FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id JLIMIT 10;
SELECT * FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id WINDOW_OFFSET(10s, 20s) JLIMIT 10;
SELECT * FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id, tb_name3 t3 INNER JOIN tb_name4 t4 ON t3.id = t4.id;
SELECT * FROM tb_name t1 WHERE col_name1 > 100;
SELECT * FROM tb_name t1 PARTITION BY col_name1;
SELECT * FROM tb_name t1 PARTITION BY col_name1, col_name2;
SELECT col_name1 AS c1, col_name2 FROM tb_name t1 PARTITION BY c1, 2;
SELECT * FROM tb_name t1 RANGE('2024-01-01 00:00:00.000', '2024-01-02 00:00:00.000') EVERY(1h) FILL(NULL);
SELECT * FROM tb_name t1 RANGE('2024-01-01 00:00:00.000', '2024-01-02 00:00:00.000', 10m) EVERY(1h) FILL(PREV);
SELECT * FROM tb_name t1 RANGE('2024-01-01 00:00:00.000') EVERY(1m) FILL(VALUE, 0);
SELECT * FROM tb_name t1 SESSION(ts_col, 10m);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col, 1);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col, 1, 0);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col) TRUE_FOR(10m);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col) TRUE_FOR(COUNT 10);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col) TRUE_FOR(10m AND COUNT 10);
SELECT * FROM tb_name t1 STATE_WINDOW(state_col) TRUE_FOR(10m OR COUNT 10);
SELECT * FROM tb_name t1 INTERVAL(1m);
SELECT * FROM tb_name t1 INTERVAL(1m, 10s);
SELECT * FROM tb_name t1 INTERVAL(1m) SLIDING(10s);
SELECT * FROM tb_name t1 INTERVAL(1m) FILL(NULL);
SELECT * FROM tb_name t1 INTERVAL(1m, 10s) SLIDING(10s) FILL(VALUE, 0);
SELECT * FROM tb_name t1 EVENT_WINDOW START WITH col_name1 > 0 END WITH col_name1 < 0;
SELECT * FROM tb_name t1 EVENT_WINDOW START WITH col_name1 > 0 END WITH col_name1 < 0 TRUE_FOR(10m);
SELECT * FROM tb_name t1 EVENT_WINDOW START WITH col_name1 > 0 END WITH col_name1 < 0 TRUE_FOR(COUNT 5);
SELECT * FROM tb_name t1 EVENT_WINDOW START WITH col_name1 > 0 END WITH col_name1 < 0 TRUE_FOR(10m AND COUNT 5);
SELECT * FROM tb_name t1 EVENT_WINDOW START WITH col_name1 > 0 END WITH col_name1 < 0 TRUE_FOR(10m OR COUNT 5);
SELECT * FROM tb_name t1 COUNT_WINDOW(10);
SELECT * FROM tb_name t1 COUNT_WINDOW(10, 5);
SELECT * FROM tb_name t1 COUNT_WINDOW(10, 5, col_name1);
SELECT * FROM tb_name t1 COUNT_WINDOW(10, 5, col_name1, col_name2);
SELECT col_name1, COUNT(*) FROM tb_name t1;
SELECT col_name1, COUNT(1) FROM tb_name t1;
SELECT col_name1, COUNT(*) FROM tb_name t1 GROUP BY col_name1 HAVING COUNT(*) > 1;
SELECT col_name1 AS c1, COUNT(*) FROM tb_name t1 GROUP BY c1 HAVING COUNT(*) > 1;
SELECT col_name1, COUNT(*) FROM tb_name t1 GROUP BY 1 HAVING COUNT(*) > 1;
SELECT * FROM tb_name t1 ORDER BY col_name1;
SELECT * FROM tb_name t1 ORDER BY col_name1 DESC;
SELECT * FROM tb_name t1 ORDER BY col_name1 ASC;
SELECT * FROM tb_name t1 ORDER BY col_name1 DESC NULLS FIRST;
SELECT * FROM tb_name t1 ORDER BY col_name1 ASC NULLS LAST;
SELECT col_name1 AS c1, col_name2 FROM tb_name t1 ORDER BY c1, 2 DESC NULLS LAST;
SELECT * FROM tb_name t1 SLIMIT 10;
SELECT * FROM tb_name t1 SLIMIT 10 SOFFSET 5;
SELECT * FROM tb_name t1 LIMIT 10;
SELECT * FROM tb_name t1 LIMIT 10 OFFSET 5;
SELECT * FROM tb_name t1 >> 'export_file';
SELECT DISTINCT col_name1 FROM tb_name t1 WHERE col_name2 > 0 ORDER BY col_name1 LIMIT 10;
SELECT TAGS tag_name1, tag_name2 FROM stb_name s1 WHERE tag_name1 IS NOT NULL;
SELECT col_name1, COUNT(*) 
FROM tb_name t1
WHERE col_name2 > 0
PARTITION BY col_name1
GROUP BY col_name1
HAVING COUNT(*) > 1
ORDER BY col_name1 DESC NULLS LAST
SLIMIT 10 SOFFSET 0
LIMIT 100 OFFSET 0
>> 'export_file';
SELECT ts_col, col_name1
FROM tb_name t1
INTERVAL(1m) SLIDING(10s) FILL(NULL)
ORDER BY ts_col ASC
LIMIT 100;
SELECT t1.*, t2.*
FROM tb_name t1 INNER JOIN tb_name2 t2 ON t1.id = t2.id
WHERE t1.col_name1 > 10
ORDER BY t1.ts_col DESC
LIMIT 50;
SELECT *
FROM (SELECT * FROM tb_name t1) sub1
WHERE col_name1 > 0
ORDER BY ts_col DESC
LIMIT 20;
SELECT col_name1, col_name2
FROM tb_name t1, tb_name2 t2
WHERE t1.id = t2.id
ORDER BY col_name1 ASC, col_name2 DESC NULLS LAST;
SELECT /*+ BATCH_SCAN() PARTITION_FIRST() */ DISTINCT ts_col, col_name1
FROM tb_name t1
WHERE ts_col >= NOW()
PARTITION BY col_name1
ORDER BY ts_col DESC
LIMIT 10 OFFSET 0;
SELECT /*+ BATCH_SCAN() */ a.ts FROM stable1 a, stable2 b where a.tag0 = b.tag0 and a.ts = b.ts;
SELECT /*+ SORT_FOR_GROUP() */ count(*), c1 FROM stable1 PARTITION BY c1;
SELECT /*+ PARTITION_FIRST() */ count(*), c1 FROM stable1 PARTITION BY c1;
SELECT /*+ PARA_TABLES_SORT() */ * from stable1 order by ts;
SELECT /*+ SMALLDATA_TS_SORT() */ * from stable1 order by ts;
SELECT * FROM d1001;
SELECT * FROM d1001;
SELECT d1001.* FROM d1001;
SELECT * FROM d1001;
SELECT d1001.* FROM d1001;
SELECT location, groupid, current FROM d1001 LIMIT 2;
SELECT DISTINCT tag_name FROM stb_name;
SELECT DISTINCT tag_name1, tag_name2 FROM stb_name;
SELECT DISTINCT tag_name1, tag_name2, tag_name3 FROM stb_name;
SELECT DISTINCT col_name FROM tb_name;
SELECT DISTINCT col_name1, col_name2 FROM tb_name;
SELECT DISTINCT col_name1, col_name2, col_name3 FROM tb_name;
SELECT TAGS tag_name FROM stb_name;
SELECT TAGS tag_name1, tag_name2 FROM stb_name;
SELECT TAGS tag_name1, tag_name2, tag_name3 FROM stb_name;
SELECT DISTINCT tag_name FROM stb_name;
SELECT DISTINCT tag_name1, tag_name2 FROM stb_name;
SELECT DISTINCT col_name FROM tb_name;
SELECT DISTINCT col_name1, col_name2 FROM tb_name;
SELECT TAGS tag_name FROM stb_name;
SELECT TAGS tag_name1, tag_name2 FROM stb_name;
SELECT ts, ts AS primary_key_ts FROM d1001;
SELECT TAGS TBNAME, location FROM meters;
SELECT table_name, tag_name, tag_type, tag_value FROM information_schema.ins_tags WHERE stable_name='meters';
SELECT COUNT(*) FROM (SELECT DISTINCT TBNAME FROM meters);
select _rowts, max(current) from meters;
select _irowts, interp(current) from meters range('2020-01-01 10:00:00', '2020-01-01 10:30:00') every(1s) fill(linear);
select _iorwts_origin, interp(current) from meters range('2020-01-01 10:00:00', '2020-01-01 10:30:00') every(1s) fill(NEXT);
SELECT DATABASE();
SELECT CLIENT_VERSION();
SELECT SERVER_VERSION();
SELECT SERVER_STATUS();
SELECT NOW();
SELECT TODAY();
SELECT TIMEZONE();
SELECT CURRENT_USER();
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' WHEN 3 THEN 'Downtime' ELSE 'Unknown' END FROM dev_table;
SELECT AVG(CASE WHEN voltage < 200 or voltage > 250 THEN 220 ELSE voltage END) FROM meters;
SELECT *
FROM temp_tb_1 t1, pressure_tb_1 t2
WHERE t1.ts = t2.ts
SELECT *
FROM temp_stable t1 LEFT JOIN temp_stable t2
ON t1.ts = t2.ts AND t1.deviceid = t2.deviceid AND t1.status=0;
SELECT *
FROM temp_ctable t1 LEFT ASOF JOIN temp_stable t2
ON t1.ts = t2.ts AND t1.deviceid = t2.deviceid;
SELECT * FROM (SELECT * FROM t1) s;
SELECT col1 FROM (SELECT col1, col2 FROM t1) sub;
SELECT col1, (SELECT sum(col1) FROM tb1) FROM tb2;
SELECT col1 FROM tb2 WHERE col1 >= (SELECT avg(col1) FROM tb1);
SELECT col_name1 FROM tb_name1
UNION
SELECT col_name1 FROM tb_name2;
SELECT col_name1 FROM tb_name1
UNION ALL
SELECT col_name1 FROM tb_name2;
SELECT col_name1 FROM tb_name1
UNION
SELECT col_name1 FROM tb_name2
UNION
SELECT col_name1 FROM tb_name3;
SELECT col_name1 FROM tb_name1
UNION ALL
SELECT col_name1 FROM tb_name2
UNION
SELECT col_name1 FROM tb_name3;
SELECT col_name1 FROM tb_name1
UNION
SELECT col_name1 FROM tb_name2
UNION ALL
SELECT col_name1 FROM tb_name3;
SELECT col_name1 FROM tb_name1
UNION ALL
SELECT col_name1 FROM tb_name2
UNION ALL
SELECT col_name1 FROM tb_name3;
SELECT sub1.col_name1
FROM (
    SELECT col_name1
    FROM tb_name
) sub1;
SELECT sub1.col_name1, sub1.col_name2
FROM (
    SELECT col_name1, col_name2
    FROM tb_name
) sub1;
SELECT sub1.col_name1
FROM (
    SELECT col_name1
    FROM tb_name1
) sub1,
(
    SELECT col_name2
    FROM tb_name2
) sub2;
SELECT sub1.col_name1
FROM (
    SELECT col_name1
    FROM tb_name
    WHERE col_name2 > 100
) sub1;
SELECT sub1.col_name1
FROM (
    SELECT col_name1
    FROM (
        SELECT col_name1
        FROM tb_name
    ) sub0
) sub1;
SELECT sub1.col_name1, sub2.col_name2
FROM (
    SELECT col_name1, id
    FROM tb_name1
) sub1
INNER JOIN (
    SELECT col_name2, id
    FROM tb_name2
) sub2
ON sub1.id = sub2.id;
SELECT *
FROM (
    SELECT ts, update_time
    FROM tb_name
) sub1;
SELECT sub1.ts, sub1.update_time
FROM (
    SELECT ts, update_time
    FROM tb_name
) sub1
WHERE sub1.ts IS NOT NULL;
SELECT sub1.ts
FROM (
    SELECT ts
    FROM tb_name
    ORDER BY ts DESC
) sub1;
SELECT sub1.col_name1
FROM (
    SELECT DISTINCT col_name1
    FROM tb_name
) sub1;
SELECT CASE WHEN current > 10 THEN 1 ELSE 0 END FROM meters;
SELECT CASE dev_status WHEN 1 THEN 'Running' END FROM dev_table;
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' END FROM dev_table;
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' WHEN 3 THEN 'Downtime' END FROM dev_table;
SELECT CASE dev_status WHEN 1 THEN 'Running' ELSE 'Unknown' END FROM dev_table;
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' ELSE 'Unknown' END FROM dev_table;
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' WHEN 3 THEN 'Downtime' ELSE 'Unknown' END FROM dev_table;
SELECT CASE WHEN voltage < 200 THEN 220 END FROM meters;
SELECT CASE WHEN voltage < 200 THEN 220 WHEN voltage > 250 THEN 220 END FROM meters;
SELECT CASE WHEN voltage < 200 THEN 220 ELSE voltage END FROM meters;
SELECT CASE WHEN voltage < 200 THEN 220 WHEN voltage > 250 THEN 220 ELSE voltage END FROM meters;
SELECT CASE WHEN temperature > 30 THEN 'HIGH' END FROM sensors;
SELECT CASE WHEN temperature > 30 THEN 'HIGH' WHEN temperature < 10 THEN 'LOW' END FROM sensors;
SELECT CASE WHEN temperature > 30 THEN 'HIGH' ELSE 'NORMAL' END FROM sensors;
SELECT CASE WHEN temperature > 30 THEN 'HIGH' WHEN temperature < 10 THEN 'LOW' ELSE 'NORMAL' END FROM sensors;
SELECT AVG(CASE WHEN voltage < 200 THEN 220 ELSE voltage END) FROM meters;
SELECT AVG(CASE WHEN voltage < 200 OR voltage > 250 THEN 220 ELSE voltage END) FROM meters;
SELECT CASE dev_status WHEN 1 THEN 'Running' WHEN 2 THEN 'Warning' ELSE NULL END FROM dev_table;
SELECT CASE WHEN voltage < 200 THEN 220 WHEN voltage > 250 THEN 220 ELSE NULL END FROM meters;
SELECT *
FROM temp_tb_1 t1, pressure_tb_1 t2
WHERE t1.ts = t2.ts
SELECT *
FROM temp_stable t1 LEFT JOIN temp_stable t2
ON t1.ts = t2.ts AND t1.deviceid = t2.deviceid AND t1.status=0;
SELECT *
FROM temp_ctable t1 LEFT ASOF JOIN temp_stable t2
ON t1.ts = t2.ts AND t1.deviceid = t2.deviceid;
SELECT col1, (SELECT sum(col1) FROM tb1) FROM tb2;
SELECT col1 FROM tb2 WHERE col1 >= (SELECT avg(col1) FROM tb1);
CREATE TABLE tb1 (ts TIMESTAMP, col1 INT, col2 FLOAT, col3 BINARY(50));
SELECT * FROM tb1 WHERE ts >= NOW - 1h;
SELECT * FROM tb1 WHERE col3 LIKE '%nny' ORDER BY ts DESC;
SELECT * FROM tb1 WHERE col3 NOT LIKE '%nny';
SELECT * FROM tb1 WHERE ts > '2018-06-01 08:00:00.000' AND ts <= '2018-06-02 08:00:00.000' AND col3 LIKE '%nny' ORDER BY ts DESC;
SELECT (col1 + col2) AS 'complex' FROM tb1;
SELECT (col1 + col2) AS 'complex' FROM tb1;
SELECT (col1 + col2) 'complex' FROM tb1;
SELECT (col1 + col2) AS 'complex' FROM tb1 WHERE ts > '2018-06-01 08:00:00.000' AND col2 > 1.2 LIMIT 10 OFFSET 5;
SELECT COUNT(*) FROM tb1 >> '/home/testoutput.csv';
SELECT COUNT(*) FROM tb1 >> '/home/test/output.csv';
SELECT COUNT(*) FROM tb1 >> '/tmp/testoutput.csv';
SELECT COUNT(*) FROM tb1 >> '/home/english/output.csv';
SELECT COUNT(*) FROM tb1 >> '/home/chinese/测试输出.csv';
SELECT COUNT(*) FROM tb1 >> '/home/japanese/テスト出力.csv';
SELECT COUNT(*) FROM tb1 >> '/home/korean/테스트출력.csv';
SELECT COUNT(*) FROM tb1 >> '/home/french/sortie_test.csv';
SELECT COUNT(*) FROM tb1 >> '/home/german/testausgabe.csv';
SELECT COUNT(*) FROM tb1 >> '/home/spanish/salida_prueba.csv';
SELECT COUNT(*) FROM tb1 >> '/home/russian/тестовый_вывод.csv';
SELECT COUNT(*) FROM tb1 >> '/home/arabic/مخرجات_الاختبار.csv';
SELECT COUNT(*) FROM tb1 >> '/data/测试/结果.csv';
SELECT COUNT(*) FROM tb1 >> '/data/project_01/output-final.csv';
SELECT COUNT(*) FROM tb1 >> '/data/project 01/output file.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/testoutput.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/temp/output.csv';
SELECT COUNT(*) FROM tb1 >> 'D:/data/result.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/english/output.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/chinese/测试输出.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/japanese/テスト出力.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/korean/테스트출력.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/french/sortie_test.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/german/testausgabe.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/spanish/salida_prueba.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/russian/тестовый_вывод.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/arabic/مخرجات_الاختبار.csv';
SELECT COUNT(*) FROM tb1 >> 'C:/数据/结果.csv';
SELECT COUNT(*) FROM tb1 >> 'D:/Project 01/output file.csv';
SELECT COUNT(*) FROM tb1 >> 'D:/项目A/统计结果.csv';
SELECT COUNT(*) FROM tb1 >> './testoutput.csv';
SELECT COUNT(*) FROM tb1 >> './output/result.csv';
SELECT COUNT(*) FROM tb1 >> '../testoutput.csv';
SELECT COUNT(*) FROM tb1 >> './测试输出.csv';
SELECT COUNT(*) FROM tb1 >> './テスト出力.csv';
SELECT COUNT(*) FROM tb1 >> './테스트출력.csv';
INSERT INTO tb_name VALUES (ts_value, col_value1);
INSERT INTO tb_name VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name (ts_col, col_name1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name TAGS (tag_value1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO tb_name USING stb_name TAGS (tag_value1) FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name (tag_name1) TAGS (tag_value1) FILE 'csv_file_path';
INSERT INTO tb_name USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2) FILE 'csv_file_path';
INSERT INTO tb_name
VALUES (ts_value, col_value1)
tb2_name
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
(ts_col, col_name1)
VALUES (ts_value, col_value1)
tb2_name
(ts_col, col_name1)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
USING stb_name TAGS (tag_value1)
VALUES (ts_value, col_value1)
tb2_name
USING stb_name TAGS (tag_value2)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
USING stb_name (tag_name1) TAGS (tag_value1)
(ts_col, col_name1)
VALUES (ts_value, col_value1)
tb2_name
USING stb_name (tag_name1) TAGS (tag_value2)
(ts_col, col_name1)
VALUES (ts_value2, col_value2);
INSERT INTO tb_name
FILE 'csv_file_path'
tb2_name
FILE 'csv_file_path2';
INSERT INTO tb_name
USING stb_name TAGS (tag_value1)
FILE 'csv_file_path'
tb2_name
USING stb_name TAGS (tag_value2)
FILE 'csv_file_path2';
INSERT INTO tb_name
USING stb_name (tag_name1, tag_name2) TAGS (tag_value1, tag_value2)
(ts_col, col_name1)
VALUES (ts_value, col_value1) (ts_value2, col_value2)
tb2_name
USING stb_name (tag_name1, tag_name2) TAGS (tag_value3, tag_value4)
(ts_col, col_name1)
VALUES (ts_value3, col_value3) (ts_value4, col_value4);
INSERT INTO tb_name SELECT ts_col, col_name1 FROM src_tb_name;
INSERT INTO tb_name (ts_col, col_name1) SELECT ts_col, col_name1 FROM src_tb_name;
INSERT INTO tb_name SELECT ts_col, col_name1 FROM (SELECT ts_col, col_name1 FROM src_tb_name) subq;
INSERT INTO tb_name (ts_col, col_name1) SELECT ts_col, col_name1 FROM (SELECT ts_col, col_name1 FROM src_tb_name) subq;
INSERT INTO tb_name VALUES (field1_value, field2_value);
INSERT INTO tb_name (field1_name, field2_name) VALUES (field1_value, field2_value) (field1_value2, field2_value2);
INSERT INTO tb_name USING stb_name TAGS (tag1_value) VALUES (field1_value);
INSERT INTO tb_name USING stb_name (tag1_name) TAGS (tag1_value) (field1_name) VALUES (field1_value);
INSERT INTO tb_name FILE '/tmp/data.csv';
INSERT INTO tb1 VALUES (1) tb2 VALUES (2);
INSERT INTO tb_name (field1_name, field2_name) SELECT col1, col2 FROM src_tb;
INSERT INTO stb1_name VALUES (ts_value, col_value1);
INSERT INTO stb1_name VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO stb1_name (ts_col, col_name1) VALUES (ts_value, col_value1);
INSERT INTO stb1_name (ts_col, col_name1) VALUES (ts_value, col_value1) (ts_value2, col_value2);
INSERT INTO stb1_name FILE 'csv_file_path';
INSERT INTO stb1_name
VALUES (ts_value, col_value1)
stb2_name
VALUES (ts_value2, col_value2);
INSERT INTO stb1_name
(ts_col, col_name1)
VALUES (ts_value, col_value1)
stb2_name
(ts_col, col_name1)
VALUES (ts_value2, col_value2);
INSERT INTO stb1_name
FILE 'csv_file_path'
stb2_name
FILE 'csv_file_path2';
INSERT INTO stb1_name
(ts_col, col_name1)
VALUES (ts_value, col_value1) (ts_value2, col_value2)
stb2_name
(ts_col, col_name1)
VALUES (ts_value3, col_value3) (ts_value4, col_value4);
INSERT INTO stb1_name
VALUES (ts_value, col_value1)
stb2_name
VALUES (ts_value2, col_value2)
stb3_name
VALUES (ts_value3, col_value3);
INSERT INTO stb1_name
(ts_col, col_name1)
VALUES (ts_value, col_value1)
stb2_name
(ts_col, col_name1)
VALUES (ts_value2, col_value2)
stb3_name
(ts_col, col_name1)
VALUES (ts_value3, col_value3);
INSERT INTO stb1_name
FILE 'csv_file_path'
stb2_name
FILE 'csv_file_path2'
stb3_name
FILE 'csv_file_path3';
INSERT INTO stb_name (tbname, ts_col, col_name1) SELECT tbname, ts_col, col_name1 FROM src_tb_name;
INSERT INTO stb_name (tbname, ts_col, col_name1) SELECT tbname, ts_col, col_name1 FROM (SELECT tbname, ts_col, col_name1 FROM src_tb_name) subq;
INSERT INTO tb_name VALUES (field1_value, field2_value);
INSERT INTO tb_name (field1_name, field2_name) VALUES (field1_value, field2_value) (field1_value2, field2_value2);
INSERT INTO tb_name USING stb_name TAGS (tag1_value) VALUES (field1_value);
INSERT INTO tb_name USING stb_name (tag1_name) TAGS (tag1_value) (field1_name) VALUES (field1_value);
INSERT INTO tb_name FILE '/tmp/data.csv';
INSERT INTO tb1 VALUES (1) tb2 VALUES (2);
INSERT INTO tb_name (field1_name, field2_name) SELECT col1, col2 FROM src_tb;
INSERT INTO stb1_name VALUES (field1_value, field2_value);
INSERT INTO stb1_name (field1_name, field2_name) VALUES (field1_value, field2_value) (field1_value2, field2_value2);
INSERT INTO stb1_name FILE '/tmp/data.csv';
INSERT INTO stb1_name VALUES (1) stb2_name VALUES (2);
INSERT INTO stb_name (tbname, field1_name, field2_name) SELECT tbname, col1, col2 FROM src_tb;
INSERT INTO d1001 USING meters TAGS('Beijing.Chaoyang', 2) VALUES('a');
INSERT INTO d1001 VALUES (NOW, 10.2, 219, 0.32);
INSERT INTO d1001 VALUES ('2021-07-13 14:06:32.272', 10.2, 219, 0.32) (1626164208000, 10.15, 217, 0.33);
INSERT INTO d1001 (ts, current, phase) VALUES ('2021-07-13 14:06:33.196', 10.27, 0.31);
INSERT INTO d1001 VALUES ('2021-07-13 14:06:34.630', 10.2, 219, 0.32) ('2021-07-13 14:06:35.779', 10.15, 217, 0.33)
            d1002 (ts, current, phase) VALUES ('2021-07-13 14:06:34.255', 10.27, 0.31);
INSERT INTO d21001 USING meters TAGS ('California.SanFrancisco', 2) VALUES ('2021-07-13 14:06:32.272', 10.2, 219, 0.32);
INSERT INTO d21001 USING meters (groupId) TAGS (2) VALUES ('2021-07-13 14:06:33.196', 10.15, 217, 0.33);
INSERT INTO d21001 USING meters TAGS ('California.SanFrancisco', 2) VALUES ('2021-07-13 14:06:34.630', 10.2, 219, 0.32) ('2021-07-13 14:06:35.779', 10.15, 217, 0.33)
            d21002 USING meters (groupId) TAGS (2) VALUES ('2021-07-13 14:06:34.255', 10.15, 217, 0.33)
            d21003 USING meters (groupId) TAGS (2) (ts, current, phase) VALUES ('2021-07-13 14:06:34.255', 10.27, 0.31);
INSERT INTO d1001 FILE '/tmp/csvfile.csv';
INSERT INTO d21001 USING meters TAGS ('California.SanFrancisco', 2) FILE '/tmp/csvfile_21001.csv'
            d21002 USING meters (groupId) TAGS (2) FILE '/tmp/csvfile_21002.csv';
INSERT INTO meters(tbname, location, groupId, ts, current, voltage, phase)
                VALUES ('d31001', 'California.SanFrancisco', 2, '2021-07-13 14:06:34.630', 10.2, 219, 0.32)
                ('d31001', 'California.SanFrancisco', 2, '2021-07-13 14:06:35.779', 10.15, 217, 0.33)
                ('d31002', NULL, 2, '2021-07-13 14:06:34.255', 10.15, 217, 0.33);
INSERT INTO meters(tbname, location, groupId, ts, current, voltage, phase)
                FILE '/tmp/csvfile_21002.csv';
DELETE FROM tb_name;
DELETE FROM db_name.tb_name;
DELETE FROM tb_name WHERE condition;
DELETE FROM db_name.tb_name WHERE condition;
DELETE FROM tb_name WHERE ts > '2024-01-01 00:00:00.000';
DELETE FROM tb_name WHERE ts >= '2024-01-01 00:00:00.000';
DELETE FROM tb_name WHERE ts < '2024-12-31 23:59:59.999';
DELETE FROM tb_name WHERE ts <= '2024-12-31 23:59:59.999';
DELETE FROM tb_name WHERE ts = '2024-06-01 12:00:00.000';
DELETE FROM tb_name WHERE col_name1 = 100;
DELETE FROM tb_name WHERE col_name1 != 100;
DELETE FROM tb_name WHERE col_name1 <> 100;
DELETE FROM tb_name WHERE col_name1 > 100;
DELETE FROM tb_name WHERE col_name1 >= 100;
DELETE FROM tb_name WHERE col_name1 < 100;
DELETE FROM tb_name WHERE col_name1 <= 100;
DELETE FROM tb_name WHERE col_name1 IS NULL;
DELETE FROM tb_name WHERE col_name1 IS NOT NULL;
DELETE FROM tb_name WHERE col_name1 BETWEEN 10 AND 20;
DELETE FROM tb_name WHERE col_name1 NOT BETWEEN 10 AND 20;
DELETE FROM tb_name WHERE col_name1 IN (1, 2, 3);
DELETE FROM tb_name WHERE col_name1 NOT IN (1, 2, 3);
DELETE FROM tb_name WHERE col_name2 LIKE 'pattern';
DELETE FROM tb_name WHERE col_name2 LIKE 'abc%';
DELETE FROM tb_name WHERE col_name2 LIKE '%abc';
DELETE FROM tb_name WHERE col_name2 LIKE '%abc%';
DELETE FROM tb_name WHERE col_name2 NOT LIKE 'pattern';
DELETE FROM tb_name WHERE ts > '2024-01-01 00:00:00.000' AND ts < '2024-12-31 23:59:59.999';
DELETE FROM tb_name WHERE col_name1 > 100 AND col_name2 = 'status_ok';
DELETE FROM tb_name WHERE col_name1 > 100 OR col_name2 = 'status_ok';
DELETE FROM tb_name WHERE NOT col_name1 = 100;
DELETE FROM tb_name WHERE NOT col_name1 = 100 and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT (col_name1 = 100) and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT col_name1 IN (1, 2, 3) and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT col_name1 BETWEEN 10 AND 20 and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT (col_name1 = 100) and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT col_name1 IN (1, 2, 3) and NOT col_name1 = 200;
DELETE FROM tb_name WHERE NOT col_name1 BETWEEN 10 AND 20 and NOT col_name1 = 200;
DELETE FROM tb_name WHERE (col_name1 > 100 AND col_name2 = 'status_ok');
DELETE FROM tb_name WHERE (col_name1 > 100 OR col_name2 = 'status_ok');
DELETE FROM tb_name WHERE (col_name1 > 100 AND col_name2 = 'status_ok') OR col_name3 < 10;
DELETE FROM tb_name WHERE col_name1 > 100 AND (col_name2 = 'status_ok' OR col_name3 < 10);
DELETE FROM tb_name WHERE ts >= NOW();
DELETE FROM tb_name WHERE ts >= TODAY();
DELETE FROM db_name.tb_name WHERE ts > '2024-01-01 00:00:00.000';
DELETE FROM db_name.tb_name WHERE col_name1 = 100;
DELETE FROM db_name.tb_name WHERE col_name1 IS NULL;
DELETE FROM db_name.tb_name WHERE col_name1 BETWEEN 10 AND 20;
DELETE FROM db_name.tb_name WHERE col_name1 IN (1, 2, 3);
DELETE FROM db_name.tb_name WHERE col_name2 LIKE '%abc%';
DELETE FROM db_name.tb_name WHERE ts > '2024-01-01 00:00:00.000' AND col_name1 > 100;
DELETE FROM db_name.tb_name WHERE (col_name1 > 100 OR col_name2 = 'status_ok') AND col_name3 IS NOT NULL;
SELECT * FROM tb_name WHERE ts > '2024-01-01 00:00:00.000';
SELECT * FROM tb_name WHERE ts >= '2024-01-01 00:00:00.000';
SELECT * FROM tb_name WHERE ts < '2024-12-31 23:59:59.999';
SELECT * FROM tb_name WHERE ts <= '2024-12-31 23:59:59.999';
SELECT * FROM tb_name WHERE ts = '2024-06-01 12:00:00.000';
SELECT * FROM tb_name WHERE col_name1 = 100;
SELECT * FROM tb_name WHERE col_name1 != 100;
SELECT * FROM tb_name WHERE col_name1 <> 100;
SELECT * FROM tb_name WHERE col_name1 > 100;
SELECT * FROM tb_name WHERE col_name1 >= 100;
SELECT * FROM tb_name WHERE col_name1 < 100;
SELECT * FROM tb_name WHERE col_name1 <= 100;
SELECT * FROM tb_name WHERE col_name1 IS NULL;
SELECT * FROM tb_name WHERE col_name1 IS NOT NULL;
SELECT * FROM tb_name WHERE col_name1 BETWEEN 10 AND 20;
SELECT * FROM tb_name WHERE col_name1 NOT BETWEEN 10 AND 20;
SELECT * FROM tb_name WHERE col_name1 IN (1, 2, 3);
SELECT * FROM tb_name WHERE col_name1 NOT IN (1, 2, 3);
SELECT * FROM tb_name WHERE col_name2 LIKE 'pattern';
SELECT * FROM tb_name WHERE col_name2 LIKE 'abc%';
SELECT * FROM tb_name WHERE col_name2 LIKE '%abc';
SELECT * FROM tb_name WHERE col_name2 LIKE '%abc%';
SELECT * FROM tb_name WHERE col_name2 NOT LIKE 'pattern';
SELECT * FROM tb_name WHERE ts > '2024-01-01 00:00:00.000' AND ts < '2024-12-31 23:59:59.999';
SELECT * FROM tb_name WHERE col_name1 > 100 AND col_name2 = 'status_ok';
SELECT * FROM tb_name WHERE col_name1 > 100 OR col_name2 = 'status_ok';
SELECT * FROM tb_name WHERE NOT col_name1 = 100;
SELECT * FROM tb_name WHERE (col_name1 > 100 AND col_name2 = 'status_ok');
SELECT * FROM tb_name WHERE (col_name1 > 100 OR col_name2 = 'status_ok');
SELECT * FROM tb_name WHERE (col_name1 > 100 AND col_name2 = 'status_ok') OR col_name3 < 10;
SELECT * FROM tb_name WHERE col_name1 > 100 AND (col_name2 = 'status_ok' OR col_name3 < 10);
SELECT * FROM tb_name WHERE ts >= NOW();
SELECT * FROM tb_name WHERE ts >= TODAY();
SELECT * FROM db_name.tb_name WHERE ts > '2024-01-01 00:00:00.000';
SELECT * FROM db_name.tb_name WHERE col_name1 = 100;
SELECT * FROM db_name.tb_name WHERE col_name1 IS NULL;
SELECT * FROM db_name.tb_name WHERE col_name1 BETWEEN 10 AND 20;
SELECT * FROM db_name.tb_name WHERE col_name1 IN (1, 2, 3);
SELECT * FROM db_name.tb_name WHERE col_name2 LIKE '%abc%';
SELECT * FROM db_name.tb_name WHERE ts > '2024-01-01 00:00:00.000' AND col_name1 > 100;
SELECT * FROM db_name.tb_name WHERE (col_name1 > 100 OR col_name2 = 'status_ok') AND col_name3 IS NOT NULL;
DELETE FROM tb_name WHERE col_name1 IN (1, 2, 3);
DELETE FROM tb_name WHERE col_name1 NOT IN (1, 2, 3);
DELETE FROM tb_name WHERE col_name1 IN (SELECT col1 FROM tb2);
DELETE FROM tb_name WHERE col_name1 BETWEEN 10 AND 20;
DELETE FROM tb_name WHERE col_name1 NOT BETWEEN 10 AND 20;
delete from meters where ts < '2021-10-01 10:40:00.100' ;
CREATE table tabname (ts TIMESTAMP);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP
);
CREATE table dbname.tabname (ts TIMESTAMP);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP
);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'simple8b'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP COMPRESS 'lz4'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP COMPRESS 'zstd' LEVEL 'high'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'bit-packing' COMPRESS 'zlib'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'delta-i' COMPRESS 'xz' LEVEL 'medium'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'disabled'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP COMPRESS 'tsz'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP COMPRESS 'disabled' LEVEL 'l'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'delta-d' COMPRESS 'lz4'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName TIMESTAMP ENCODE 'bss' COMPRESS 'zstd' LEVEL 'm'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP,
    colName2 TIMESTAMP
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP ENCODE 'simple8b',
    colName2 TIMESTAMP
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP COMPRESS 'zlib',
    colName2 TIMESTAMP
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP COMPRESS 'xz' LEVEL 'low',
    colName2 TIMESTAMP
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP ENCODE 'bit-packing' COMPRESS 'lz4',
    colName2 TIMESTAMP ENCODE 'disabled'
);
CREATE table tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP ENCODE 'delta-i' COMPRESS 'tsz' LEVEL 'h',
    colName2 TIMESTAMP COMPRESS 'zstd' LEVEL 'medium'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP,
    colName2 TIMESTAMP
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP ENCODE 'delta-d',
    colName2 TIMESTAMP COMPRESS 'disabled'
);
CREATE table dbname.tabname (
    ts TIMESTAMP,
    colName1 TIMESTAMP ENCODE 'bss' COMPRESS 'xz' LEVEL 'm',
    colName2 TIMESTAMP
);
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP;
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP;
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'simple8b';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bit-packing';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-i';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-d';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'disabled';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bss';
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'simple8b';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'lz4';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'zlib';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'zstd';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'tsz';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'xz';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'disabled';
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'zstd';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'lz4' LEVEL 'high';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'zlib' LEVEL 'low';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'zstd' LEVEL 'medium';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'tsz' LEVEL 'h';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'xz' LEVEL 'l';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'disabled' LEVEL 'm';
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP COMPRESS 'lz4' LEVEL 'high';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bit-packing' COMPRESS 'zlib';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-i' COMPRESS 'zstd';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-d' COMPRESS 'tsz';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'disabled' COMPRESS 'xz';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bss' COMPRESS 'disabled';
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-d' COMPRESS 'zstd';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'high';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bit-packing' COMPRESS 'zlib' LEVEL 'low';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-i' COMPRESS 'zstd' LEVEL 'medium';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'delta-d' COMPRESS 'tsz' LEVEL 'h';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'disabled' COMPRESS 'xz' LEVEL 'l';
ALTER TABLE tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'bss' COMPRESS 'disabled' LEVEL 'm';
ALTER TABLE db_name.tabName MODIFY COLUMN colName TIMESTAMP ENCODE 'simple8b' COMPRESS 'lz4' LEVEL 'high';
DESCRIBE tabName;
DESCRIBE dbname.tabName;

SELECT 1;
SELECT 'abc';
SELECT '中文';
SELECT ABS(1);
SELECT ABS(col1) FROM tb1;
SELECT ABS(-10) FROM tb1;
SELECT ABS(col1 + col2) FROM tb1;
SELECT ACOS(col1) FROM tb1;
SELECT ACOS(1) FROM tb1;
SELECT ACOS(col1 + 0.1) FROM tb1;
CREATE DATABASE test;
USE test;

CREATE DATABASE test;
USE test;

CREATE STABLE meters (
  ts TIMESTAMP,
  current FLOAT,
  voltage INT,
  phase FLOAT
) TAGS (
  groupId INT,
  location BINARY(24)
);

SELECT *
FROM meters
ORDER BY ts DESC
LIMIT 5;

SELECT *
FROM meters
WHERE voltage > 230
ORDER BY ts DESC
LIMIT 5;

SELECT *
FROM d101
ORDER BY ts DESC
LIMIT 2;

SELECT COUNT(*)
FROM meters;

SELECT
  MAX(current) AS max_current,
  MIN(current) AS min_current,
  AVG(current) AS avg_current
FROM meters;

SELECT SUM(current) AS total_current
FROM meters;

SELECT COUNT(*), MAX(current)
FROM meters
WHERE ts > NOW - 24h;

SELECT FIRST(*)
FROM d101;

SELECT LAST(current)
FROM d101;

SELECT LAST_ROW(*)
FROM d101;

SELECT TOP(voltage, 3)
FROM d101;

SELECT BOTTOM(voltage, 3)
FROM d101;

SELECT _wstart, SUM(current)
FROM d101
INTERVAL(10s);

SELECT _wstart, AVG(voltage)
FROM d101
INTERVAL(1m);

SELECT _wstart, COUNT(*)
FROM d101
INTERVAL(5m);

SELECT TWA(current)
FROM d101;

SELECT SPREAD(voltage)
FROM d101;

SELECT DIFF(current)
FROM d101;

SELECT CSUM(current)
FROM d101;

SELECT MAVG(current, 5)
FROM d101;

SELECT DERIVATIVE(current, 1s, 0)
FROM d101;

SELECT IRATE(current)
FROM d101;

SELECT PERCENTILE(current, 95)
FROM d101;

SELECT APERCENTILE(current, 95)
FROM d101;

SELECT STDDEV(current)
FROM d101;

SELECT VARIANCE(current)
FROM d101;

SELECT NOW;

SELECT TODAY;

SELECT TIMEDIFF('2026-03-15 10:00:00.000', '2026-03-15 09:30:00.000');

SELECT TIMETRUNCATE(ts, 1m)
FROM d101;

SELECT CONCAT('device_', 'd101');

SELECT UPPER(location)
FROM meters;

SELECT SUBSTRING(location, 1, 5)
FROM meters;

SELECT TRIM(location)
FROM meters;

SELECT REPLACE(location, 'beijing', 'bj')
FROM meters;

SELECT ABS(phase)
FROM d101;

SELECT ROUND(current, 2)
FROM d101;

SELECT CEIL(current), FLOOR(current)
FROM d101;

SELECT POW(current, 2)
FROM d101;

SELECT SQRT(voltage)
FROM d101;

SELECT CAST(voltage AS FLOAT)
FROM d101;

SELECT TO_CHAR(ts)
FROM d101;

SELECT TO_UNIXTIMESTAMP(ts)
FROM d101;

SELECT IF(voltage > 220, 'high', 'normal')
FROM d101;

SELECT IFNULL(phase, 0)
FROM d101;

SELECT NVL(phase, 0)
FROM d101;

SELECT NULLIF(voltage, 0)
FROM d101;

SELECT groupId, COUNT(*), AVG(current)
FROM meters
GROUP BY groupId;

SELECT MAX(current)
FROM meters
WHERE groupId = 2
  AND ts > NOW - 24h;

SELECT INTERP(current)
FROM d101
RANGE('2026-03-15 00:00:00.000', '2026-03-15 01:00:00.000')
EVERY(10s);

SELECT SAMPLE(current, 10)
FROM d101;

SELECT bit_and(c1, c2)
FROM table_name;

SELECT LAST_ROW(*)
FROM d101;

SELECT tbname, LAST(voltage)
FROM meters
GROUP BY tbname;

SELECT _wstart, AVG(current)
FROM d101
WHERE ts > NOW - 1h
INTERVAL(1m);

SELECT groupId, SPREAD(voltage)
FROM meters
WHERE ts > NOW - 24h
GROUP BY groupId;

SELECT *
FROM meters
WHERE voltage > 240 OR voltage < 180
ORDER BY ts DESC
LIMIT 100;


-- @formatter:off