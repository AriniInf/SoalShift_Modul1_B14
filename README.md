# SoalShift_Modul1_B14


(Soal Nomor 2) 

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:

  a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
    2012.
echo -e  "a:\n"

<pre><font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($7 == &quot;2012&quot;) a[$1]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv <font color="#4E9A06">|</font> sort -nr <font color="#4E9A06">|</font><font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;NR == 1 {print $2,$3}&apos;</b></font></pre>

   Cari di kolom ke-7 dengan tahun 2012, Totalkan Quantity pada setiap nama negara, Urutkan dari total Quantity terbanyak, Pilih record yang paling atas, Cetak hasil record tersebut.


  b. Tentukan tiga product line yang memberikan penjualan(quantity)
  terbanyak pada soal poin a.
<pre><font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot;) a[$4]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv <font color="#4E9A06">|</font> sort -nr <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;NR &lt;= 3 {print $2,$3}'</b></font></pre>

   Cari di kolom ke-1 dengan nama "United States" dan di kolom ke-7 dengan tahun "2012", Quantity dengan product line yang sama akan dijumlah, Urutkan dari Quantity terbanyak, Pilih 3 record teratas, Cetak hasil record tersebut.

  c. Tentukan tiga product yang memberikan penjualan(quantity)
terbanyak berdasarkan tiga product line yang didapatkan pada soal
poin b.

  <pre><font color="#06989A">#Personal Accessories</font>
<font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot; &amp;&amp; $4 == &quot;Personal Accessories&quot;) a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <=3 {print $2,$3,$4}'</pre>
  
  Cari kolom ke-1 “United States” dan kolom ke-7 "2012" dan Product Line "Personal Accessories", Setiap nilai di dalam kolom Quantity dengan isi kolom Product yang sama akan dijumlahkan, Urutkan dari Quantity terbanya, Pilih 3 record teratas, Cetak hasil record tersebut.
  
  
  <pre><font color="#FCE94F"><b>#Camping Equipment</b></font>
<font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot; &amp;&amp; $4 == &quot;#Camping Equipment&quot;) a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'</pre>
  
  Cari kolom ke-1 “United States” dan kolom ke-7 "2012" dan Product Line "Camping Equipment", Setiap nilai di dalam kolom Quantity dengan isi kolom Product yang sama akan dijumlahkan, Urutkan dari Quantity terbanya, Pilih 3 record teratas, Cetak hasil record tersebut.
 
 <pre><font color="#FCE94F"><b>#Outdoor Protection&quot;</b></font> 
<font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot; &amp;&amp; $4 == &quot;Outdoor Protection&quot;) a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'</pre>
  
  Cari kolom ke-1 “United States” dan kolom ke-7 "2012" dan Product Line "Outdoor Protection", Setiap nilai di dalam kolom Quantity dengan isi kolom Product yang sama akan dijumlahkan, Urutkan dari Quantity terbanya, Pilih 3 record teratas, Cetak hasil record tersebut.
 
 ( Soal Nomor 4 )
  
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-
bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string
manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai
berikut:

a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan
pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki
urutan ke 12+2 = 14.
b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke
empat belas, dan seterusnya.
c. setelah huruf z akan kembali ke huruf a 
d. Backup file syslog setiap jam. -> file ada pada file crontab
e. dan buatkan juga bash script untuk dekripsinya.
