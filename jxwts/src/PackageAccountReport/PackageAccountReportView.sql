USE JXWTSDb;
SELECT
    --     dbo.EdiAsnPackage.id,
    --     dbo.EdiAsnPackage.ediAsnTransportId,
    --     dbo.EdiAsnPackage.ediDeliveryNodeId,
    --     dbo.EdiAsnPackage.internalid,
    --     dbo.EdiAsnPackage.parentid,
    --     dbo.EdiAsnPackage.quantityperpack,
    --     dbo.EdiAsnPackage.tara,
    --     dbo.EdiAsnPackage.itemnopackcustomer,
    --     dbo.EdiAsnPackage.itemnopacksupplier,
    --     dbo.EdiAsnPackage.ownership,
    --     dbo.EdiAsnPackage.recycling,
    --     dbo.EdiAsnPackage.batchno,
    --     dbo.EdiAsnPackage.klt,
    --     dbo.EdiAsnPackage.printflag,
    --     dbo.EdiAsnPackage.delnotepositionid,
    --     dbo.EdiAsnPackage.quantitypack,
    --     dbo.EdiAsnPackage.labelnofrom,
    --     dbo.EdiAsnPackage.stacking,
    --     dbo.EdiAsnPackage.partId,
    --     dbo.EdiAsnPackage.orderno,
    --     dbo.EdiAsnPackage.supplierId,
    --     dbo.EdiAsnPackage.currentWhouseId,
    --     dbo.EdiAsnPackage.currentDockPointId,
    --     dbo.EdiAsnPackage.currentUserId,
    --     dbo.EdiAsnPackage.currentCarId,
    --     dbo.EdiAsnPackage.currentCarTrailerId,
    --     dbo.EdiAsnPackage.isChecked,
    --     dbo.EdiAsnPackage.checkedAt,
    --     dbo.EdiAsnPackage.checkUserId,
    --     dbo.EdiAsnPackage.checkCarId,
    --     dbo.EdiAsnPackage.checkCarTrailerId,
    --     dbo.EdiAsnPackage.lastDeliveryPackageRelationId,
    --     dbo.EdiAsnPackage.sentAt,
    --     dbo.EdiAsnPackage.updatedAt,
    --     dbo.EdiAsnPackage.dockPointId,
    --     dbo.EdiAsnPackage.delivDate,
    --     dbo.Whouse.address                   AS whouseAddress,
    --     dbo.Supplier.name                    AS supplierName,
    --     dbo.Supplier.address                 AS supplierAddress,
    --     dbo.Supplier.city                    AS supplierCity,
    --     dbo.EdiAsnDeliveryNode.delnotedate,
    --     dbo.EdiAsnPackage.dataSourceType,
    --     dbo.EdiAsnPackage.ediAsnPositionId,
    --     dbo.EdiAsnPackage.parentPackageId,
    --     dbo.EdiAsnPackage.parentPathIds,
    --     dbo.Whouse.name                      AS whouseName,


    -- 运输单编号：asnTransportNr
    dbo.EdiAsnTransport.transportnumber AS asnTransportNr,
    -- 发货单编号：asnDeliveryNodeNr
    dbo.EdiAsnDeliveryNode.delnotenumber AS asnDeliveryNodeNr,
    -- 标签号：nr
    dbo.EdiAsnPackage.nr,
    -- 状态：state通过枚举DeliveryState计算
