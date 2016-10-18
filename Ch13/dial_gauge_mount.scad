// Dial Gauge Mount for Prusa i3
//
// This thing is designed to allow you to use a typical dial guage
// for tramming (leveling) the print bed.
//
// Notes
//
// The only parameter you should have to change is the diameter of
// the tool itself. The hole for the tool should be snug so that 
// the tool does not get dislodged when raising or lowering the
// Z-axis. If it is too snug, you can use a rolled up piece of
// sand paper to make the hole a bit larger. You can also change
// the parameter to the method and recompile the object if the 
// tolerance is too large.
//
// Instructions for Use
//
// To use the thing, move the extruder to the center of the X-axis
// (not by hand!), insert your gauge into the mount, and clip the 
// mount onto the X-axis to the left of your extruder. Press the 
// top on first then swing the bottom until it lightly clicks onto 
// the lower bar.
//
// Move the Z-axis (not by hand!) so that the dial tip makes contact
// with the print bed. Move it closer a few millemeters to ensure
// the dial gauge will have a good range of motion.
//
// To tram your print bed, move the gauge to the left-most edge of
// the print bed and move your Y-axis to the home position (not by 
// hand!). This should be the [0,0,0] corner (home) of your print 
// bed. Note the value (I like to turn the dial so the gauge reads
// 0. Make sure your bed adjuster is not too far out of the middle 
// range.
//
// Next, move the Y-axis (not by hand!) to the MAX point and adjust 
// the bed until the dial reads '0' or as close to it as your 
// patience will permit. ;) Now you see why I move the dial to '0'!
//
// Next, move the gauge to the other side of the X-axis carefully
// so as to not change the position of the tool in the mount or the
// position of the dial. Measure and adjust the MAX/MAX point for X/Y. 
//
// Finally, move the Y-axis to 0 (not by hand!) and measure and 
// adjust the last corner. 
//
// Epilogue
//
// Even if you opt to upgrade to an auto bed leveling feature,
// you should periodically tram your print bed to ensure long,
// happy printing experiences.
//
// You may be wondering why I say not to move the axes by hand.
// This is simply because moving an axis by hand will cause the
// stepper motors to act like a generator and generate a small
// amount of current which is fed back to your electronics.
// Moving the axis slowly may not generate enough current to 
// damage the electronics, but why take the chance? Use your
// printer's LCD panel to move (jog) the axes or use a good
// printer controller application to do the same (e.g. 
// Printrun or Repetier-Host).
//
// Created by: drcharlesbell@gmail.com
// 
// Enjoy!

module dial_gauge_clamp_i3(tool_diameter=9.80) {
  // build the body
  difference() {
    union() {
      translate([5,0,0]) cube([45,14,20]);
      translate([50,7,0]) cylinder(20,7,7);
      translate([7,7,0]) cylinder(20,7,7);
      translate([0,7,0]) cube([10,37,20]);
      translate([10,14,0]) cube([7,7,20]);
      translate([0,43,10]) rotate([0,90,0]) cylinder(10,10,10);
    }

    // remove material to allow clamp to be small and not
    // interfere with X axis belt
    translate([17,21,0]) cylinder(20,7,7);
    translate([50,7,0]) cylinder(20,4.25,4.25);
    translate([5,7,0]) cylinder(20,4.25,4.25);
    translate([1,0,0]) cube([8.25,7,20]);
    translate([17,4,0]) cylinder(20,4.25,4.25);
    translate([40,4,0]) cylinder(20,4.25,4.25);
    translate([40,-11.75,0]) cube([11,20,20]);
    translate([18,0,0]) cube([23,10.25,20]);
    translate([8,0,0]) cube([10,6,20]);
    translate([18.25,5.25,0]) cylinder(20,5,5);
    translate([41.45,8.25,0]) cylinder(20,2,2);

    // diameter of tool
    translate([-1,43,10]) rotate([0,90,0]) 
      cylinder(12,tool_diameter/2,tool_diameter/2);
  }

  // add bumps for rail catches
  union(){
    translate([51.25,1.5,0]) cylinder(20,1.4,1.4,$fn=32);
    translate([44.7,9,0]) cylinder(20,1.5,1.5,$fn=32);
    translate([11.3,5.5,0]) cylinder(20,2.1,2.1,$fn=32);
    translate([0.5,4,0]) cylinder(20,1.25,1.25,$fn=32);
    translate([0,5,0]) cube([.75,3,20]); 
  }
}

dial_gauge_clamp_i3();

