# SoalShift_Modul1_B14


Soal Nomor 2

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:
  a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
    2012.
```echo -e  "a:\n"

awk -F, '{if($7 == "2012") a[$1]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr |awk 'NR == 1 {print $2,$3}' ```

b. Tentukan tiga product line yang memberikan penjualan(quantity)
    terbanyak pada soal poin a.
  c. Tentukan tiga product yang memberikan penjualan(quantity)
    terbanyak berdasarkan tiga product line yang didapatkan pada soal
    poin b.
