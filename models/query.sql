CREATE TABLE komoditi_raw (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`sentra_id` INT(10) UNSIGNED NOT NULL,
	`sentra` VARCHAR(100) NOT NULL,
	`area_id` INT(10) UNSIGNED NOT NULL,
	`kodepos` INT(6) UNSIGNED NOT NULL,
	`komoditi_id` INT(10) UNSIGNED NOT NULL,
	`komoditi` VARCHAR(100) NOT NULL,
	`raw_nama` VARCHAR(50) NOT NULL,
	`raw_jenis` VARCHAR(50) NOT NULL,
	`kuantitas` INT(7) UNSIGNED NOT NULL,
	`harga` INT(11) UNSIGNED NOT NULL,
	`satuan` VARCHAR(10) NOT NULL,
	`unitprice` INT(10) UNSIGNED NOT NULL,
	`user_id` INT(10) UNSIGNED NOT NULL,
	`points` INT(10) UNSIGNED NOT NULL,
	`source` VARCHAR(30) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) Engine=InnoDB;

CREATE TABLE komoditi_distribusi (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`sentra_id` INT(10) UNSIGNED NOT NULL,
	`sentra` VARCHAR(100) NOT NULL,
	`area_id` INT(10) UNSIGNED NOT NULL,
	`kodepos` INT(6) UNSIGNED NOT NULL,
	`longitude` DECIMAL(10,0) NULL,
	`latitude` DECIMAL(10,0) NULL,
	`harga` INT(11) UNSIGNED NOT NULL,
	`max` FLOAT UNSIGNED NOT NULL,
	`min` FLOAT UNSIGNED NOT NULL,
	`responden` INT(11) UNSIGNED NOT NULL,
	`stddev` FLOAT UNSIGNED NOT NULL,
	`satuan` VARCHAR(10) NOT NULL,
	`komoditi_id` INT(10) UNSIGNED NOT NULL,
	`komoditi` VARCHAR(100) NOT NULL,
	`source` VARCHAR(30) NOT NULL,
	`date` DATE NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) Engine=InnoDB;

CREATE TABLE source (
	`source` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`source`)
)Engine=InnoDB;

CREATE TABLE user (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`handphone` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE sentra (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`jenis` ENUM('produsen','pasar') NOT NULL DEFAULT 'pasar',
	`nama` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE satuan (
	`satuan` VARCHAR(10) NOT NULL,
	PRIMARY KEY(`satuan`)
) ENGINE=InnoDB;

CREATE TABLE komoditi (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`nama` VARCHAR(50) NOT NULL,
	`jenis` VARCHAR(50) NOT NULL,
	`packaging` VARCHAR(50) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE komoditi_nama (
	`nama` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`nama`)
) ENGINE=InnoDB;

CREATE TABLE kodepos (
	`kodepos` INT(6) UNSIGNED NOT NULL,
	PRIMARY KEY (`kodepos`)
) ENGINE=InnoDB;

CREATE TABLE area (
	`id` INT(10) UNSIGNED NOT NULL auto_increment,
	`kodepos` INT(6) UNSIGNED NOT NULL,
	`kelurahan` VARCHAR(50) NOT NULL,
	`kecamatan` VARCHAR(50) NOT NULL,
	`jenis` VARCHAR(50) NOT NULL,
	`kabupaten` VARCHAR(50) NOT NULL,
	`provinsi` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_source FOREIGN KEY (`source`) REFERENCES source(`source`);

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_area FOREIGN KEY (`area_id`) REFERENCES area(`id`);

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_komoditi FOREIGN KEY (`komoditi_id`) REFERENCES komoditi(`id`);

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_sentra FOREIGN KEY (`sentra_id`) REFERENCES sentra(`id`);

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_satuan FOREIGN KEY (`satuan`) REFERENCES satuan(`satuan`);

ALTER TABLE komoditi_raw ADD CONSTRAINT kr_has_user FOREIGN KEY (`user_id`) REFERENCES user(`id`);

ALTER TABLE komoditi_distribusi ADD CONSTRAINT kd_has_source FOREIGN KEY (`source`) REFERENCES source(`source`);

ALTER TABLE komoditi_distribusi ADD CONSTRAINT kd_has_area FOREIGN KEY (`area_id`) REFERENCES area(`id`);

ALTER TABLE komoditi_distribusi ADD CONSTRAINT kd_has_komoditi FOREIGN KEY (`komoditi_id`) REFERENCES komoditi(`id`);

ALTER TABLE komoditi_distribusi ADD CONSTRAINT kd_has_sentra FOREIGN KEY (`sentra_id`) REFERENCES sentra(`id`);

ALTER TABLE komoditi_distribusi ADD CONSTRAINT kd_has_satuan FOREIGN KEY (`satuan`) REFERENCES satuan(`satuan`);

ALTER TABLE area ADD CONSTRAINT area_has_kodepos FOREIGN KEY (`kodepos`) REFERENCES kodepos(`kodepos`);

ALTER TABLE komoditi ADD CONSTRAINT komoditi_has_nama FOREIGN KEY (`nama`) REFERENCES komoditi_nama(`nama`);

