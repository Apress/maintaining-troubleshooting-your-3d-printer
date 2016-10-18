//
// Gate Hinge 
//
// This thing makes hinge you can use to swing a wooden baby gate.
//
// Instructions
// The hinge uses a 1/2" eyehook for the pivot. You also need two
// 8mm x 50mm pins. To install, remove the existing hardware on
// one side of the gate and use tapered wood screws (8) to 
// secure the hinge to the gate. Mount the eyehooks and use the
// pins to attach the hinges. Hold the gate so that the hinges
// slip into place and then secure the hinges in place with the
// tapered screws. Mischief managed!
//
// Created by: Charles Bell
//
// Enjoy!
// 
module gate_bracket() {
  difference() {
    union() {
      translate([0,5,0]) cube([35,25,40]);
      translate([0,5,0]) cube([40,30,40]);
      translate([40,20,0]) cylinder(40,15,15);
    }
    translate([0,10.5,0]) cube([19,19,50]);
    translate([40,20,0]) cylinder(55,4.3,4.3);
    rotate([90,0,0]) translate([10,10,-50]) cylinder(75,1.75,1.75);
    rotate([90,0,0]) translate([10,30,-50]) cylinder(75,1.75,1.75);
    translate([40,20,15]) cylinder(8,16,16);
  }
}

difference() {
  gate_bracket();
  translate([22,0,0]) cube([40,40,40]);
  translate([0,0,15]) cube([10,40,40]);
}