#!/bin/bash

echo -e "=== Selamat datang di program pengecekan Generator Laporan Kesehatan Sistem device komputer ===\n"

#fungsi untuk pengecekan informasi sistem 
informasi_sistem(){ 
    sistem=$(uname -a) #perintah untuk informasi sistem seperti nama server, versi kernel,dll
    echo "$sistem"
}

#fungsi untuk pengecekan penggunaan CPU
penggunaan_CPU(){
    cpu_use=$(top -bn1)
    echo "$cpu_use"  #perintah untuk mengecek penggunaan CPU
}

#fungsi untuk pengecekan penggunaan memori
penggunaan_memori(){
    memori=$(free -h)
    echo "$memori" #perintah untuk mengecek penggunaan  memori
}

#fungsi untuk pengecekan penggunaan ruang disk
penggunaan_ruang_disk(){
    ruang_disk=$(df -h) #perintah untuk mengecek penggunaan penggunaan ruang disk
    echo "$ruang_disk"
}
