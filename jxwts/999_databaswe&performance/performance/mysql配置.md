
[Mysql解决The total number of locks exceeds the lock table size错误](https://blog.csdn.net/github_36326955/article/details/54970808)
[The total number of locks exceeds the lock table size](https://stackoverflow.com/questions/6901108/the-total-number-of-locks-exceeds-the-lock-table-size)
```mysql
# innodb_buffer_pool_size不够大会导致:java.sql.BatchUpdateException: The total number of locks exceeds the lock table size
# 默认
show variables like "%size%";
show variables like "%_buffer%";
SET GLOBAL innodb_buffer_pool_size=1073741824;
SET GLOBAL bulk_insert_buffer_size=67108864;
```
