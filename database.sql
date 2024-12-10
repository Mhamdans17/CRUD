CREATE DATABASE pedaftaran_siswa;

USE pedaftaran_siswa;

CREATE TABLE siswa (
                       siswa_id INT AUTO_INCREMENT PRIMARY KEY,
                       nama VARCHAR(100) NOT NULL,
                       tanggal_lahir DATE NOT NULL,
                       jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
                       alamat TEXT NOT NULL,
                       no_telepon VARCHAR(15),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE wali_siswa (
                            wali_id INT AUTO_INCREMENT PRIMARY KEY,
                            siswa_id INT NOT NULL,
                            nama_wali VARCHAR(100) NOT NULL,
                            hubungan ENUM('Orang Tua', 'Wali', 'Lainnya') NOT NULL,
                            no_telepon_wali VARCHAR(15),
                            alamat_wali TEXT,
                            FOREIGN KEY (siswa_id) REFERENCES siswa(siswa_id) ON DELETE CASCADE
);


CREATE TABLE data_pendaftaran (
                                  pendaftaran_id INT AUTO_INCREMENT PRIMARY KEY,
                                  siswa_id INT NOT NULL,
                                  tanggal_daftar DATE NOT NULL,
                                  status_pendaftaran ENUM('Pending', 'Diterima', 'Ditolak') DEFAULT 'Pending',
                                  keterangan TEXT,
                                  FOREIGN KEY (siswa_id) REFERENCES siswa(siswa_id) ON DELETE CASCADE
);

INSERT INTO siswa (nama, tanggal_lahir, jenis_kelamin, alamat, no_telepon)
VALUES ('Andi Setiawan', '2008-05-10', 'Laki-laki', 'Jl. Merdeka No.10', '081234567890');

INSERT INTO wali_siswa (siswa_id, nama_wali, hubungan, no_telepon_wali, alamat_wali)
VALUES (1, 'Budi Setiawan', 'Orang Tua', '081234567891', 'Jl. Merdeka No.10');

INSERT INTO data_pendaftaran (siswa_id, tanggal_daftar, status_pendaftaran, keterangan)
VALUES (1, '2024-12-10', 'Pending', 'Dokumen lengkap');