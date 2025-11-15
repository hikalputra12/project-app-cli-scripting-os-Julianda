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

#fungsi untuk pengecekan jaringan
mengecek_jaringan(){
    jaringan=$(ss -tuln) #perintah untuk mengecek jaringan
    echo "$jaringan"
}

#fungsi main untuk pemilihan menjalankan seluruh program
main() {
    while true; do #melakukan pengulangan program
        echo "===pilihlah opsi berikut untuk mengecek kesehatan sistem anda ===="
        echo "(1). informasi sistem"
        echo "(2). penggunaan_CPU"
        echo "(3). penggunaan_memori"
        echo "(4). penggunaan_ruang_disk"
        echo "(5). mengecek_jaringan"
        echo "(6). keluar dari program"
        read -p "masukkan pilihan anda(1-6): " pilihan
        #kondisi berjalan sesuai perintah yang di input
        case "$pilihan" in
            "1")
                informasi_sistem
                ;;
            "2")
                penggunaan_CPU
                ;;
            "3")
                penggunaan_memori
                ;;
            "4")
                penggunaan_ruang_disk
                ;;
            "5") 
                mengecek_jaringan
                ;;
            "6")
                break;;
            *) 
                echo "Pilihan anda tidak valid. silakan pilih angka 1-6"
                ;;
        esac 
    done
}
main
