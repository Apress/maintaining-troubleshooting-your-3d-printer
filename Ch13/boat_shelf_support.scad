//
// This thing creates an adjustable riser to hold a glass
// shelf in a replica of a Chesapeake skiff. It is provided
// for demonstration purposes only since it is very specific
// to a one-of-a-kind work (the boat).
//
// Created by: Charles Bell
//
// Enjoy!
// 
difference() {
  union() {
    translate([8,4,0]) cube([20,20,40]);
    translate([7.5,14,0]) cylinder(50,10,10,$fn=32);
    translate([17,0,0]) cube([30,28,40]);
    translate([17,4,0]) cylinder(40,4,4,$fn=32);
    translate([17,24,0]) cylinder(40,4,4,$fn=32);
  }
  translate([20,4,-0]) rotate([0,14,0]) cube([30,20,50]);
  translate([35,-1,-0]) rotate([0,14,0]) cube([30,40,50]);
  translate([30,5,10]) rotate([90,0,0]) cylinder(6,1.75,3.7);
  translate([35,5,30]) rotate([90,0,0]) cylinder(6,1.75,3.7);
  translate([30,29,10]) rotate([90,0,0]) cylinder(6,3.7,1.75);
  translate([35,29,30]) rotate([90,0,0]) cylinder(6,3.7,1.75);
  translate([7.5,14,0]) cylinder(100,3.2,3.2,center=true,$fn=32);
  translate([7.5,14,48]) cube([11.2,11.2,5],center=true);
}

translate([-30,0,0]) difference() {
  union() {
    cylinder(5,10,10);
    translate([0,0,5]) cylinder(5,10,8);
  }
  translate([0,0,5]) cylinder(6,6.4,6.4,$fn=6);
}
