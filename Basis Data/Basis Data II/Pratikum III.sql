create database db_rs;
use db_rs;

CREATE TABLE pasien (
    idPasien VARCHAR(11),
    namaPasien VARCHAR(20),
    alamat VARCHAR(20),
    golda VARCHAR(2),
    Penyakit VARCHAR(20),
    PRIMARY KEY (idPasien)
);

CREATE TABLE dokter (
    idDokter VARCHAR(11),
    namaDokter VARCHAR(20),
    idPasien VARCHAR(20),
    PRIMARY KEY (idDokter),
    FOREIGN KEY (idPasien)
        REFERENCES pasien (idPasien)
);

CREATE TABLE perawat (
    idPerawat VARCHAR(11),
    namaPerawat VARCHAR(20),
    idDokter VARCHAR(20),
    PRIMARY KEY (idPerawat),
    FOREIGN KEY (idDokter)
        REFERENCES dokter (idDokter)
);

insert into pasien values
('01P','Jein','Makkasar','A','Batuk'),
('02P','Ryu','Sudiang','AB','Muntaber'),
('03P','Chou','Maros','O','Tipes');

insert into dokter values
('01D','Stone','01P'),
('02D','Stranger','03P'),
('03D','Rindaman',null);

insert into perawat values
('01PR','Siskaee','02D'),
('02PR','Hitomi','03D'),
('03PR','Tanaka','01D');

SELECT 
	pasien.idPasien,
	pasien.namaPasien,
    pasien.penyakit,
    dokter.namaDokter,
    perawat.namaPerawat
FROM
    pasien
        INNER JOIN
    dokter ON pasien.idPasien = dokter.idPasien
		inner Join perawat on dokter.idDokter = perawat.idDokter;

SELECT 
    pasien.idPasien,
    pasien.namaPasien,
    pasien.penyakit,
    dokter.namaDokter
FROM
    pasien
        LEFT JOIN
    dokter ON pasien.idpasien = dokter.idpasien;
    

SELECT 
    dokter.*, perawat.namaPerawat
FROM
    dokter
    left join
    perawat ON dokter.iddokter = perawat.iddokter;
    
    
desc pasien;
desc dokter;
desc perawat;

select * from pasien;
select * from dokter;
select * from perawat;