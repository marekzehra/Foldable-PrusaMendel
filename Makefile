TARGETS = \
	bar-clamp.stl \
	bearing-guide.stl \
	belt-clamp-nut-holder.stl \
	belt-clamp.stl \
	coupling.stl \
	endstop-holder.stl \
	frame-vertex.stl \
	printable-bushing-lm8uu.stl \
	pulley.stl \
	rod-clamp.stl \
	sanguinololu-holder.stl \
	wade.stl \
	wade-big.stl \
	wade-small.stl \
	x-carriage.stl \
	x-end-idler.stl \
	x-end-motor.stl \
	y-bushing.stl \
	ybrac-t.stl \
	z-motor-mount.stl

STL_DIR=metric-prusa/
SRC_DIR=source/

all: $(addprefix $(STL_DIR),$(TARGETS)) $(STL_DIR)frame-vertex-foot.stl

$(STL_DIR)frame-vertex-foot.stl::
	@echo openscad -m make -o $@ -D \'basefoot=true\' $(SRC_DIR)frame-vertex.scad

$(addprefix $(STL_DIR),$(TARGETS))::
	@echo openscad -m make -o $@ $(patsubst %.stl,%.scad,$(SRC_DIR)$(subst $(STL_DIR),,$@))
