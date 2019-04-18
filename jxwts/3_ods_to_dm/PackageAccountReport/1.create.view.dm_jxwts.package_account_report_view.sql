use dm_jxwts;
drop view if exists  dm_jxwts.package_account_report_view ;
create view dm_jxwts.package_account_report_view as
select
/*    --     ods_jxwts.ediasnpackage.id,
    --     ods_jxwts.ediasnpackage.ediasntransportid,
    --     ods_jxwts.ediasnpackage.edideliverynodeid,
    --     ods_jxwts.ediasnpackage.internalid,
    --     ods_jxwts.ediasnpackage.parentid,
    --     ods_jxwts.ediasnpackage.quantityperpack,
    --     ods_jxwts.ediasnpackage.tara,
    --     ods_jxwts.ediasnpackage.itemnopackcustomer,
    --     ods_jxwts.ediasnpackage.itemnopacksupplier,
    --     ods_jxwts.ediasnpackage.ownership,
    --     ods_jxwts.ediasnpackage.recycling,
    --     ods_jxwts.ediasnpackage.batchno,
    --     ods_jxwts.ediasnpackage.klt,
    --     ods_jxwts.ediasnpackage.printflag,
    --     ods_jxwts.ediasnpackage.delnotepositionid,
    --     ods_jxwts.ediasnpackage.quantitypack,
    --     ods_jxwts.ediasnpackage.labelnofrom,
    --     ods_jxwts.ediasnpackage.stacking,
    --     ods_jxwts.ediasnpackage.partid,
    --     ods_jxwts.ediasnpackage.orderno,
    --     ods_jxwts.ediasnpackage.supplierid,
    --     ods_jxwts.ediasnpackage.currentwhouseid,
    --     ods_jxwts.ediasnpackage.currentdockpointid,
    --     ods_jxwts.ediasnpackage.currentuserid,
    --     ods_jxwts.ediasnpackage.currentcarid,
    --     ods_jxwts.ediasnpackage.currentcartrailerid,
    --     ods_jxwts.ediasnpackage.ischecked,
    --     ods_jxwts.ediasnpackage.checkedat,
    --     ods_jxwts.ediasnpackage.checkuserid,
    --     ods_jxwts.ediasnpackage.checkcarid,
    --     ods_jxwts.ediasnpackage.checkcartrailerid,
    --     ods_jxwts.ediasnpackage.lastdeliverypackagerelationid,
    --     ods_jxwts.ediasnpackage.sentat,
    --     ods_jxwts.ediasnpackage.updatedat,
    --     ods_jxwts.ediasnpackage.dockpointid,
    --     ods_jxwts.ediasnpackage.delivdate,
    --     ods_jxwts.whouse.address                   as whouseaddress,
    --     ods_jxwts.supplier.name                    as suppliername,
    --     ods_jxwts.supplier.address                 as supplieraddress,
    --     ods_jxwts.supplier.city                    as suppliercity,
    --     ods_jxwts.ediasndeliverynode.delnotedate,
    --     ods_jxwts.ediasnpackage.datasourcetype,
    --     ods_jxwts.ediasnpackage.ediasnpositionid,
    --     ods_jxwts.ediasnpackage.parentpackageid,
    --     ods_jxwts.ediasnpackage.parentpathids,
    --     ods_jxwts.whouse.name                      as whousename,
*/

    -- 运输单编号：asntransportnr
    ods_jxwts.ediasntransport.transportnumber as asn_transport_nr,
    -- 发货单编号：asndeliverynodenr
    ods_jxwts.ediasndeliverynode.delnotenumber as asn_delivery_node_nr,
    -- 标签号：nr
    ods_jxwts.ediasnpackage.nr as asn_package_nr,
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
    ods_jxwts.ediasnpackage.state as state,
    -- 是否验单：bool isverify计算为： 是/否
    ods_jxwts.ediasntransport.isverify as is_verify,
    -- sap状态：bool issapreceived计算为：已交付/未交付
    ods_jxwts.ediasnpackage.issapreceived as is_sap_received,
    -- 零件号：partnr
    ods_jxwts.part.nr  as part_nr,
    -- 件数 ：totalqty
    ods_jxwts.ediasnpackage.totalqty as total_qty,
    -- 包装类型
    ods_jxwts.ediasnpackage.packagetype as package_type,
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
    ods_jxwts.part.kltcontent  as klt_content ,
    ods_jxwts.part.kltlength  as klt_length ,
    ods_jxwts.part.kltwidth  as klt_width ,
    ods_jxwts.part.kltheight  as klt_height ,
    ods_jxwts.part.lucontent  as lu_content ,
    ods_jxwts.part.lulength  as lu_length ,
    ods_jxwts.part.luwidth  as lu_width  ,
    ods_jxwts.part.luheight  as lu_height ,
    ods_jxwts.part.grossweight  as gross_weight,
    ods_jxwts.part.tareweight  as tare_weight ,
    -- 供应商简称：supplierdesc
    ods_jxwts.supplier.description as supplier_desc,
    -- 供应商代码：suppliercode
    ods_jxwts.supplier.code as supplier_code,

    -- asn到货时间：asnarrivaldate
    ods_jxwts.ediasntransport.arrivaldate as asn_arrival_date,
    -- asn发货时间：milkdate格式化为：yyyy-mm-dd
    ods_jxwts.ediasnpackage.milkdate as milk_date,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_jxwts.ediasnpackage.receivedat as received_at,
    -- 收货时间：receivedat格式化为：yyyy/mm/dd hh:mm
    ods_jxwts.ediasnpackage.sapreceivedat as sap_received_at,
    -- 收货扫描人：同过receiverid到用户表中查询，使用用户信息拼接name+phone，例如：李丹丹13251650234 【待定：这个字段可再处理，不一定用旧的模式，直接分成两列】
    ods_jxwts.ediasnpackage.receiverid as receiver_id,
    -- 仓库：whousenr
    ods_jxwts.whouse.nr                        as whouse_nr,
    -- 卸货口：dockpointcode
    ods_jxwts.dockpoint.code                   as dockpoint_code,
    -- asn同步时间：createdat
    -- 创建时间：createdat
    ods_jxwts.ediasnpackage.createdat as asn_created_at,
    ods_jxwts.ediasnpackage.createdat as created_at
from ods_jxwts.ediasnpackage
         left outer join ods_jxwts.part on ods_jxwts.ediasnpackage.partid = ods_jxwts.part.id
         left outer join ods_jxwts.ediasndeliverynode on ods_jxwts.ediasnpackage.edideliverynodeid = ods_jxwts.ediasndeliverynode.id
         left outer join ods_jxwts.ediasntransport on ods_jxwts.ediasnpackage.ediasntransportid = ods_jxwts.ediasntransport.id
         left outer join ods_jxwts.supplier on ods_jxwts.ediasnpackage.supplierid = ods_jxwts.supplier.id
         left outer join ods_jxwts.whouse on ods_jxwts.ediasnpackage.currentwhouseid = ods_jxwts.whouse.id
         left outer join ods_jxwts.dockpoint on ods_jxwts.ediasnpackage.currentdockpointid = ods_jxwts.dockpoint.id
