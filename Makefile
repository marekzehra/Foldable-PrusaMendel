TARGETS = \
	bar-clamp.stl \
	bearing-guide.stl \
	belt-clamp-nut-holder.stl \
	belt-clamp.stl \
	coupling.stl \
	endstop-holder.stl \
	frame-vertex.stl \
	printable-bushing-lm8uu.stl \
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
	z-motor-bracket-hinge.stl

#STL_DIR=metric-prusa/
STL_LM8UU_DIR=print-files/
SRC_DIR=src/

all: lm8uu

calibration:
	openscad -m make -o calibration.stl $(SRC_DIR)calibration.scad

default: $(addprefix $(STL_DIR),$(TARGETS)) $(STL_DIR)frame-vertex-foot.stl

lm8uu: $(addprefix $(STL_LM8UU_DIR),$(TARGETS)) \
	$(STL_LM8UU_DIR)frame-vertex-foot.stl \
	$(STL_LM8UU_DIR)z-motor-mount-left.stl \
	$(STL_LM8UU_DIR)z-motor-mount-right.stl

#$(STL_DIR)frame-vertex-foot.stl:
#	openscad -m make -o $@ -D 'basefoot=true' $(SRC_DIR)frame-vertex.scad

#$(addprefix $(STL_DIR),$(TARGETS)):
#	openscad -m make -o $@ $(patsubst %.stl,%.scad,$(SRC_DIR)$(subst $(STL_DIR),,$@))
	
$(addprefix $(STL_LM8UU_DIR),$(TARGETS)):
	openscad -m make -D 'linear=true;lme8uu=false' -o $@ $(patsubst %.stl,%.scad,$(SRC_DIR)$(subst $(STL_LM8UU_DIR),,$@))

$(STL_LM8UU_DIR)frame-vertex-foot.stl:
	openscad -m make -o $@ -D 'basefoot=true' $(SRC_DIR)frame-vertex.scad
	
$(STL_LM8UU_DIR)z-motor-mount-left.stl:
	openscad -m make -o $@ -D 'side="left"' $(SRC_DIR)z-motor-mount.scad

$(STL_LM8UU_DIR)z-motor-mount-right.stl:
	openscad -m make -o $@ -D 'side="right"' $(SRC_DIR)z-motor-mount.scad

clean:
	rm -f $(STL_LM8UU_DIR)*.stl
	
	
	
	
