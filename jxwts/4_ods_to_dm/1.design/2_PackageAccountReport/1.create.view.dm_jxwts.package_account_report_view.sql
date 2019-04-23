use dm_jxwts;
drop view if exists  dm_jxwts.package_account_report_view ;
create view dm_jxwts.package_account_report_view as
select
/*    --     ods_prod.ediasnpackage.id,
    --     ods_prod.ediasnpackage.ediasntransportid,
    --     ods_prod.ediasnpackage.edideliverynodeid,
    --     ods_prod.ediasnpackage.internalid,
    --     ods_prod.ediasnpackage.parentid,
    --     ods_prod.ediasnpackage.quantityperpack,
    --     ods_prod.ediasnpackage.tara,
    --     ods_prod.ediasnpackage.itemnopackcustomer,
    --     ods_prod.ediasnpackage.itemnopacksupplier,
    --     ods_prod.ediasnpackage.ownership,
    --     ods_prod.ediasnpackage.recycling,
    --     ods_prod.ediasnpackage.batchno,
    --     ods_prod.ediasnpackage.klt,
    --     ods_prod.ediasnpackage.printflag,
    --     ods_prod.ediasnpackage.delnotepositionid,
    --     ods_prod.ediasnpackage.quantitypack,
    --     ods_prod.ediasnpackage.labelnofrom,
    --     ods_prod.ediasnpackage.stacking,
    --     ods_prod.ediasnpackage.partid,
    --     ods_prod.ediasnpackage.orderno,
    --     ods_prod.ediasnpackage.supplierid,
    --     ods_prod.ediasnpackage.currentwhouseid,
    --     ods_prod.ediasnpackage.currentdockpointid,
    --     ods_prod.ediasnpackage.currentuserid,
    --     ods_prod.ediasnpackage.currentcarid,
    --     ods_prod.ediasnpackage.currentcartrailerid,
    --     ods_prod.ediasnpackage.ischecked,
    --     ods_prod.ediasnpackage.checkedat,
    --     ods_prod.ediasnpackage.checkuserid,
    --     ods_prod.ediasnpackage.checkcarid,
    --     ods_prod.ediasnpackage.checkcartrailerid,
    --     ods_prod.ediasnpackage.lastdeliverypackagerelationid,
    --     ods_prod.ediasnpackage.sentat,
    --     ods_prod.ediasnpackage.updatedat,
    --     ods_prod.ediasnpackage.dockpointid,
    --     ods_prod.ediasnpackage.delivdate,
    --     ods_prod.whouse.address                   as whouseaddress,
    --     ods_prod.supplier.name                    as suppliername,
    --     ods_prod.supplier.address                 as supplieraddress,
    --     ods_prod.supplier.city                    as suppliercity,
    --     ods_prod.ediasndeliverynode.delnotedate,
    --     ods_prod.ediasnpackage.datasourcetype,
    --     ods_prod.ediasnpackage.ediasnpositionid,
    --     ods_prod.ediasnpackage.parentpackageid,
    --     ods_prod.ediasnpackage.parentpathids,
    --     ods_prod.whouse.name                      as whousename,
*/
    -- TODO：保证数据唯一性，后期需要跟业务确认本表唯一约束条件，去掉本字段。
       ods_prod.ediasnpackage.id,
    -- 标签号：nr
    ods_prod.ediasnpackage.nr as asn_package_nr,
    -- 运输单编号：asntransportnr
    ods_prod.ediasntransport.transportnumber as asn_transport_nr,
    -- 发货单编号：asndeliverynodenr
    ods_prod.ediasndeliverynode.delnotenumber as asn_delivery_node_nr,
    -- 状态：state通过枚举deliverystate计算
