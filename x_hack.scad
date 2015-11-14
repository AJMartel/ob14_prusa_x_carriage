/*
 * You will need to copy a few configs from the prusa git repo
 * https://github.com/josefprusa/Prusa3.git
 *
*/
include <Prusa3/box_frame/inc/conf_bushing.scad>;
include <Prusa3/box_frame/inc/metric.scad>;

/*
 * Outer Dimensions of the acme nut
 * Flange: 28.7mm x 7mm
 * Shaft: 16mm x 17mm
 *
*/

$fn=50;

acme_nut_flange_od=27.7;
acme_nut_flange_z=7;
acme_nut_shaft_od=10.2;
acme_nut_shaft_z=17;

idler_z_nut_center_loc=[32.5,-13,0];
idler_z_nut_height=14;
idler_z_base_exterior=18.4; // distance from outer edge of the idler frame to where the nut trap base starts

motor_z_nut_center_loc=[31,-89.5,0];
motor_z_nut_height=14;
motor_z_base_exterior=18.4; // distance from outer edge of the idler frame to where the nut trap base starts


module x_idler_end() {
  import("XIdleEndOB14.stl");
}

module x_motor_end() {
  import("XMotorEndOB14.stl");
}


module acme_nut() {
  difference() {
    // create the base nut
    union(){
      cylinder(r=acme_nut_flange_od/2, h=acme_nut_flange_z);
      translate([0,0,7]) cylinder(r=acme_nut_shaft_od/2, h=acme_nut_shaft_z);
    }
    // Hollow it out, not creating the thread profile
    translate([0,0,0]) cylinder(r=5, h=acme_nut_flange_z+acme_nut_shaft_z);
  }
}


module hacked_x_idler() {
  difference() {
    // import the original idler, beef up the mount and make room for the new nut
    union() {
      translate(idler_z_nut_center_loc) x_idler_end();
	  translate([-12,-10.5,0]) cube([27,23,14]);
    }
    cylinder(r=acme_nut_shaft_od/2, h=acme_nut_shaft_z);
    hacked_bolt_holes();
  }
}

module hacked_x_motor() {
  difference() {
    union() {
      translate(motor_z_nut_center_loc) x_motor_end();
	  translate([-13,-14,0]) cube([28,24.5,14]);
    }
    cylinder(r=acme_nut_shaft_od/2, h=acme_nut_shaft_z);
    hacked_bolt_holes();
  }
}

module hacked_bolt_holes() {
	rotate([0,0,45]){
		translate([-8,0]) cylinder(h=14, d=3.5);
		translate([8,0]) cylinder(h=14, d=3.5);
		translate([0,8]) cylinder(h=14, d=3.5);
		translate([0,-8]) cylinder(h=14, d=3.5);
	}
}

// pick one!
echo("read the source ;)");
// hacked_x_idler();
 hacked_x_motor();