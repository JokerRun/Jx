-- 查询不同记录id中，payload没有任何差异的记录
SELECT COUNT
	( 1 ) AS to_cnt,
	src.packageId,
	src.carId,
	src.whouseId,
	src.driverId,
	src.creatorId,
	src.createdAt,
	src.actionType,
	src.relationId
FROM
	EdiAsnPackageMovingLog src 
GROUP BY
	src.packageId,
	src.carId,
	src.whouseId,
	src.driverId,
	src.creatorId,
	src.createdAt,
	src.actionType,
	src.relationId
HAVING COUNT ( 1 ) >1
ORDER BY to_cnt desc;

select * from ediAsnPackageMovingLog where packageid=4337121