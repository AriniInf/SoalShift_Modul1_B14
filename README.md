# SoalShift_Modul1_B14

( Soal Nomor 1 )

Hal pertama yang dilakukan adalah extract file nature.zip dengan command “unzip nature.zip”. Kemudian untuk setiap file .jpg yang ada, dilakukan decrypt dengan command base64 -d. Karena hasil decrypt merupakan suatu bilangan Hexadecimal, maka perlu diubah dengan command “xxd -r” (xxd sendiri merupakan kebalikan dari hexdump yang berfungsi untuk mengubah suatu konten file menjadi hexadecimal, octal, ASCII dan decimal. )

Kemudian juga perlu menambahkan schedule baru pada crontab. Format nya yaitu “14 14 14 2 * bash /home/gipen/Documents/Sisop2k19/File1/nature/soal1.sh”. Hal ini menunjukkan bahwa akan di-bash soal1.sh pada tanggal 14 Februari jam 14.14. Selain itu ditambahkan juga schedule “0 0 * 2 fri bash /home/gipen/Documents/Sisop2k19/File1/nature/soal1.sh”. Ini menunjukkan bahwa selain pada tanggal 14 Februari, soal1.sh juga akan di-bash pada setiap hari Jumat pada bulan Februari.

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
 
 ( Soal Nomor 3 )
 
 Hal yang dilakukan pertama kali yaitu menghitung sekaligus memasukkan isi file password.txt kedalam array (count). Hal ini berguna untuk menentukan file keberapa ketika sebuah password terbuat. Selain itu juga bisa untuk membandingkan setiap password agar tidak ada yang sama.

Untuk generate password sendiri menggunakan command ini : pass=head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12

Urandom digunakan untuk meng-generate sembarang karakter. Namun karena output yang dihasilkan berupa pseudorandom number, maka perlu diterjemahkan (translate) ke karakter. Maka diperlukan command tr. Tr akan menerjemahkannya kedalam huruf atau angka. Karena kita hanya memerlukan 12 karakter, maka ditambahkan head -c 12.

Setelah password baru terbentuk, dilakukan looping untuk melihat apakah ada password yang ada sebelumnya. Jika ada, maka dilakukan generate lagi. Jika tidak, maka password akan dimasukkan ke file password[i].txt dengan I adalah indeks yang ada.


 
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

<pre><font color="#06989A">#!/bin/bash</font>

tambah<font color="#4E9A06">=`</font>date <font color="#FCE94F"><b>&quot;+%X&quot;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>
tambah<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#FCE94F"><b>&quot;$tambah&quot;</b></font> <font color="#4E9A06">|</font> bc<font color="#4E9A06">`</font>

x<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$tambah</b></font>+97<font color="#4E9A06">))</font>
x<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$x</b></font><font color="#4E9A06">))</font>
y<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%d&apos;</b></font> <font color="#FCE94F"><b>&quot;&apos;$x&quot;</b></font><font color="#4E9A06">)</font>
y<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$y</b></font>-1<font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$y</b></font> <font color="#4E9A06">-lt</font> 97 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    y<font color="#4E9A06">=</font>122
<font color="#4E9A06">fi</font>
y<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$y</b></font><font color="#4E9A06">))</font>

i<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$tambah</b></font>+65<font color="#4E9A06">))</font>
i<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$i</b></font><font color="#4E9A06">))</font>
j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%d&apos;</b></font> <font color="#FCE94F"><b>&quot;&apos;$i&quot;</b></font><font color="#4E9A06">)</font>
j<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$j</b></font>-1<font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$j</b></font> <font color="#4E9A06">-lt</font> 65 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    j<font color="#4E9A06">=</font>90
<font color="#4E9A06">fi</font>
j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$j</b></font><font color="#4E9A06">))</font>

