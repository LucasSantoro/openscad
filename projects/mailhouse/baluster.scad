$fn = 100;
global_h = 100;
global_w = 80;
bal_spacing = 6.35;
half_sp = bal_spacing / 2;

num_bal = floor(((global_w / 2)-half_sp) / bal_spacing );

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



//top rail
translate([0,0, (0.5 * global_h)]) cube([2, global_w, 2], center=true);

//bottom rail
translate([0,0, -(0.5 * global_h)]) cube([2, global_w, 2], center=true);

for(i = [0:num_bal]) {
    translate([0,(i * bal_spacing)+half_sp,0]) baluster(global_h);
    translate([0,-(i * bal_spacing)-half_sp,0]) baluster(global_h);
}
