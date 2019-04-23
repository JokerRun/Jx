LOAD DATA
    CONCURRENT LOCAL
    INFILE '${tmp_data_dir}/${db.table.name}/${filename}'
--    REPLACE
    INTO TABLE ods_prod.${db.table.name}
    CHARACTER SET UTF8
    IGNORE 1 LINES