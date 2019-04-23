#${db.table.name:toLower():in("ediasnpackagemovinglog")}
select *
from "${db.table.name}"
where createdat >= cast('${loaddate-1}' as date)
  and createdat < cast('${loaddate}' as date)