-- S/M码发货列表  
-- 表名：EdiAsnPackageMovingLog
-- 删除数据脚本，保留两个月的数据
DELETE
FROM [JXWTSDb].[dbo].[EdiAsnPackageMovingLog]
WHERE createdAt < DATEADD(month, -2, GETDATE())
;

-- 零配件报表
-- 表名：EdiAsnPackage
-- 删除数据脚本,保留两个月的数据

-- DeliveryReceivedEdiPackageRelation
DELETE
FROM [JXWTSDb].[dbo].[DeliveryReceivedEdiPackageRelation]
WHERE [ediAsnPackageId] IN
      (SELECT id FROM [JXWTSDb].[dbo].[EdiAsnPackage] WHERE updatedAt < DATEADD(MONTH, - 2, GETDATE()));

-- 	DeliveryNodeEdiPackageRelation
DELETE
FROM [JXWTSDb].[dbo].[DeliveryNodeEdiPackageRelation]
WHERE [ediAsnPackageId] IN
      (SELECT id FROM [JXWTSDb].[dbo].[EdiAsnPackage] WHERE updatedAt < DATEADD(MONTH, - 2, GETDATE()));

-- EdiAsnPackage
DELETE
FROM [JXWTSDb].[dbo].[EdiAsnPackage]
WHERE updatedAt < DATEADD(MONTH, - 2, GETDATE());


-- 驾驶员提货记录
-- 表名：DriverCheckedRecord
-- 删除脚本，保留两个月的数据
delete
FROM [JXWTSDb].[dbo].[DriverCheckedRecord]
where updatedAt < DATEADD(MONTH, - 2, GETDATE());;


-- 收货单列表
-- 表名：DeliveryReceivedRecord
-- 删除数据脚本，保留两个月的数据
delete
from [JXWTSDb].[dbo].[DeliveryReceivedEdiPackageRelation]
where [deliveryReceivedRecordId] in
      (select id from [JXWTSDb].[dbo].[DeliveryReceivedRecord] where updatedAt < DATEADD(MONTH, - 2, GETDATE()));


delete
from [JXWTSDb].[dbo].[DeliveryReceivedRecord]
where updatedAt < DATEADD(MONTH, - 2, GETDATE());


-- 运输报表
-- 表名：TransportReportView
-- 删除数据脚本，保留两个月的数据
-- 删除EdiAsnPackage表时删除该数据，不需要重复删除

