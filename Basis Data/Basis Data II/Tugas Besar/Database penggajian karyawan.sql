create database penggajian;
use penggajian;


CREATE TABLE pegawai (
    id_pegawai VARCHAR(6),
    nama_pegawai VARCHAR(20),
    alamat VARCHAR(20),
    jenis_kelamin ENUM('L', 'P'),
    bagian ENUM('Karyawan', 'Kurir', 'Admin'),
    PRIMARY KEY (id_pegawai)
);

CREATE TABLE slip_gaji (
    id_slip VARCHAR(6),
    id_pegawai VARCHAR(6),
    jumlah_gaji INT(11),
    PRIMARY KEY (id_slip),
    FOREIGN KEY (id_pegawai)
        REFERENCES pegawai (id_pegawai)
);


insert into pegawai values
('P001','Raja','Jl.Nangka No 21E','L','Kurir'),
('P002','Putri','Jl.Durian No 51A','P','Karyawan'),
('P003','Aisyah','Jl.Rambutan No 11D','P','Admin'),
('P004','Felix','Jl.Manggis No 69B','L','Karyawan');

insert into slip_gaji values
('S001','P001',1700000),
('S002','P002',2800000),
('S003','P003',5000000),
('S004','P004',2800000);


SELECT 
    pegawai.id_pegawai,
    pegawai.nama_pegawai,
    pegawai.bagian,
    slip_gaji.jumlah_gaji
FROM
    pegawai
        INNER JOIN
    slip_gaji ON pegawai.id_pegawai = slip_gaji.id_pegawai;


CREATE VIEW ViewSlipGaji AS
    SELECT 
        pegawai.id_pegawai,
        pegawai.nama_pegawai,
        pegawai.bagian,
        slip_gaji.jumlah_gaji
    FROM
        pegawai
            INNER JOIN
        slip_gaji ON pegawai.id_pegawai = slip_gaji.id_pegawai;


delimiter $$
	create procedure tambahKaryawan(
    in id_pegawai VARCHAR(6),
    in nama_pegawai VARCHAR(20),
    in alamat VARCHAR(20),
    in jenis_kelamin ENUM('L', 'P'),
    in bagian ENUM('Karyawan', 'Kurir', 'Admin')
    )
    
    begin
    
    insert into pegawai values
    (id_pegawai,nama_pegawai,alamat,jenis_kelamin,bagian);
    
    end $$
    
delimiter ;
    
    
call tambahKaryawan('P005','Arap','Jl.Markisa No 77F','L','Kurir');

delimiter $$

create trigger hapusGaji before delete on pegawai
for each row

begin

delete from slip_gaji where id_pegawai=old.id_pegawai;

end $$

delimiter ;

delete from pegawai where id_pegawai='P001';

















#Perintah SELECT
SELECT * FROM pegawai;
SELECT * FROM Slip_gaji;
SELECT * FROM viewSlipGaji;

#perintah SHOW
show tables;

#peintah DESC
desc pegawai;
desc slip_gaji;
desc viewSlipGaji;

#perintah DROP
drop table pegawai;
drop table slip_gaji;
drop view viewSlipGaji;
drop procedure tambahKaryawan;	
