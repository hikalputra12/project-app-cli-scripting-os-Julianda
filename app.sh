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

#fungsi untuk pengecekan penggunaan_memori
penggunaan_memori(){
    memori=$(free -h)
    echo "$memori" #perintah untuk mengecek penggunaan_memori
}


