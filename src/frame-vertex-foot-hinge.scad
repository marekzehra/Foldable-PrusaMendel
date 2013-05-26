// Foldable PrusaMendel  
// Frame vertex foot hinge
// Used for connecting frame rod to foot
// GNU GPL v2
// Design by Marek Žehra
// marek@zehra.cz
// http://github.com/marekzehra/Foldable-PrusaMendel
include <configuration.scad>

framehinge();
//%rotate(a = 180,v = [0,0,1])translate([-36.5,-1.5,0])import("/Users/marekzehra/Downloads/Frame-Vertex-Foot-Hinge-Right.stl");

module framehinge() {
	difference(){
		union() {
			cylinder(h=threaded_rod_diameter + 4.5, r = threaded_rod_diameter/2 + 7);
			translate([0,-(threaded_rod_diameter + 6.5)/2,0]){
				cube(size = [35,threaded_rod_diameter + 6.5,threaded_rod_diameter + 4.5]);
				translate([35,0,0])rotate([0,0,25]){
					cube(size = [10,threaded_rod_diameter + 6.5,threaded_rod_diameter + 4.5]);
					translate([10,0,0])rotate([0,0,25])difference(){
						hull(){
							cube(size = [10,threaded_rod_diameter + 6.5,threaded_rod_diameter + 4.5]);
							translate([(threaded_rod_diameter + 6.5)/2 + 13,(threaded_rod_diameter + 6.5)/2,0])cylinder(r = (threaded_rod_diameter + 6.5)/2, h = threaded_rod_diameter + 4.5);
						}
						translate([(threaded_rod_diameter + 6.5)/2 + 4,(threaded_rod_diameter + 6.5)/2 + 8.5,(threaded_rod_diameter + 4.5)/2])rotate([90,0,0])cylinder(r = threaded_rod_diameter_horizontal/2, h = threaded_rod_diameter + 8.5);
					}
				}
			}

		}

		translate([0,0,-1])cylinder(h = threaded_rod_diameter+6.5, r = threaded_rod_diameter/2);
	}
}