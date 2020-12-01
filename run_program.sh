
source ./venv/bin/activate
#$@ - All positional parameters with spaces
for file in "$@"
do	
#basename Print NAME with any leading directory components removed. 
filename=$(basename "$file")
output="./data/align_${filename}_history"
rm -f ${output}
	for ((i=18; i<=100; i+=5));
	do
		nodes="$i"
		{
		# the first input is syeast0
		python DeepMatching.py --input1 ./networks/syeast0/syeast0.el  \
		--input2 ${file}	\
		--nodes ${nodes} --propa_num $((4*nodes))	
		echo
		echo '#####'
		}>> ${output}
	done
done
