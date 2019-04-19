#${db.table.name:toLower():in("deliveryreceivededipackagerelation")}
select *
from "${db.table.name}"
where sendTime between cast('${loaddate-1}' as date) and cast('${loaddate}' as date)