/*  DeliveryState：运输状态，包装箱、托、运单
    public enum DeliveryState
    {
        /// 创建[Description("创建")]Init = 50,
        /// 已配载[Description("已配载")]DeliverDispatched =90,
        /// 供应商已备货[Description("已备货")]SupplierReady = 100,
        /// 已验收 [Description("已验收")]Checked = 400,
        /// 部分验收 [Description("部分验收")]PartialChecked = 401,
        /// 送货中[Description("送货中")]OnDelivering = 500,
        /////部分送货途中[Description("部分送货途中")] PartialOnDelivering = 501,
        ///已送达[Description("已送达")]SendArrival = 600,
        ///部分送达 [Description("部分送达")] PartialSendArrival =601,
        ///  已接收  [Description("已接收")] Received = 700,
        ///  部分接收  [Description("部分接收")]  PartialReceived = 701,
        /// 已交付 [Description("已交付")] InStocked = 800,
        /// 部分交付 [Description("部分交付")] PartialInStocked = 801
}
*/
    dbo.EdiAsnPackage.state,
    -- 是否验单：bool isVerify计算为： 是/否
    dbo.EdiAsnTransport.isVerify,
    -- SAP状态：bool isSAPReceived计算为：已交付/未交付
    dbo.EdiAsnPackage.isSAPReceived,
    -- 零件号：partNr
    dbo.Part.Nr  AS partNr,
    -- 件数 ：totalQty
    dbo.EdiAsnPackage.totalQty,
    -- 包装类型
    dbo.EdiAsnPackage.packagetype,
    /*
    PackageType
    public enum PackageType
        {
            /// 托[Description("托")] M = 1,
            /// 混合包装 [Description("混合")] G = 2,
            /// 箱子[Description("箱")] S = 3,
            /// 未知[Description("未知")] NA = 999
        }
*/

    -- 体积 ：通过包装类型计算：
    /*   通过包装类型计算
          public double valumeM
           {
               get
               {
                   double v = 0.0;
                   if (this.packagetype == (int)PackageType.M)
                   {
                       if (this.luLength.HasValue && this.luWidth.HasValue && this.luHeight.HasValue)
                       {
                           var l = this.luLength.Value / 1000.0;
                           var w = this.luWidth.Value / 1000.0;
                           var h = this.luHeight.Value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   else if (this.packagetype == (int)PackageType.S)
                   {
                       if (this.kltLength.HasValue && this.kltWidth.HasValue && this.kltHeight.HasValue)
                       {
                           var l = this.kltLength.Value / 1000.0;
                           var w = this.kltWidth.Value / 1000.0;
                           var h = this.kltHeight.Value / 1000.0;
                             v = l * w * h;

                       }
                   }
                   return Math.Round(v,1);
               }
           }
   */
    -- 重量 ：通过包装类型计算:
    /*通过包装类型计算
    public double weightT
            {
                get
                {
                    double d = 0;
                    if (this.packagetype == (int)PackageType.M)
                    {
                        double.TryParse(this.grossWeight, out d);

                    }
                    else if (this.packagetype == (int)PackageType.S)
                    {

                        double.TryParse(this.tareWeight, out d);

                    }
                    return Math.Round(d, 1);
                }
            }

    */
    dbo.Part.kltContent,
    dbo.Part.kltLength,
    dbo.Part.kltWidth,
    dbo.Part.kltHeight,
    dbo.Part.luContent,
    dbo.Part.luLength,
    dbo.Part.luWidth,
    dbo.Part.luHeight,
    dbo.Part.grossWeight,
    dbo.Part.tareWeight,

    -- 供应商简称：supplierDesc
    dbo.Supplier.description AS supplierDesc,
    -- 供应商代码：supplierCode
    dbo.Supplier.code AS supplierCode,

    -- ASN到货时间：asnArrivalDate
    dbo.EdiAsnTransport.arrivaldate AS asnArrivalDate,
    -- ASN发货时间：milkDate格式化为：yyyy-MM-dd
    dbo.EdiAsnPackage.milkDate,
    -- 收货时间：receivedAt格式化为：yyyy/MM/dd HH:mm
    dbo.EdiAsnPackage.receivedAt,
    -- 收货时间：receivedAt格式化为：yyyy/MM/dd HH:mm
    dbo.EdiAsnPackage.sapReceivedAt,
    -- 收货扫描人：同过receiverId到用户表中查询，使用用户信息拼接name+phone，例如：李丹丹13251650234 【待定：这个字段可再处理，不一定用旧的模式，直接分成两列】
    dbo.EdiAsnPackage.receiverId,
    -- 仓库：whouseNr
    dbo.Whouse.nr                        AS whouseNr,
    -- 卸货口：dockPointCode
    dbo.DockPoint.code                   AS dockPointCode,
    -- ASN同步时间：createdAt
    -- 创建时间：createdAt
    dbo.EdiAsnPackage.createdAt
FROM dbo.EdiAsnPackage
         LEFT OUTER JOIN dbo.Part ON dbo.EdiAsnPackage.partId = dbo.Part.id
         LEFT OUTER JOIN dbo.EdiAsnDeliveryNode ON dbo.EdiAsnPackage.ediDeliveryNodeId = dbo.EdiAsnDeliveryNode.id
         LEFT OUTER JOIN dbo.EdiAsnTransport ON dbo.EdiAsnPackage.ediAsnTransportId = dbo.EdiAsnTransport.id
         LEFT OUTER JOIN dbo.Supplier ON dbo.EdiAsnPackage.supplierId = dbo.Supplier.id
         LEFT OUTER JOIN dbo.Whouse ON dbo.EdiAsnPackage.currentWhouseId = dbo.Whouse.id
         LEFT OUTER JOIN dbo.DockPoint ON dbo.EdiAsnPackage.currentDockPointId = dbo.DockPoint.id
