include<configuration.scad>
use<endstop-holder.scad>
use<bar-clamp.scad>
use<x-end-motor.scad>
use<x-end-idler.scad>
use<wade.scad>

translate([34,140,0]) rotate([0,0,270]) endstop();
translate([168,123,0]) rotate([0,0,90]) barclamp();
translate([71,120,0]) rotate([0,0,1890]) xendmotor();
translate([135,120,0]) rotate([0,0,270]) xendidler(linear);
translate([125,83,0]) rotate([0,0,180]) wade(hotend_mount=256, legacy_mount=false);
translate([44,92,16.21]) rotate([0,-90,180]) wadeidler();
translate([34,90,0]) rotate([0,0,90]) mirror([0,1,0]) endstop();
translate([168,91,0]) rotate([0,0,90]) barclamp();
translate([152,46,0]) rotate([0,0,45]) endstop();
