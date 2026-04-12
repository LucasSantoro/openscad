$fn = 100;

module baluster (h, r = 2)
{   
    d = r * 2;
    core_r = r / 2;
    base_h = h / 5;
    cone_h = base_h * 4;
    
    spacing = min(h * 0.01, core_r);
    actual_cone_h = cone_h - (spacing * 4);
    
    // core
    cylinder(h = h, r = core_r, center=true);
    
    //bottom to top ornamentation
    translate([0,0,-(2*base_h)]) cube([d, d, base_h], center=true);
    
    translate([0,0,-((1.5*base_h)-(spacing*2))]) sphere(r = r);
    
    translate([0,0,(0.50 * base_h) + (spacing * 2)]) cylinder(h = actual_cone_h, r1 = r, r2 = core_r, center=true);
    
    translate([0,0,-((1.5 * base_h) - (spacing * 10))])
    rotate_extrude(convexity = 10)
    translate([(1.25 * core_r), 0, 0])
        circle(r = core_r);
    
    translate([0,0,-((1.5 * base_h) - (spacing * 12))])
    rotate_extrude(convexity = 10)
    translate([(1.25 * core_r), 0, 0])
        circle(r = core_r);

}


translate([0,50,0]) baluster(10);
translate([0,55,0]) baluster(100);
translate([0,60,0]) baluster(100);
translate([0,65,0]) baluster(150);
translate([0,70,0]) baluster(150);