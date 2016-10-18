translate([0,0,50]) rotate([270,0,-90]) union() {
  difference() {
    union() {
      // base
      cube([20,50,5]);
      // left ear
      union() {
        cube([20,10,15]);
        translate([10,10,15]) rotate([90,0,0]) cylinder(10,10,10,$fn=32);
      }
      // right ear
      translate([0,40,0]) union() {
        cube([20,10,15]);
        translate([10,10,15]) rotate([90,0,0]) cylinder(10,10,10,$fn=32);    
      }
    }
    // hole for rod
    translate([10,55,15]) rotate([90,0,0]) cylinder(60,4,4,$fn=32);
    // nut trap
    translate([10,5,15]) rotate([90,0,0]) cylinder(10,6,6,$fn=6);
  }
  // add support
  // inner
  difference() {
    translate([10,40,15]) rotate([90,0,0]) cylinder(30,4.25,4.25,$fn=32);
    translate([10,40,15]) rotate([90,0,0]) cylinder(30,4,4,$fn=32);
  }
  // outer
  difference() {
    translate([10,40,15]) rotate([90,0,0]) cylinder(30,10,10,$fn=32);
    translate([10,40,15]) rotate([90,0,0]) cylinder(30,9.75,9.75,$fn=32);
  }
}