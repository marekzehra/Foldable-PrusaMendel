// Foldable PrusaMendel  
// Z motor bracket hinge
// Used for connecting Z motor mount to rod
// GNU GPL v2
// Design by Marek Zehra
// marek@zehra.cz
// http://github.com/marekzehra/Foldable-PrusaMendel
include <configuration.scad>

zmotorbrackethinge();


module zmotorbrackethinge() {
	width = 28;

	difference(){
		union(){
			cylinder(h = width, r = threaded_rod_diameter/2 + 3);
			translate([0,-threaded_rod_diameter/2,0])cube([threaded_rod_diameter/2+3,threaded_rod_diameter+3, width]);

			rotate([0,0,-60])translate([0,-threaded_rod_diameter/2,0]){
				difference(){
					hull(){
						cube([15,threaded_rod_diameter+3, width]);
						translate([13,threaded_rod_diameter+3,width/2])rotate([90,90,0])cylinder(h = threaded_rod_diameter+3, r = threaded_rod_diameter/2 + 5 );
					}
					translate([13,threaded_rod_diameter+3,width/2])rotate([90,90,0])translate([0,0,-1])cylinder(h = threaded_rod_diameter+5, r = threaded_rod_diameter/2 );
				}
			}
		}
		translate([0,0,-1])cylinder(h = width+2, r = threaded_rod_diameter/2);
	}
}