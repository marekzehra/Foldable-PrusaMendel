// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v3
// Marek Žehra
// marek@zehra.cz
// https://github.com/3DprintFIT/PrusaMendel

// Originaly designed by
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


include <configuration.scad>

/**
 * @id endstop-holder
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */
module endstop(outer_diameter=m8_diameter/2+3.3, 
				screw_hole_spacing=9,
				opening_size=m8_diameter-1.5,
				doubled=false){

	endstop_height = doubled ? 20 : 10;
	cycles = doubled ? 1 : 0;
	
	difference(){
		union(){
			translate([outer_diameter, outer_diameter, 0]) cylinder(h = endstop_height, r = outer_diameter, $fn = 20);
			translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,endstop_height]);
			translate([-(screw_hole_spacing + 10), 0, 0]) cube([screw_hole_spacing + 20, 4, endstop_height]);
			for ( i = [0:cycles] ){
				translate([17, 17.5, 5 + 10*i]) rotate([90, 0, 0]) #cylinder(h =5, r = 5.77, $fn = 6);
			}
		}

		translate([9, outer_diameter-opening_size/2, -1]) cube([18,opening_size,endstop_height+2]);
		translate([outer_diameter, outer_diameter, -1]) cylinder(h =endstop_height+2, r = m8_diameter/2, $fn = 18);

		for ( i = [0:1] ){
			//nut hole hole
			translate([17, 19.5, 5 + 10*i]) rotate([90, 0, 0]) cylinder(h =5, r = m3_nut_diameter_horizontal/2, $fn = 6);

			//screw holes
			translate([17, 17, 5 + 10*i]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
			translate([-4, 17, 5 + 10*i]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
			translate([-(4+screw_hole_spacing), 17, 5 + 10*i]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
		}
	}
}

endstop(doubled = doubled_endstops);
//endstop(doubled = false);

