-- 按计划每月导出上个月deliveryreceivedrecord报表：
select *
from dm_jxwts.deliveryreceivedrecord src
where src.receivedAt
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月drivercheckedrecorddetail报表：
select *
from dm_jxwts.drivercheckedrecorddetail src
where src.createdAt
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月package_account_report报表：
select *
from dm_jxwts.package_account_report src
where src.created_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月报表：
select *
from dm_jxwts.package_moving_log src
where src.created_at
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);

-- 按计划每月导出上个月报表：
select *
from dm_jxwts.transport_report src
where src.receivedAt
          between date_add(curdate() - day(curdate()) + 1, interval -1 month)
          and date_add(curdate(), interval - day(curdate()) + 1 day);


