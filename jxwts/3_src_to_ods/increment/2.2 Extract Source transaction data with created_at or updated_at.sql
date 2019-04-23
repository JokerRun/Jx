#${db.table.name:toLower():in("ediasnposition","ediasnpackage","deliverynodeedipackagerelation")}
select *
from "${db.table.name}"
where (createdat >= cast('${loaddate-1}' as date) and createdat < cast('${loaddate}' as date))
   or (updatedat >= cast('${loaddate-1}' as date) and updatedat < cast('${loaddate}' as date))
