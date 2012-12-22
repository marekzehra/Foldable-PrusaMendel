include<configuration.scad>

use<bar-clamp.scad>
use<coupling.scad>
use<ybrac-t.scad>
use<z-motor-mount.scad>
use<wade-big.scad>

translate([50,58,0]) rotate([0,0,135]) barclamp();
translate([166,65,0]) rotate([0,0,90]) barclamp();
translate([43,127,0]) rotate([0,0,-20]) union(){
	translate([0,-14,4])coupling(c=0);
	translate([0,14,4])coupling(c=1);
}
translate([167,37,0]) rotate([0,0,90]) barclamp();
translate([61,62,0]) rotate([0,0,5]) mirror()ybract();
translate([74,114,30]) rotate([0,90,0]) zmotormount();
translate([149,37,0]) rotate([0,0,90]) barclamp();
translate([147,65,0]) rotate([0,0,90]) barclamp();
translate([92,114,30]) rotate([0,90,0]) zmotormount();
translate([94,73,0]) rotate([0,0,-180]) barclamp();
translate([140,130,0]) rotate([0,0,0]) WadesL();
translate([116,66,0]) rotate([0,0,0]) union(){
	translate([0,-14,4])coupling(c=0);
	translate([0,14,4])coupling(c=1);
}
