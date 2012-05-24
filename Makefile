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
STL_LM8UU_DIR=metric-prusa-lm8uu/
SRC_DIR=source/

all: default lm8uu

default: $(addprefix $(STL_DIR),$(TARGETS)) $(STL_DIR)frame-vertex-foot.stl

lm8uu: $(addprefix $(STL_LM8UU_DIR),$(TARGETS)) $(STL_LM8UU_DIR)frame-vertex-foot.stl

$(STL_DIR)frame-vertex-foot.stl:
	openscad -m make -o $@ -D 'basefoot=true' $(SRC_DIR)frame-vertex.scad

$(addprefix $(STL_DIR),$(TARGETS)):
	openscad -m make -o $@ $(patsubst %.stl,%.scad,$(SRC_DIR)$(subst $(STL_DIR),,$@))
	
$(addprefix $(STL_LM8UU_DIR),$(TARGETS)):
	openscad -m make -D 'linear=true;lme8uu=false' -o $@ $(patsubst %.stl,%.scad,$(SRC_DIR)$(subst $(STL_LM8UU_DIR),,$@))

$(STL_LM8UU_DIR)frame-vertex-foot.stl: $(STL_DIR)frame-vertex-foot.stl
	cp $(STL_DIR)frame-vertex-foot.stl $(STL_LM8UU_DIR)frame-vertex-foot.stl
	
clean:
	rm -f $(STL_DIR)*.stl
	rm -f $(STL_LM8UU_DIR)*.stl
	
	
	
	
