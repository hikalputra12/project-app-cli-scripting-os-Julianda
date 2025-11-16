#!/bin/bash

#mendefinisikan kode warna agar mudah di gunakan
merah='\033[31m'
hijau='\033[32m'
kuning='\033[33m'
biru='\033[34m'
cyan='\033[36m'
tebal='\033[1m' #membuat warna jadi bold
reset='\033[0m' #menghentikan pewarnaan

echo -e "${cyan}===Program pengecekan Generator Laporan Kesehatan Sistem device komputer ===${reset}\n"

#fungsi untuk pengecekan informasi sistem 
informasi_sistem(){ 
    sistem=$(uname -a) #perintah untuk informasi sistem seperti nama server, versi kernel,dll
    echo -e "${hijau}berikut merupakan informasi sistem anda\n${reset}"
    echo "$sistem"

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p "$(echo -e "\n${biru}apakah anda ingin menyimpan informasi sistem anda? (y/n): ${reset}")" jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut laporan sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$sistem" >> laporan_kesehatan_sistem.txt
            echo -e "${kuning}laporan informasi sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut ${reset}\n"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        elif [ -z $jawaban ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
            input_pilihan
        else
            echo -e "${merah}pilihan anda tidak valid silakan pilih (y/n)${reset}"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan CPU
penggunaan_CPU(){
    cpu_use=$(top -bn1)
    echo -e "${hijau}berikut merupakan informasi penggunaan CPU sistem anda\n${reset}"
    echo "$cpu_use"  #perintah untuk mengecek penggunaan CPU

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p "$(echo -e "\n${biru}apakah anda ingin menyimpan informasi penggunaan CPU sistem anda? (y/n): ${reset}")" jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan CPU sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$cpu_use" >> laporan_kesehatan_sistem.txt
            echo -e "${kuning}laporan penggunaan CPU sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut${reset}\n"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        elif [ -z $jawaban ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
            input_pilihan
        else
            echo -e "${merah}pilihan anda tidak valid silakan pilih (y/n)${reset}"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan memori
penggunaan_memori(){

    #melakukan pengecekan penggunaan memori

    #initialisasi nilai awal batas memori yang di pakai 
    batas_ruang=90

    #pengecekan ambang batas memori 
    persentase_memori=$(free -h | awk '/Mem:/{ total=$2; used=$3; printf "%.0f",(used/total)*100}' )
    #free -h yaitu perintah untuk mengecek penggunaan memori
    #awk "/Mem:/{total=$2,used=$3 mengambil nilai yang ada kata Mem dan total memori pada kolom ke 2 (dan memasukkannya ke dalam variabel total ) dan memori terpakai pada kolom ketiga dan memasukkan ke variabel used
    #printf "%.0f",(used/total)*100} melakukan operasi aritmatika untuk mendapatkan persentasenya dan melakukan pembulatan

    if [  $persentase_memori -gt $batas_ruang ]; then
        echo -e "pengguanan memori anda sekarang : ${merah}$persentase_memori% ${reset}"
        echo -e "${merah}penggunaan memori anda di luar ambang batas penggunaan yang seharusnya ${hijau}$batas_ruang%${reset},${merah}mohon kurangi sebesar $(($persentase_memori - $batas_ruang))% agar menjaga kesehatan komputer anda${reset}"
    else
        echo -e "penggunaan memori anda berada pada batas aman : ${hijau}$persentase_memori%${reset}"
    fi
   
    memori=$(free -h)
    echo -e "${hijau}berikut merupakan informasi penggunaan memori sistem anda\n${reset}"
    echo "$memori" #perintah untuk mengecek penggunaan  memori

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p "$(echo -e "\n${biru}apakah anda ingin menyimpan informasi penggunaan memori sistem anda? (y/n): ${reset}")" jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan memori sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$memori" >> laporan_kesehatan_sistem.txt
            echo -e "${kuning} laporan penggunaan memori sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut${reset}\n"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        elif [ -z $jawaban ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
            input_pilihan
        else
            echo -e "${merah}pilihan anda tidak valid silakan pilih (y/n)${reset}"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan penggunaan ruang disk
penggunaan_ruang_disk(){

    #melakukan pengecekan penggunaan ruang disk

    #initialisasi nilai awal ruang disk 
    batas_ruang=85

    #pengecekan ambang batas
    persentase_ruang_disk=$(df -h | awk 'NR==2 {print $5}' | sed 's/%//g')
    #df -h yaitu perintah untuk mengecek penggunaan penggunaan ruang disk
    #awk 'NR==2 {print $5}' mengambil nilai di baris 2 kolom ke 5
    #sed 's/%//g' menghapus % dan menjadikannya nilai integer dengan pola sed 'variabel dari awk/pola_lama/pola_baru/flag'

    if [  $persentase_ruang_disk -gt $batas_ruang ]; then
        echo -e "pengguanan ruang disk anda sekarang : ${merah}$persentase_ruang_disk% ${reset}"
        echo -e "${merah}penggunaan ruang disk anda di luar ambang batas penggunaan yang seharusnya ${hijau}$batas_ruang%${reset},${merah}mohon kurangi sebesar $(($persentase_ruang_disk - $batas_ruang))% agar menjaga kesehatan komputer anda${reset}"
    else
        echo -e "penggunaan ruang disk anda berada pada batas aman : ${hijau}$persentase_ruang_disk%${reset}"
    fi
    ruang_disk=$(df -h) #perintah untuk mengecek penggunaan penggunaan ruang disk
    echo -e "${hijau}berikut merupakan informasi penggunaan ruang disk sistem anda\n${reset}"   
    echo "$ruang_disk"
    
    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p "$(echo -e "\n${biru}apakah anda ingin menyimpan informasi penggunaan ruang disk sistem anda? (y/n): ${reset}")" jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut penggunaan ruang disk sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$ruang_disk" >> laporan_kesehatan_sistem.txt
            echo -e " ${kuning}laporan penggunaan ruang disk sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut${reset}\n"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        elif [ -z $jawaban ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
            input_pilihan
        else
            echo -e "${merah}pilihan anda tidak valid silakan pilih (y/n)${reset}"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi untuk pengecekan jaringan
mengecek_jaringan(){
    jaringan=$(ss -tuln) #perintah untuk mengecek jaringan
    echo -e "${hijau}berikut merupakan informasi pengecekan jaringan anda\n${reset}"   
    echo "$jaringan"

    #fungsi validasi ingin menyimpan hasil laporan
    input_pilihan(){
        read -e -p "$(echo -e "\n${biru}apakah anda ingin menyimpan informasi pengecekan jaringan sistem anda? (y/n): ${reset}")" jawaban
        if [[ $jawaban == "y" || $jawaban == "Y" ]]; then
            echo -e "\nberikut pengecekan jaringan sistem anda pada $(date)\n" >> laporan_kesehatan_sistem.txt
            echo "$$jaringan" >> laporan_kesehatan_sistem.txt
            echo -e "${kuning}laporan pengecekan jaringan sistem anda tersimpan di file laporan_kesehatan_sistem.txt, silakan periksa file tersebut${reset}\n"
        elif [[ $jawaban == "n" || $jawaban == "N" ]]; then
            main
        elif [ -z $jawaban ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
            input_pilihan
        else
            echo -e "${merah}pilihan anda tidak valid silakan pilih (y/n)${reset}"
            input_pilihan
        fi
    }
    input_pilihan #pemanggilan fungsi
}

#fungsi main untuk pemilihan menjalankan seluruh program
main() {
    while true; do #melakukan pengulangan program
        echo -e "${cyan}===pilihlah opsi berikut untuk mengecek kesehatan sistem anda ====${reset}"
        echo -e "${kuning}(1).${reset} ${tebal}${biru}informasi sistem${reset}"
        echo -e "${kuning}(2).${reset} ${tebal}${biru}penggunaan CPU${reset}"
        echo -e "${kuning}(3).${reset} ${tebal}${biru}penggunaan memori${reset}"
        echo -e "${kuning}(4).${reset} ${tebal}${biru}penggunaan ruang_disk${reset}"
        echo -e "${kuning}(5).${reset} ${tebal}${biru}mengecek jaringan${reset}" 
        echo -e "${kuning}(6).${reset} ${tebal}${biru}keluar dari program${reset}"
        read -p "$(echo -e "${tebal}${hijau}masukkan pilihan anda(1-6): ${reset}" )" pilihan
        #menambahkan data validasi untuk input yang kosong
        if [ -z "$pilihan" ]; then
            echo -e "${merah} input yang anda masukkan tidak boleh kosong ${reset}"
        else
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
                    exit 0
                    ;;
                *) 
                    echo -e "${merah} Pilihan anda tidak valid. silakan pilih angka 1-6"
                    ;;
            esac 
        fi
    done
}
main
