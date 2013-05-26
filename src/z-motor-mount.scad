// Foldable PrusaMendel  
// Z motor mount
// Used for mounting Z motors
// GNU GPL v2
// Based on design by Josef Prusa
// Redesigned by Marek Zehra
// marek@zehra.cz
// http://github.com/marekzehra/Foldable-PrusaMendel
include <configuration.scad>

/**
 * @id z-motor-mount
 * @name Z motor mount
 * @category Printed
 * @using 2 m3x25xhex
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 4 m8nut
 * @using 4 m8washer
 * @using 1 rod-clamp
 */

side = "right";

zmotormount(side=side);
 

module zmotormount(side="none", rod_distance = 66){
height = 55;
width = 16;


difference(){
	union(){
		hull(){
			for(i = [-1, 1]){
				translate(v=[0,i*(rod_distance/2),0])cylinder(h = height, r=width/2, $fn=30);
			}
		}
		if (side == "left" || side == "right") {				
				translate([0,((side == "left") ? 1 : -1) * rod_distance/2 + ((side == "left") ? 1 : -1) * 2,10])
				hull(){
					cube(size = [width-0.1,30,20],center = true);
					translate(v = [0,((side == "left") ? 1 : -1) * 10,0])rotate([0,90,0])cylinder(r = 10, h = width-0.1, center = true);
			}
			
		}
	}


// Joint hole
if (side == "left" || side == "right") {
	translate([0,((side == "left") ? -1 : 1) * rod_distance/2 + ((side == "left") ? -1 : 1) * 2,23.5])
	hull(){
			cube(size = [width + 2,20,28], center = true);
			translate([0,((side == "left") ? -1 : 1) * 11,(38-28)/2])cube(size = [width + 2,1,38], center = true);
		}
	
}


// Rod holes
	for(i = [-1 , 1]){
		translate(v=[0,i*rod_distance/2,-1]) cylinder(h = height + 2, r=threaded_rod_diameter/2);
	}
	translate(v=[0,((side == "left") ? 1 : -1) * rod_distance/2 + ((side == "left") ? 1 : -1) * 12,10])rotate([0,90,0])cylinder(r = threaded_rod_diameter/2, h=width+2, center = true);


// Nema 17
	translate(v = [0,0,height/1.83])rotate([0,90,0]){
		for(angle = [45, -45, 135, -135]){
			rotate ([0,0,angle]) translate([20,0,0]) cube(size = [9, m3_diameter, width + 4], center = true);
		}
		translate(v=[-2.3,0,-2.8])cube(size = [46,43,width - 3], center = true);
		translate(v=[0,0,-10]) polyhole(26,width + 4);
		translate(v=[30,0,-10]) cylinder(h = width+2, r=4.2);
		translate(v=[16,7,-1]) rotate(a=[0,90,0]) polyhole(m3_diameter,15);
		translate(v=[16,-7,-1]) rotate(a=[0,90,0]) polyhole(m3_diameter,15);
		translate(v=[0,7,-1]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) nut(m3_nut_diameter, 24, true);
		translate(v=[0,-7,-1]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) nut(m3_nut_diameter, 24, true);
	}
}
}
