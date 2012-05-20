source_dir="source"
metric_dir="metric-prusa"
dest_dir="metric-prusa-lm8uu"

files_to_copy=(
	bar-clamp
	bearing-guide
	belt-clamp-nut-holder
	belt-clamp
	coupling
	endstop-holder
	frame-vertex
	frame-vertex-foot
	pulley
	rod-clamp
	sanguinololu-holder
	wade
	wade-big
	wade-small
	ybrac-t
	z-motor-mount
	)
	
files_to_generate=(
	printable-bushing-lm8uu
	x-end-idler
	x-end-motor
	x-carriage
	y-bushing
	)
	
rm -f $dest_dir/*.stl

for file in ${files_to_copy[*]}
do
	echo -en "Copying $file.stl..."
	cp $metric_dir/$file.stl $dest_dir/$file.stl && echo "DONE"	
done

for file in ${files_to_generate[*]}
do
	echo -en "Generating $file.stl..."
	openscad -o $dest_dir/$file.stl -D 'linear=true;lme8uu=false' $source_dir/$file.scad && echo "DONE"
done
