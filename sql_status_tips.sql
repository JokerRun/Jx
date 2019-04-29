#先查看当前状态
show variables like 'general%';

#可以在my.cnf里添加,1开启（0关闭）,当然了,这样要重启才能生效,有点多余了
#general-log = 1
#log = /log/mysql_query.log路径
#也可以设置变量那样更改,1开启（0关闭）,即时生效,不用重启,首选当然是这样的了
set global general_log=0;
#这个日志对于操作频繁的库,产生的数据量会很快增长,出于对硬盘的保护,可以设置其他存放路径
# shell $ touch /tmp/mysql_general_log.log
# shell $ chown mysql.mysql /tmp/mysql_general_log.log
# tail -f /tmp/mysql_general_log.log
set global general_log_file='/tmp/mysql_general_log.log';

show variables like '%slow%';
set global slow_query_log=1;
# $tail -f /var/lib/mysql/ubuntu-slow.log
show warnings;

show PROCESSLIST;

# innodb_buffer_pool_size不够大会导致： java.sql.BatchUpdateException: The total number of locks exceeds the lock table size
# 默认
show variables like '%_buffer%';
show variables like '%size%';

SELECT @@innodb_flush_log_at_trx_commit;
### 重要Innodb_buffer_pool_size：https://blog.csdn.net/yang1982_0907/article/details/20123055
show status like  'Innodb_buffer_pool_%';

/*统计一下InnoDB表的实际占用大小,这会给出一个参考，让你知道如果你想缓存整个数据集应该为InnoDB缓冲池设置多少内存合适。
不过大多数情况你不需要那样做，你只需要缓存你经常使用的数据集。
*/
SELECT engine,
  count(*) as TABLES,
  concat(round(sum(table_rows)/1000000,2),'M') rows,
  concat(round(sum(data_length)/(1024*1024*1024),2),'G') DATA,
  concat(round(sum(index_length)/(1024*1024*1024),2),'G') idx,
  concat(round(sum(data_length+index_length)/(1024*1024*1024),2),'G') total_size,
  round(sum(index_length)/sum(data_length),2) idxfrac
FROM information_schema.TABLES
WHERE table_schema not in ('mysql', 'performance_schema', 'information_schema')
GROUP BY engine
ORDER BY sum(data_length+index_length) DESC LIMIT 10;

/*设置好之后，我们来看看如何检查InnoDB缓冲池大小是否设置足够。
在终端中，执行如下命令：*/



#INNODB：
# 应用经验：
# 查询配置用variable， 查看配置效果看status。 命令都是 show ** like "%innodb_...%"

-- SELECT @@innodb_flush_log_at_trx_commit;
show VARIABLES like  'Innodb_buffer_pool_%';
show status like  'Innodb_buffer_pool_%';
show VARIABLES like "%INNODB%";
show STATUS like "%INNODB%";
show status like 'innodb_log%';
SELECT engine,
  count(*) as TABLES,
  concat(round(sum(table_rows)/1000000,2),'M') rows,
  concat(round(sum(data_length)/(1024*1024*1024),2),'G') DATA,
  concat(round(sum(index_length)/(1024*1024*1024),2),'G') idx,
  concat(round(sum(data_length+index_length)/(1024*1024*1024),2),'G') total_size,
  round(sum(index_length)/sum(data_length),2) idxfrac
FROM information_schema.TABLES
WHERE table_schema not in ('mysql', 'performance_schema', 'information_schema')
GROUP BY engine
ORDER BY sum(data_length+index_length) DESC LIMIT 10;



show VARIABLES like '%general_log%';
set global general_log =1;
show VARIABLES like 'log_output';
set global log_output='table,file';
set global log_output='file';
select * from mysql.general_log