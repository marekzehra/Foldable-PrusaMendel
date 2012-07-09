include<configuration.scad>

use<belt-clamp.scad>
use<belt-clamp-nut-holder.scad>
use<bearing-guide.scad>
use<y-bushing.scad>
use<rod-clamp.scad>
use<wade-small.scad>
use<x-carriage.scad>

linear=true;

translate([108,39,0]) rotate([0,0,-90]) beltclamp();
translate([80,44,0]) rotate([0,0,-220]) beltclampnut();
translate([134,40,0]) rotate([0,0,-315]) union(){
	inner();
	translate([29,0,0])outer();
}
translate([49,115,0]) rotate([0,0,90]) beltclamp();
translate([123,158,0]) rotate([0,0,180]) ybushing(linear);
translate([28,145,0]) rotate([0,0,-65]) rodclamp();
translate([123,72,0]) rotate([0,0,180]) ybushing(linear);
translate([66,115,15]) rotate([180,0,0]) WadesS_double_helix();
translate([20,116,0]) rotate([0,0,180]) rodclamp();
translate([85,159,0]) rotate([0,0,180]) beltclamp();
translate([149,132,0]) rotate([0,0,70]) union(){
	inner();
	translate([29,0,0])outer();
}
translate([117,115,0]) rotate([0,0,90]) ybushing(linear);
translate([94,61,0]) rotate([0,0,90]) beltclampnut();
translate([56,155,0]) rotate([0,0,-160]) beltclamp();
translate([65,115,0]) rotate([0,0,-90]) xcarriage(linear);
translate([28,60,0]) rotate([0,0,-35]) union(){
	inner();
	translate([29,0,0])outer();
}
translate([149,96,0]) rotate([0,0,180]) ybushing(linear);