hour<font color="#4E9A06">=`</font>date <font color="#FCE94F"><b>&quot;+%X&quot;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>
min<font color="#4E9A06">=`</font>date <font color="#FCE94F"><b>&quot;+%X&quot;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font><font color="#4E9A06">`</font>
day<font color="#4E9A06">=`</font>date <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $3}&apos;</b></font><font color="#4E9A06">`</font>
month<font color="#4E9A06">=`</font>date <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font><font color="#4E9A06">`</font>
year<font color="#4E9A06">=`</font>date <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $6}&apos;</b></font><font color="#4E9A06">`</font>

<font color="#729FCF"><b>cat</b></font> /var/log/syslog <font color="#4E9A06">|</font> tr <font color="#4E9A06">[</font>a<font color="#4E9A06">-z]</font> <font color="#4E9A06">[</font><font color="#FCE94F"><b>&quot;$x&quot;</b></font>-za-<font color="#FCE94F"><b>&quot;$y&quot;</b></font><font color="#4E9A06">]</font> <font color="#4E9A06">|</font> tr <font color="#4E9A06">[</font>A-Z<font color="#4E9A06">]</font> <font color="#4E9A06">[</font><font color="#FCE94F"><b>&quot;$i&quot;</b></font>-ZA-<font color="#FCE94F"><b>&quot;$j&quot;</b></font><font color="#4E9A06">]</font> <font color="#4E9A06">&gt;</font> <font color="#FCE94F"><b>&quot;$hour:$min $day-$month-$year&quot;</b></font>.txt</pre>

Jadi serangkaian program diatas mengerjakan nomor 4a-4c
dengan cara 
1. Mengambil waktu saat command dijalankan
2. Merubah String ke integer lalu menambahkannya dengan waktu,
3. Mengatur batas bawah dari huruf kecil a-z 
4. Mengatur batas bawah dari huruf besar A-Z
jika string kurang dari batas bawah maka akan dikembalikan ke a(jika kecil)/A(jika besar)
5. lalu mengambil waktu untuk menyimpan hasil dari program ini

d. Backup file syslog setiap jam. -> file ada pada file crontab
e. dan buatkan juga bash script untuk dekripsinya.

<pre><font color="#06989A">#!/bin/bash</font>

tambah<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>
tambah<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#FCE94F"><b>&quot;$tambah&quot;</b></font> <font color="#4E9A06">|</font> bc<font color="#4E9A06">`</font>
tambah<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$tambah</b></font>-1<font color="#4E9A06">))</font>

x<font color="#4E9A06">=$((</font>122-<font color="#EF2929"><b>$tambah</b></font><font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$x</b></font> <font color="#4E9A06">-gt</font> 122 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    x<font color="#4E9A06">=</font>97
<font color="#4E9A06">fi</font>
x<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$x</b></font><font color="#4E9A06">))</font>
y<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%d&apos;</b></font> <font color="#FCE94F"><b>&quot;&apos;$x&quot;</b></font><font color="#4E9A06">)</font>
y<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$y</b></font>-1<font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$y</b></font> <font color="#4E9A06">-lt</font> 97 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    y<font color="#4E9A06">=</font>122
<font color="#4E9A06">fi</font>
y<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$y</b></font><font color="#4E9A06">))</font>

i<font color="#4E9A06">=$((</font>90-<font color="#EF2929"><b>$tambah</b></font><font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$i</b></font> <font color="#4E9A06">-gt</font> 90 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    i<font color="#4E9A06">=</font>65
<font color="#4E9A06">fi</font>
i<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$i</b></font><font color="#4E9A06">))</font>
j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%d&apos;</b></font> <font color="#FCE94F"><b>&quot;&apos;$i&quot;</b></font><font color="#4E9A06">)</font>
j<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$j</b></font>-1<font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$j</b></font> <font color="#4E9A06">-lt</font> 65 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    j<font color="#4E9A06">=</font>90
<font color="#4E9A06">fi</font>
j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$j</b></font><font color="#4E9A06">))</font>
<pre>j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%d&apos;</b></font> <font color="#FCE94F"><b>&quot;&apos;$i&quot;</b></font><font color="#4E9A06">)</font>
j<font color="#4E9A06">=$((</font><font color="#EF2929"><b>$j</b></font>-1<font color="#4E9A06">))</font>
<font color="#4E9A06">if</font> <font color="#4E9A06">[</font> <font color="#EF2929"><b>$j</b></font> <font color="#4E9A06">-lt</font> 65 <font color="#4E9A06">]</font>
<font color="#4E9A06">then</font>
    j<font color="#4E9A06">=</font>90
