# Program pengecekan Generator Laporan Kesehatan Sistem device komputer
Program ini adalah script Bash yang berfungsi sebagai alat Command Line Interface (CLI) untuk memonitor dan menghasilkan laporan kesehatan sistem komputer (Linux/Unix). Program ini dirancang untuk memberikan informasi real-time mengenai sumber daya utama (CPU, Memori, Disk) dan menyediakan mekanisme peringatan menggunakan operasi aritmatika dan perbandingan.

## 🌟 Fitur Utama

* **Pengecekan Komprehensif:** Mampu menampilkan Informasi Sistem, Penggunaan CPU, Memori, Ruang Disk, dan Jaringan.
* **Peringatan Ambang Batas:** memberikan peringatan jika penggunaan sumber daya melampaui batas aman.
* **Generator/pembuat Laporan:** Menyediakan opsi untuk menyimpan semua hasil pengecekan ke dalam file `laporan_kesehatan_sistem.txt`.

## ⚙️ Cara Menjalankan Program

### Persyaratan

* Sistem Operasi berbasis Unix/Linux (seperti Ubuntu, Fedora, macOS).
* Shell Bash.
* Utilitas sistem standar: `uname`, `top`, `free`, `df`, `ss`, `awk`, `sed`.

### Langkah Instalasi (Eksekusi)

1.  **Simpan Skrip:** Simpan kode di atas sebagai file (misalnya, `app.sh`).
2.  **Berikan Izin Eksekusi:** Berikan izin agar skrip dapat dijalankan.
    chmod +x app.sh
3.  **Jalankan Program:**
    ./app.sh

## 💻 Panduan Penggunaan

Setelah menjalankan `./app.sh`, Anda akan disajikan menu utama:

1.  Pilih opsi (1-5) untuk menjalankan pengecekan sistem tertentu (misalnya, 3 untuk Memori).
2.  Program akan menampilkan hasilnya di terminal.
3.  Anda akan diminta untuk memilih (y/n) apakah ingin menyimpan hasil laporan ke `laporan_kesehatan_sistem.txt`.
4.  Pilih 6 untuk keluar dari program.

## 💻 Video Penjelasan Program dan Panduan Penggunaan
anda bisa menonton videonya pada link berikut: [link video penjelasan code](https://drive.google.com/file/d/1FMiDVe77YIvjz5u5EGfu8fckRvIbsqfW/view?usp=sharing)