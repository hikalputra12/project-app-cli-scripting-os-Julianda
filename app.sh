#!/bin/bash

echo -e "=== Selamat datang di program pengecekan Generator Laporan Kesehatan Sistem device komputer ===\n"

#fungsi untuk pengecekan informasi sistem 
informasi_sistem(){ 
    sistem=$(uname -a) #perintah untuk informasi sistem seperti nama server, versi kernel,dll
    echo -e "berikut merupakan informasi sistem anda\n"
    echo "$sistem"

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p $'\napakah anda ingin menyimpan informasi sistem anda? (y/n): ' jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut laporan sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$sistem" >> laporan_kesehatan_sistem.txt
            echo "laporan informasi sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        else
            echo "pilihan anda tidak valid silakan pilih (y/n)"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan CPU
penggunaan_CPU(){
    cpu_use=$(top -bn1)
    echo -e "berikut merupakan informasi penggunaan CPU sistem anda\n"
    echo "$cpu_use"  #perintah untuk mengecek penggunaan CPU

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p $'\napakah anda ingin menyimpan informasi penggunaan CPU sistem anda?(y/n)?: ' jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan CPU sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$cpu_use" >> laporan_kesehatan_sistem.txt
            echo "laporan penggunaan CPU sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        else
            echo "pilihan anda tidak valid silakan pilih (y/n)"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan memori
penggunaan_memori(){
    memori=$(free -h)
    echo -e "berikut merupakan informasi penggunaan memori sistem anda\n"
    echo "$memori" #perintah untuk mengecek penggunaan  memori

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p $'\napakah anda ingin menyimpan informasi penggunaan memori sistem anda?(y/n)?: ' jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan memori sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$memori" >> laporan_kesehatan_sistem.txt
            echo "laporan penggunaan memori sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        else
            echo "pilihan anda tidak valid silakan pilih (y/n)"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan ruang disk
penggunaan_ruang_disk(){
    ruang_disk=$(df -h) #perintah untuk mengecek penggunaan penggunaan ruang disk
    echo -e "berikut merupakan informasi penggunaan ruang disk sistem anda\n"   
    echo "$ruang_disk"
    
    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p $'\napakah anda ingin menyimpan informasi penggunaan ruang disk sistem anda?(y/n)?: ' jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan ruang disk sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$ruang_disk" >> laporan_kesehatan_sistem.txt
            echo "laporan penggunaan ruang disk sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        else
            echo "pilihan anda tidak valid silakan pilih (y/n)"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan jaringan
mengecek_jaringan(){
    jaringan=$(ss -tuln) #perintah untuk mengecek jaringan
    echo -e "berikut merupakan informasi pengecekan jaringan anda\n"   
    echo "$jaringan"

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p $'\napakah anda ingin menyimpan informasi pengecekan jaringan sistem anda?(y/n)?: ' jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut pengecekan jaringan sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$$jaringan" >> laporan_kesehatan_sistem.txt
            echo "laporan pengecekan jaringan sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        else
            echo "pilihan anda tidak valid silakan pilih (y/n)"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
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
                break
                ;;
            *) 
                echo "Pilihan anda tidak valid. silakan pilih angka 1-6"
                ;;
        esac 
    done
}
main
