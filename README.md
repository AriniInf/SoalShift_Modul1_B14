# SoalShift_Modul1_B14


Soal Nomor 2

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:

  a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
    2012.
echo -e  "a:\n"

awk -F, '{if($7 == "2012") a[$1]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr |awk 'NR == 1 {print $2,$3}'

  b. Tentukan tiga product line yang memberikan penjualan(quantity)
  terbanyak pada soal poin a.
awk -F, '{if($1 == "United States" && $7 == "2012") a[$4]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3}'

  c. Tentukan tiga product yang memberikan penjualan(quantity)
terbanyak berdasarkan tiga product line yang didapatkan pada soal
poin b.

  #Personal Accessories
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories") a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <=3 {print $2,$3,$4}'
  
  #<pre><font color="#FCE94F"><b>Camping Equipment&quot;</b></font>
<font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot; &amp;&amp; $4 == &quot;#Camping Equipment&quot;) a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'</pre>
 
 <pre><font color="#FCE94F"><b>#Outdoor Protection&quot;</b></font>
<font color="#729FCF"><b>awk</b></font> -F, <font color="#FCE94F"><b>&apos;{if($1 == &quot;United States&quot; &amp;&amp; $7 == &quot;2012&quot; &amp;&amp; $4 == &quot;Outdoor Protection&quot;) a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}&apos;</b></font> WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'</pre>
