
source ./venv/bin/activate
#$@ - All positional parameters with spaces
for file in "$@"
do	
#basename Print NAME with any leading directory components removed. 
	filename=$(basename "$file")
	for ((i=15; i<=100; i+=5));
	do
	  nodes="$i"
	  if [ "$i" = "23" ]
	  then
	    chr="X"
	  fi

	  python DeepMatching.py --input1 ./networks/syeast0/syeast0.el  \
          --input2 ${file}	\
          --nodes ${nodes} --propa_num $((4*nodes))	\
          
        #   >> ./data/align_syeast_${filename}_history
	done
done