<font color="#4E9A06">fi</font>
j<font color="#4E9A06">=$(</font><font color="#729FCF"><b>printf</b></font> <font color="#4E9A06">\\$(</font><font color="#729FCF"><b>printf</b></font> <font color="#FCE94F"><b>&apos;%03o&apos;</b></font> <font color="#EF2929"><b>$j</b></font><font color="#4E9A06">))</font>

hour<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>
min<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F<font color="#4E9A06">:</font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font><font color="#4E9A06">`</font>
day<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F- <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>
month<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F- <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font><font color="#4E9A06">`</font>
year<font color="#4E9A06">=`</font><font color="#729FCF"><b>echo</b></font> <font color="#EF2929"><b>$1</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> <font color="#FCE94F"><b>&apos;{print $2}&apos;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F- <font color="#FCE94F"><b>&apos;{print $3}&apos;</b></font> <font color="#4E9A06">|</font> <font color="#729FCF"><b>awk</b></font> -F. <font color="#FCE94F"><b>&apos;{print $1}&apos;</b></font><font color="#4E9A06">`</font>

<font color="#729FCF"><b>cat</b></font> <font color="#FCE94F"><b>&quot;$1&quot;</b></font> <font color="#4E9A06">|</font> tr <font color="#4E9A06">[</font>a<font color="#4E9A06">-z]</font> <font color="#4E9A06">[</font><font color="#FCE94F"><b>&quot;$x&quot;</b></font>-za-<font color="#FCE94F"><b>&quot;$y&quot;</b></font><font color="#4E9A06">]</font> <font color="#4E9A06">|</font> tr <font color="#4E9A06">[</font>A-Z<font color="#4E9A06">]</font> <font color="#4E9A06">[</font><font color="#FCE94F"><b>&quot;$i&quot;</b></font>-ZA-<font color="#FCE94F"><b>&quot;$j&quot;</b></font><font color="#4E9A06">]</font> <font color="#4E9A06">&gt;</font> <font color="#FCE94F"><b>&quot;$hour:$min $day-$month-$year&quot;</b></font>-decrip.txt</pre></pre>


   1. Mengambil waktu file yang dijalankan
   2. Merubah String ke integer lalu menambahkannya dengan waktu,
   3. Mengatur batas atas dari huruf kecil a-z
   4. Mengatur batas atas dari huruf besar A-Z jika string lebih dari batas atas maka akan dikembalikan ke a(jika kecil)/A(jika besar)
   5. Lalu mengambil waktu untuk menyimpan hasil dari program ini

( Soal Nomor 5 )

Input berasal dari isi file /var/log/syslog. Isinya diubah ke dalam bentuk lowercase terlebih dahulu. Jika ada record dengan jumlah field kurang dari 13 ( menggunakan variable NF) , tidak mengandung string “sudo” dan mengandung string “cron” (menggunakan fungsi match), maka record akan diprint ke file log yang berada di direktori /home/gipen/gipen/modul1/syslog.

Schedule baru juga ditambahkan dengan format 2-30/6 * * * * bash /home/gipen/Documents/Sisop2k19/File5/soal5.sh. Hal ini menunjukkan bahwa file soal 5.sh akan di-bash setiap 6 menit dari menit ke 2 sampai 30.
