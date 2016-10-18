/*
  Module: thread_spool

  Description: This module creates a spool used for winding thread. The
  spool is constructed so that there are beveled sides that slope inward
  toward a center cylinder. The parameters include the following.

  diameter - the outer diameter of the spool.
  height - the outer height of the spool including the bevel edges.
  depth - depth of the bevel. Inner cylinder diameter = diameter - depthx2
  hole_radius - radius of center hole

  Date Created: 2014-07-27
  
  Created by: Charles Bell
*/
module thread_spool(diameter=30,height=40,depth=3,hole_radius=3) {
  radius = diameter/2;
  center_height = height-8;
  difference() {
    union() {
      // bottom
      cylinder(2,radius,radius,$fn=64);
      translate([0,0,2]) cylinder(2,radius,radius-depth,$fn=64); 
      // center
      translate([0,0,4]) cylinder(height-8,radius-depth,radius-depth,$fn=64);
      // top
      translate([0,0,height-4]) cylinder(2,radius-depth,radius,$fn=64);
      translate([0,0,height-2]) cylinder(2,radius,radius,$fn=64);
    }
    // hole
    cylinder(height,hole_radius,hole_radius,$fn=64);
    // cut
    translate([(diameter/2)-depth,0,0]) cube([depth,0.25,height]);
  }
}

thread_spool(30,40,4);

