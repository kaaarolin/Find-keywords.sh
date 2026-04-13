
#!/bin/bash

SH_DIR="/home/karolin/sh-files"
PATTERNS=("echo" "read")
REPORT_FILE="/home/karolin/sh-files/sh_analysis_report.txt"

echo "Analysing .sh files" > "$REPORT_FILE"
echo "File generated: $(date)" >> "$REPORT_FILE"

echo -e "\nList of sh files updated in the last 30 days:" >> "$REPORT_FILE"
SH_FILES=$(find $SH_DIR -name "*.sh" -mtime -30)
echo $SH_FILES >> "$REPORT_FILE" 

for SH_FILE in $SH_FILES; do

	for PATTERN in "${PATTERNS[@]}"; do 
			
		echo -e "\nSearching $PATTERN statements in $SH_FILE file:" >> "$REPORT_FILE"  
		grep "$PATTERN" "$SH_FILE" >> "$REPORT_FILE"

		echo -e "\nNumber of $PATTERN statements found in $SH_FILE file:" >> "$REPORT_FILE" 
		ERROR_COUNT=$(grep -c "$PATTERN" "$SH_FILE")
	       	echo $ERROR_COUNT >> "$REPORT_FILE" 
		
		if [ "$ERROR_COUNT" -gt 2 ]; then 
			echo -e "\n TOO MANY echos and reads what is this!?"
		fi			
	done
done	

echo -e "\nSH analysis completed and report saved in $REPORT_FILE"


 
