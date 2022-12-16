ALTER TABLE lpecom_covid ADD slug_region VARCHAR(255);
ALTER TABLE `lpecom_departments` DROP `region_code`;
UPDATE 
    lpecom_covid 
INNER JOIN lpecom_regions  ON lpecom_regions.code = lpecom_covid.id_region
SET lpecom_covid.slug_region = lpecom_regions.slug;
ALTER TABLE `lpecom_departments` ADD `slug_region` VARCHAR(255) NOT NULL AFTER `slug`, ADD INDEX (`slug_region`);
UPDATE lpecom_departments 
INNER JOIN lpecom_regions ON lpecom_regions.code = lpecom_departments.region_code 
SET lpecom_departments.slug_region = lpecom_regions.slug;
ALTER TABLE db.lpecom_departments DROP FOREIGN KEY lpecom_departments_region_code_foreign;

ALTER TABLE `lpecom_departments` ADD FOREIGN KEY (`slug_region`) REFERENCES `lpecom_regions`(`slug`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Ipecom regions DROP COLUMN id;
ALTER TABLE Ipecom regions ADD PRIMARY KEY("slug");


