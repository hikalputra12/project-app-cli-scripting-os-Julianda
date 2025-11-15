#!/bin/bash

echo -e "=== Selamat datang di program pengecekan Generator Laporan Kesehatan Sistem device komputer ===\n"

informasi_sistem(){ 
    sistem=$(uname -a)
    echo "$sistem"
}