## 数据源到ods个表同步情况：


### 1.全量同步（数据量不大/主数据）


### 2.根据创建时间或跟新时间增量同步（交易数据）：

### 3.仅根据创建时间同步（交易数据）：

### 4.根据其他关联表中的时间字段进行同步（交易数据）：

### 其他注意事项： 
1. ods各表中只有id主键,去除了其他外键/索引属性/非空/默认值等业务属性。
2. 源数据中bit(1)类型(boolean)改为ods中的char(5)，用于存放true/false;
3. load data 脚本为replace模式

