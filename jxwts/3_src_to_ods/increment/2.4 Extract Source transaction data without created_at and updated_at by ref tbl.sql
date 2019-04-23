#${db.table.name:toLower():in("deliveryreceivededipackagerelation")}
SELECT
	*
FROM
	"${db.table.name}" src
WHERE
	src.deliveryReceivedRecordId IN (
SELECT
	ref.id
FROM
	DeliveryReceivedRecord ref
WHERE
	ref.receivedAt >= cast( '${loaddate-1}' AS date )
	AND ref.receivedAt < cast( '${loaddate}' AS date )
	)