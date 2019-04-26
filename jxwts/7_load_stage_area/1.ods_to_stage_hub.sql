# ods_to_stage_hub
insert into stage_area.stage_user select
@rownum:=@rownum+1 as load_seq,
 md5(nr) as h_user_hk,
 now() as load_date,
 'erp.wctz.user' as record_source,
  md5(CONCAT_WS(',',nr,name,email,pwd,pwdSalt,wxOpenId,wx_access_token,wx_access_token_expires_in,wx_refresh_token,wx_scope,phone,roleType,jgRegId,whouseId,carTroopId,driverLicense,driverLevel,id)) as user_hash_diff,
 nr as user_nr,
 nr,name,email,pwd,pwdSalt,wxOpenId,wx_access_token,wx_access_token_expires_in,wx_refresh_token,wx_scope,phone,roleType,jgRegId,whouseId,carTroopId,driverLicense,driverLevel,id
from
 (SELECT @rownum:=0) r,ods_jxwts.user u
;

insert into stage_area.stage_warehouse select
@rownum:=@rownum+1 as load_seq,
	md5(nr) as h_warehouse_hk,
	'${load_date}' as load_date,
	'erp.wctz.warehouse' as record_source,

	 md5(CONCAT_WS(',',nr,name,address,capacity,type,dockPointId,city,linkMan,linkPhone,workTime,isInUse,id)) as warehouse_hash_diff,
	nr as warehouse_nr,
	nr,name,address,capacity,type,dockPointId,city,linkMan,linkPhone,workTime,isInUse,id
from
	(SELECT @rownum:=0) r,whouse w
;
insert into stage_area.stage_edi_transport select
	@rownum:=@rownum+1 as load_seq,
	md5(transportnumber) as h_transport_hk,
	'${load_date}' as load_date,
	'erp.wctz.transport' as record_source,
	 md5(CONCAT_WS(',',transportnumber,customerpoboxid,supplierpoboxid,plantname,plantcode,customername,customerno,customerdock,suppliername,supplierno,loadingdate,loadingtime,arrivaldate,arrivaltime,carrier,transportationmode,transportationcode,transportationid,transportationid2,freightterms,remark,weightnet,weightgross,created,archived,editransmissionnonew,editransmissionnoold,editransmissiondate,createdDateTime,createdAt,updatedAt,ediProcessMessageId,arrivaldateDatetime,currentDataId,state,currentWhouseId,sentAt,receivedAt,dataSourceType,supplierId,dockPointId,milkDate,supplierTrasnNr,delivDate,isDispatched,trayCount,packageCount,singlePackageCount,isCanceled,isVerify,id)) as hash_diff,
	transportnumber as transport_nr,
	transportnumber,customerpoboxid,supplierpoboxid,plantname,plantcode,customername,customerno,customerdock,suppliername,supplierno,loadingdate,loadingtime,arrivaldate,arrivaltime,carrier,transportationmode,transportationcode,transportationid,transportationid2,freightterms,remark,weightnet,weightgross,created,archived,editransmissionnonew,editransmissionnoold,editransmissiondate,createdDateTime,createdAt,updatedAt,ediProcessMessageId,arrivaldateDatetime,currentDataId,state,currentWhouseId,sentAt,receivedAt,dataSourceType,supplierId,dockPointId,milkDate,supplierTrasnNr,delivDate,isDispatched,trayCount,packageCount,singlePackageCount,isCanceled,isVerify,id
from
	(SELECT @rownum:=0) r,ediasntransport e

;
insert into stage_area.stage_part select
@rownum:=@rownum+1 as load_seq,
	md5(Nr) as h_part_hk,
	'${load_date}' as load_date,
	'erp.wctz.part' as record_source,

	 md5(CONCAT_WS(',',Nr,description,supplierCode,kltContent,kltLength,kltWidth,kltHeight,luContent,luLength,luWidth,luHeight,unitsPerPallet,unitsPerLayer,layers,palletStackingLayers,packageType,packageCategory,packagingMaterialType,isWithWheels,isFolding,lengthAfterFolding,widthAfterFolding,heightAfterFolding,packagingAmount,isWithReturnable,isPackageReturnable,isPalletReturnable,isLidReturnable,mainCode,PalletCode,lidCode,isPI,isWPI,weight,grossWeight,tareWeight,weightUnit,deliveryFlodingLayers,doublePalletCount,perPalletLength,milkRunDatePre,isCarriage,orderNo,parentDockPointId,dockPointId,chineseName,minPickPack,packModel,city,address,id)) as part_hash_diff,
	Nr as part_nr,
	Nr,description,supplierCode,kltContent,kltLength,kltWidth,kltHeight,luContent,luLength,luWidth,luHeight,unitsPerPallet,unitsPerLayer,layers,palletStackingLayers,packageType,packageCategory,packagingMaterialType,isWithWheels,isFolding,lengthAfterFolding,widthAfterFolding,heightAfterFolding,packagingAmount,isWithReturnable,isPackageReturnable,isPalletReturnable,isLidReturnable,mainCode,PalletCode,lidCode,isPI,isWPI,weight,grossWeight,tareWeight,weightUnit,deliveryFlodingLayers,doublePalletCount,perPalletLength,milkRunDatePre,isCarriage,orderNo,parentDockPointId,dockPointId,chineseName,minPickPack,packModel,city,address,id
from
	(SELECT @rownum:=0) r,part p
;


insert into stage_area.stage_dockpoint select
@rownum:=@rownum+1 as load_seq,
	md5(code) as h_dockpoint_hk,
	'${load_date}' as load_date,
	'erp.wctz.dockpoint' as record_source,

	 md5(CONCAT_WS(',',name,code,description,type,parentId,workTime,isInUse,id)) as dockpoint_hash_diff,
	code as dockpoint_nr,
	name,code,description,type,parentId,workTime,isInUse,id
from
	(SELECT @rownum:=0) r,dockpoint d
;

insert into stage_area.stage_car select
@rownum:=@rownum+1 as load_seq,
	md5(Nr) as h_car_hk,
	'${load_date}' as load_date,
	'erp.wctz.car' as record_source,
	Nr as car_nr,
	capacity,description,driverId,status,carAreaCode,carTroopCode,carTypeId,innerLength,innerWidth,innerHeight,
	md5(CONCAT_WS(',',Nr,capacity,description,driverId,status,carAreaCode,carTroopCode,carTypeId,innerLength,innerWidth,innerHeight,id)) as hash_diff,
	Nr,id
from
	(SELECT @rownum:=0) r,car c
;

insert into stage_area.stage_edi_delivery_node select
@rownum:=@rownum+1 as load_seq,
	md5(delnotenumber) as h_delivery_node_hk,
	'${load_date}' as load_date,
	'erp.wctz.delivery_node' as record_source,

	 md5(CONCAT_WS(',',ediAsnTransportId,transactiontype,weightnet,weightgross,delnotenumber,plantname,plantcode,dock,customername,customerno,suppliername,supplierno,remark,delnotedate,created,archived,customerpoboxid,supplierpoboxid,createdDateTime,createdAt,updatedAt,currentDataId,state,dataSourceType,id)) as delivery_node_hash_diff,
	delnotenumber as delivery_node_nr,
	ediAsnTransportId,transactiontype,weightnet,weightgross,delnotenumber,plantname,plantcode,dock,customername,customerno,suppliername,supplierno,remark,delnotedate,created,archived,customerpoboxid,supplierpoboxid,createdDateTime,createdAt,updatedAt,currentDataId,state,dataSourceType,id
from
	(SELECT @rownum:=0) r,ods_jxwts.ediasndeliverynode d
;


