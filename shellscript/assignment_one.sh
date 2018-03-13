#!/bin/bash

 pdftotext -layout result2_MDL.pdf result2_MDL.txt
 pdftotext -layout result1_MDL.pdf result1_MDL.txt

 grep -A 1 "MDL16CS" result2_MDL.txt >sem2_result.txt
 grep -A 1 "MDL16CS" result1_MDL.txt >sem1_result.txt


 sed -i 's/CY100(/ /g' sem2_result.txt
 sed -i 's/BE100(/ /g' sem2_result.txt
 sed -i 's/EC100(/ /g' sem2_result.txt
 sed -i 's/CY110(/ /g' sem2_result.txt
 sed -i 's/EC110(/ /g' sem2_result.txt
 sed -i 's/MA102(/ /g' sem2_result.txt
 sed -i 's/BE102(/ /g' sem2_result.txt
 sed -i 's/CS100(/ /g' sem2_result.txt
 sed -i 's/CS120(/ /g' sem2_result.txt
 sed -i 's/--/ /g' sem2_result.txt
 tr -d "\n" <sem2_result.txt> result2.txt
 sed -i 's/MDL/\nMDL/g' result2.txt
 sed -i 's/                  / /g' result2.txt
 sed -i 's/              / /g' result2.txt
 sed -i 's/        / /g' result2.txt
 sed -i 's/    / /g' result2.txt
 sed -i 's/, / /g' result2.txt


 sed -i 's/MA101(/ /g' sem1_result.txt
 sed -i 's/PH100(/ /g' sem1_result.txt
 sed -i 's/BE110(/ /g' sem1_result.txt
 sed -i 's/BE10105(/ /g' sem1_result.txt
 sed -i 's/BE103(/ /g' sem1_result.txt
 sed -i 's/EE100(/ /g' sem1_result.txt
 sed -i 's/PH110(/ /g' sem1_result.txt
 sed -i 's/EE110(/ /g' sem1_result.txt
 sed -i 's/CS110(/ /g' sem1_result.txt
 sed -i 's/--/ /g' sem1_result.txt
 tr -d "\n" <sem1_result.txt> result1.txt
 sed -i 's/MDL/\nMDL/g' result1.txt
 sed -i 's/                  / /g' result1.txt
 sed -i 's/              / /g' result1.txt
 sed -i 's/        / /g' result1.txt
 sed -i 's/    / /g' result1.txt
 sed -i 's/, / /g' result1.txt


 sed -i 's/O)/10/g' result1.txt
 sed -i 's/A+)/9/g' result1.txt
 sed -i 's/A)/8.5/g' result1.txt
 sed -i 's/B+)/8/g' result1.txt
 sed -i 's/B)/7/g' result1.txt
 sed -i 's/C)/6/g' result1.txt
 sed -i 's/P)/5/g' result1.txt
 sed -i 's/F)/0/g' result1.txt



 sed -i 's/O)/10/g' result2.txt
 sed -i 's/A+)/9/g' result2.txt
 sed -i 's/A)/8.5/g' result2.txt
 sed -i 's/B+)/8/g' result2.txt
 sed -i 's/B)/7/g' result2.txt
 sed -i 's/C)/6/g' result2.txt
 sed -i 's/P)/5/g' result2.txt
 sed -i 's/F)/0/g' result2.txt


 awk '{print $1 " " $2 $3 $4 " " $5 " " $6 " " $7 " " $8}' csb.txt >Csb.txt




 join -1 4 -2 1 Csb.txt result2.txt >cs_sem2.txt
 join -1 4 -2 1 Csb.txt result1.txt >cs_sem1.txt




 awk '{print($1" "($7 * 4 + $8 * 4 + $9 * 3 + $10 * 3 + $11 * 3 + $12 * 3 + $13 * 1 + $14 * 1 + $15 * 1)/23)}' cs_sem1.txt >temp1.txt
 awk '{print($1" "($7 * 4 + $8 * 4 + $9 * 3 + $10 * 1 + $11 * 1 + $12 * 4 + $13 * 3 + $14 * 3  + $15 * 1)/24)}' cs_sem2.txt >temp2.txt
 join -1 1 -2 1 temp1.txt temp2.txt >temp.txt



 sed -i 's/MDL/\nMDL/g' temp1.txt
 sed -i 's/MDL/\nMDL/g' temp2.txt



 awk '{print $1 " " (($2 * 23) + ($3 * 24))/47}' temp.txt >cgpa.txt



 join -1 4 -2 1 Csb.txt cgpa.txt >final_result.txt
 join -1 4 -2 1 Csb.txt temp1.txt >final_result1.txt
 join -1 4 -2 1 Csb.txt temp2.txt >final_result2.txt


 awk '{print $1 " " $5 " " $6 " " $7}' final_result.txt >answer.txt
 awk '{print $1 " " $5 " " $6 " " $7}' final_result1.txt >answer1.txt
 awk '{print $1 " " $5 " " $6 " " $7}' final_result2.txt >answer2.txt

 join -1 1 -2 1 answer1.txt answer2.txt >finaltemp.txt
 join -1 1 -2 1 finaltemp.txt answer.txt >finaltemp2.txt
 awk '{ print $1 " " $2 " " $3 "        " $4 "        " $7 "        " $10 }' finaltemp2.txt >final.txt

 nano final.txt
