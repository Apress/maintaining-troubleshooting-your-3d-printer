//
// S-hook 
//
// This thing makes an S-shaped hook for hanging things. You can use
// it to hang planters, belts, bags, purses, etc.
//
// Instructions
// Simply compile, export, and print! If you want to make the hooks
// a different size, use the following parameters to alter the size.
//
// - The diameter parameter sets the outer diameter of the loops.
// - The thickness is the height and width of the cross section of
//   the loops.
//
// Created by: Charles Bell
//
// Enjoy!
// 
module s_hook(diameter=40,thickness=5) {
  radius=diameter/2;
  difference() {
    cylinder(thickness,radius,radius,$fn=64);
    cylinder(thickness,radius-thickness,radius-thickness,$fn=64);
    translate([0,-radius,0]) cube([radius,radius,thickness]);
  }
  translate([0,thickness-diameter,0]) difference() {
    cylinder(thickness,radius,radius,$fn=64);
    cylinder(thickness,radius-thickness,radius-thickness,$fn=64);
    translate([-radius,0,0]) cube([radius,radius,thickness]);
  }
}

s_hook();