#先查看当前状态
show variables like 'general%';

#可以在my.cnf里添加,1开启（0关闭）,当然了,这样要重启才能生效,有点多余了
#general-log = 1
#log = /log/mysql_query.log路径
#也可以设置变量那样更改,1开启（0关闭）,即时生效,不用重启,首选当然是这样的了
set global general_log=1;
#这个日志对于操作频繁的库,产生的数据量会很快增长,出于对硬盘的保护,可以设置其他存放路径
set global general_log_file='mysql_general_log.log';



show variables like '%slow%';
set global log_slow_queries=1;
show warnings;


show PROCESSLIST;


# innodb_buffer_pool_size不够大会导致： java.sql.BatchUpdateException: The total number of locks exceeds the lock table size
# 默认
show variables like "%_buffer%";
show variables like "%size%";
