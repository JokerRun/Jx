## 1.全量init
### putSQL

```sql
truncate table ${db.table.name}
```

截断ods相关表格数据

#### Exce


## 9.数据清理脚本(From lzw)
```mssql
-- S/M码发货列表  
-- 表名：EdiAsnPackageMovingLog
-- 删除数据脚本，保留365天的数据
  delete from [JXWTSDb].[dbo].[EdiAsnPackageMovingLog] where DateDiff(dd,createdAt,getdate())>365
  
  
  
-- 零配件报表
-- 表名：EdiAsnPackage
-- 删除数据脚本,保留365天的数据
delete from [JXWTSDb].[dbo].[DeliveryReceivedEdiPackageRelation] where [ediAsnPackageId] in (select id from [JXWTSDb].[dbo].[EdiAsnPackage] where DateDiff(dd,updatedAt,getdate())>365);
delete from [JXWTSDb].[dbo].[DeliveryNodeEdiPackageRelation] where [ediAsnPackageId] in (select id from [JXWTSDb].[dbo].[EdiAsnPackage] where DateDiff(dd,updatedAt,getdate())>365);
delete from [JXWTSDb].[dbo].[EdiAsnPackage] where DateDiff(dd,updatedAt,getdate())>365);



-- 驾驶员提货记录
-- 表名：DriverCheckedRecord
-- 删除脚本，保留365天的数据
delete FROM [JXWTSDb].[dbo].[DriverCheckedRecord] where DateDiff(dd,updatedAt,getdate())>365);



-- 收货单列表
-- 表名：DeliveryReceivedRecord
-- 删除数据脚本，保留365天的数据
delete from [JXWTSDb].[dbo].[DeliveryReceivedEdiPackageRelation] where [deliveryReceivedRecordId] in (select id from [JXWTSDb].[dbo].[DeliveryReceivedRecord] where DateDiff(dd,updatedAt,getdate())>365));
delete from [JXWTSDb].[dbo].[DeliveryReceivedRecord] where DateDiff(dd,updatedAt,getdate())>365)



-- 运输报表
-- 表名：TransportReportView
-- 删除数据脚本，保留365天的数据
-- 删除EdiAsnPackage表时删除该数据，不需要重复删除

```