source_folder="source"
output_folder="metric-prusa"
files_to_generate=(
	bar-clamp 
	bearing-guide 
	belt-clamp-nut-holder 
	belt-clamp coupling 
	endstop-holder 
	frame-vertex 
	printable-bushing-lm8uu 
	pulley 
	rod-clamp 
	sanguinololu-holder 
	wade 
	wade-big 
	wade-small 
	x-carriage 
	x-end-idler 
	x-end-motor 
	y-bushing 
	ybrac-t 
	z-motor-mount
	)

rm -f metric-prusa/*.stl

echo "Generating:"

for file in ${files_to_generate[*]}
do
	echo -ne "$output_folder/$file.stl...";
	openscad -o $output_folder/$file.stl $source_folder/$file.scad
	echo "DONE"

	if [ "$file" == "frame-vertex" ];
	then
		echo -ne "metric-prusa/frame-vertex-foot.stl..."
		openscad -o $output_folder/$file-foot.stl -D 'basefoot=true' $source_folder/$file.scad
		echo "DONE"
	fi
done

exit 0