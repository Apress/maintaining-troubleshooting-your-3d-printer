// This script creates an adjustable foot for the Makerbot Replicator 2 and 2X.
// It uses an m8 bolt and nut to form the foot and a mashup of another thing.
// 
// Instructions:
//
// We're going to do a mashup of the new base and a replacement foot made
// by Creative Tools: http://www.thingiverse.com/thing:219127
//
//  1) Download and place the .stl file in the same directory as this file.
//  2) Compile, save, and print (4) sets
//  3) For each base, remove the interior cylinder with a hobby knife.
//     This prevents the need to use support material.
//  4) For each foot, press the bolt into the foot and either cement
//     in place or (better) heat the bolt and press it into the plastic and
//     fold over the small collar to hold it in place (easy when bolt is hot).
//  5) Assemble each adjuster by threading the foot into the base. 
//  6) Carefully remove the feet from your Replicator 2 and press the new
//     feet into place and level the unit.
// 
// Created by: drcharlesbell@gmail.com
//
// Enjoy!

import("Machine_feet_for_the_Replicator_2_and_2X.stl");
module foot(shaft=8.6, nut_dia=15.2, nut_h=7.1) {
  difference() {
    union() {
      cylinder(6,25,25);
      cylinder(10,13,13);
      cylinder(12,(nut_dia/2)+1,(nut_dia/2)+1);
    }
    translate([0,0,3]) cylinder(nut_h+3,nut_dia/2,nut_dia/2,$fn=6);
  }
}

module adjustable_base(shaft=8.6, nut_dia=15.2, nut_h=7.1, nut_flat=13.2) {
  difference() {
    // base
    cube([20,20,20]);
    // shaft 
    translate([10,10,-1]) cylinder(25,shaft/2,shaft/2);
    // nut trap 
    translate([10,10,2]) cylinder(nut_h,nut_dia/2,nut_dia/2,$fn=6);
    translate([0,3.3,2]) cube([nut_flat,nut_flat,nut_h]);
    // bevel for mashup
    translate([20,-2.75,0]) rotate([0,0,45]) cube([4,4,25]);
  }
  // support (cut away)
  difference() {
    translate([10,10,2]) cylinder(nut_h,(shaft/2)+.25,(shaft/2)+.25);
    translate([10,10,-1]) cylinder(25,shaft/2,shaft/2);
  }
}

translate([2.5,22.5,0]) rotate([0,0,-90]) adjustable_base();
translate([0,-30,0]) foot();

// Note: The completed thing on my Thingiverse was made with leftover parts
//       from an Ikea purchase. In fact, you can use the following legs to
//       lift your Makerbot about 6" off the workspace.
//       http://www.ikea.com/us/en/catalog/products/60196513/#/80143217
