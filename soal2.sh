#a
echo -e  "a:\n"

awk -F, '{if($7 == "2012") a[$1]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr |awk 'NR == 1 {print $2,$3}'

echo -e  "\nb:\n"
#b
awk -F, '{if($1 == "United States" && $7 == "2012") a[$4]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3}'
echo -e  "\nc-Personal Accessories\n"
#c Personal Accessories
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories") a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <=3 {print $2,$3,$4}'

echo -e "\nc-Camping Equipment\n"
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Camping Equipment") a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'

echo -e "\nc-Outdoor Protection\n"
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Outdoor Protection") a[$6]+=$10} END {for(hasil in a) {print a[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'