/*  deliverystate：运输状态，包装箱、托、运单
    public enum deliverystate
    {
        /// 创建[description("创建")]init = 50,
        /// 已配载[description("已配载")]deliverdispatched =90,
        /// 供应商已备货[description("已备货")]supplierready = 100,
        /// 已验收 [description("已验收")]checked = 400,
        /// 部分验收 [description("部分验收")]partialchecked = 401,
        /// 送货中[description("送货中")]ondelivering = 500,
        /////部分送货途中[description("部分送货途中")] partialondelivering = 501,
        ///已送达[description("已送达")]sendarrival = 600,
        ///部分送达 [description("部分送达")] partialsendarrival =601,
        ///  已接收  [description("已接收")] received = 700,
        ///  部分接收  [description("部分接收")]  partialreceived = 701,
        /// 已交付 [description("已交付")] instocked = 800,
        /// 部分交付 [description("部分交付")] partialinstocked = 801
}
*/
--     ods_prod.ediasnpackage.state as state,
		CASE
		WHEN ods_prod.ediasnpackage.state = 50 THEN '创建'
		WHEN ods_prod.ediasnpackage.state = 90 THEN '已配载'
		WHEN ods_prod.ediasnpackage.state = 100 THEN '已备货'
		WHEN ods_prod.ediasnpackage.state = 400 THEN '已验收'
		WHEN ods_prod.ediasnpackage.state = 401 THEN '部分验收'
		WHEN ods_prod.ediasnpackage.state = 500 THEN '送货中'
		WHEN ods_prod.ediasnpackage.state = 501 THEN '部分送货途中'
		WHEN ods_prod.ediasnpackage.state = 600 THEN '已送达'
		WHEN ods_prod.ediasnpackage.state = 601 THEN '部分送达'
		WHEN ods_prod.ediasnpackage.state = 700 THEN '已接收'
		WHEN ods_prod.ediasnpackage.state = 701 THEN '部分接收'
		WHEN ods_prod.ediasnpackage.state = 800 THEN '已交付'
		WHEN ods_prod.ediasnpackage.state = 801 THEN '部分交付'
		ELSE
			'未知状态'
		END  as state ,





    -- 是否验单：bool isverify计算为： 是/否
--     ods_prod.ediasntransport.isverify as is_verify,
		CASE ods_prod.ediasntransport.isverify WHEN 'true' THEN '是'	ELSE '否' END as is_verify,

    -- sap状态：bool issapreceived计算为：已交付/未交付
--     ods_prod.ediasnpackage.issapreceived as is_sap_received,
    CASE ods_prod.ediasnpackage.issapreceived WHEN 'true' THEN '已交付'	ELSE '未交付' END as is_sap_received,
-- 零件号：partnr
    ods_prod.part.nr  as part_nr,
    -- 件数 ：totalqty
    ods_prod.ediasnpackage.totalqty as total_qty,
    -- 包装类型
--     ods_prod.ediasnpackage.packagetype as package_type,
			CASE
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN '托'
			WHEN ods_prod.ediasnpackage.packagetype = 2 THEN '混合'
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN '箱'
			WHEN ods_prod.ediasnpackage.packagetype = 999 THEN '未知'
			ELSE
				'未知'
			END  as package_type ,


    /*
    packagetype
    public enum packagetype
        {
            /// 托[description("托")] m = 1,
            /// 混合包装 [description("混合")] g = 2,
            /// 箱子[description("箱")] s = 3,
            /// 未知[description("未知")] na = 999
        }
*/

    -- 体积 ：通过包装类型计算：
    /*   通过包装类型计算
          public double valumem
           {
               get
               {
                   double v = 0.0;
                   if (this.packagetype == (int)packagetype.m)
                   {
                       if (this.lulength.hasvalue && this.luwidth.hasvalue && this.luheight.hasvalue)
                       {
                           var l = this.lulength.value / 1000.0;
                           var w = this.luwidth.value / 1000.0;
                           var h = this.luheight.value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   else if (this.packagetype == (int)packagetype.s)
                   {
                       if (this.kltlength.hasvalue && this.kltwidth.hasvalue && this.kltheight.hasvalue)
                       {
                           var l = this.kltlength.value / 1000.0;
                           var w = this.kltwidth.value / 1000.0;
                           var h = this.kltheight.value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   return math.round(v,1);
               }
           }
   */

	 			ROUND((CASE
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN ods_prod.part.lulength * ods_prod.part.luwidth * ods_prod.part.luheight
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN ods_prod.part.kltlength * ods_prod.part.kltwidth * ods_prod.part.kltheight
			ELSE
				0.0
			END  )/1000000000,1)as valumem ,
