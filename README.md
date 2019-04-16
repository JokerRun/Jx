# JX

## src

来源系统，包含源系统的报表信息，及业务提供的字段映射等相关信息

## ods

来源系统镜像（去除外键等关系属性）

## ods_dm(dm_jxwts)

用于从ods层快速生成报表，如

## stage_area

用于存放stage层数据，不包含来源系统的任何主外键、索引。各表中以`load_seq`+`load_date`为主键。 并计算添加派生列：`load_date`（批次加载时间）、`load_seq`（批次记录行号）、`record_source`（数据来源：app.schema.table）、`xxx_hk`(来自md5( bks ))、`xxx_hash_diff`(来自md5( sat payload ))

## dw_raw(raw data vault)

## dw_biz(business vault暂不使用)

## dm_wts（wts系统数据集市）