--     ods_prod.part.kltcontent  as klt_content ,
--     ods_prod.part.kltlength  as klt_length ,
--     ods_prod.part.kltwidth  as klt_width ,
--     ods_prod.part.kltheight  as klt_height ,
--     ods_prod.part.lucontent  as lu_content ,
--     ods_prod.part.lulength  as lu_length ,
--     ods_prod.part.luwidth  as lu_width  ,
--     ods_prod.part.luheight  as lu_height ,





    -- 重量 ：通过包装类型计算:
    /*通过包装类型计算
    public double weightt
            {
                get
                {
                    double d = 0;
                    if (this.packagetype == (int)packagetype.m)
                    {
                        double.tryparse(this.grossweight, out d);

                    }
                    else if (this.packagetype == (int)packagetype.s)
                    {

                        double.tryparse(this.tareweight, out d);

                    }
                    return math.round(d, 1);
                }
            }

    */

ROUND((CASE
			WHEN ods_prod.ediasnpackage.packagetype = 1 THEN ods_prod.part.grossweight
			WHEN ods_prod.ediasnpackage.packagetype = 3 THEN ods_prod.part.tareweight
			ELSE
				0.0
			END  ),1)as weightt ,

		ods_prod.part.grossweight  as gross_weight,
    ods_prod.part.tareweight  as tare_weight ,
    -- 供应商简称：supplierdesc
    ods_prod.supplier.description as supplier_desc,
    -- 供应商代码：suppliercode
    ods_prod.supplier.code as supplier_code,

    -- asn到货时间：asnarrivaldate
    ods_prod.ediasntransport.arrivaldate as asn_arrival_date,
    -- asn发货时间：milkdate格式化为：yyyy-mm-dd
    ods_prod.ediasnpackage.milkdate as milk_date,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_prod.ediasnpackage.receivedat as received_at,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_prod.ediasnpackage.sapreceivedat as sap_received_at,
    -- 收货扫描人：同过receiverid到用户表中查询，使用用户信息拼接name+phone，例如：李丹丹13251650234 【待定：这个字段可再处理，不一定用旧的模式，直接分成两列】
		ods_prod.ediasnpackage.receiverId  as receiver_id,
    ods_prod.user.`name` as receiver_name,
    ods_prod.user.phone as receiver_phone,
    -- 仓库：whousenr
    ods_prod.whouse.nr                        as whouse_nr,
    -- 卸货口：dockpointcode
    ods_prod.dockpoint.code                   as dockpoint_code,
    -- asn同步时间：createdat
    -- 创建时间：createdat
    ods_prod.ediasnpackage.createdat as asn_created_at,
    ods_prod.ediasnpackage.createdat as created_at,
    ods_prod.ediasnpackage.updatedat as updatedat

from ods_prod.ediasnpackage
         left outer join ods_prod.part on ods_prod.ediasnpackage.partid = ods_prod.part.id
         left outer join ods_prod.ediasndeliverynode on ods_prod.ediasnpackage.edideliverynodeid = ods_prod.ediasndeliverynode.id
         left outer join ods_prod.ediasntransport on ods_prod.ediasnpackage.ediasntransportid = ods_prod.ediasntransport.id
         left outer join ods_prod.supplier on ods_prod.ediasnpackage.supplierid = ods_prod.supplier.id
         left outer join ods_prod.whouse on ods_prod.ediasnpackage.currentwhouseid = ods_prod.whouse.id
         left outer join ods_prod.dockpoint on ods_prod.ediasnpackage.currentdockpointid = ods_prod.dockpoint.id
				 left outer join ods_prod.user on ods_prod.ediasnpackage.receiverId = ods_prod.user.id