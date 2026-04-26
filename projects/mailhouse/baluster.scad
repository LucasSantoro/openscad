$fa = 0.2;
$fs = 0.2;
global_h = 52;
global_w = 109;
global_r = 2;
dowel_len = 10;
bal_spacing = 10;
half_sp = bal_spacing / 2;

num_bal = floor(((global_w / 2)-bal_spacing) / bal_spacing );

module baluster (h, r)
{   
    d = r * 2;
    core_r = r * 0.70;
    
    h_z = h * -0.5;
    big_sp = h * 0.10;
    small_sp = h * 0.01;
    
    //should add up to h
    base_h = big_sp * 2;
    ball_h = big_sp * 1;
    cone_h = big_sp * 7;
    
    base_z = h_z + (base_h/2);
    ball_z = h_z + (base_h) + (ball_h/2);
    cone_z1 = h_z + (base_h) + (ball_h);
    cone_z2 = h_z + (base_h) + (ball_h) + (cone_h/2);
    
    cone_bottom_z = r/3;
    
    // core
    cylinder(h = h, r = core_r, center=true);
    
    //base
    translate([0,0,base_z]) cube([d, d, base_h], center=true);
    
    //ball
    translate([0,0,ball_z]) sphere(r = r);
    
    //cone
    translate([0,0,cone_z2 + cone_bottom_z]) cylinder(h = (cone_h - (2*cone_bottom_z)), r1 = r, r2 = core_r, center=true);
    
    //cone bottom
    translate([0,0,cone_z1 + (2*cone_bottom_z)]) sphere(r = r);
    
    //donuts
    translate([0,0,cone_z1 + (small_sp * 9)])
    rotate_extrude(convexity = 10)
    translate([(1 * core_r), 0, 0])
        circle(r = 0.6 * core_r);
    
    translate([0,0,cone_z1 + (small_sp * 13)])
    rotate_extrude(convexity = 10)
    translate([(1 * core_r), 0, 0])
        circle(r = 0.6 * core_r);

}

rail_r = 1.5 * global_r;
rail_d = 2 * rail_r;
rail_z = (0.5 * global_h) - rail_r;

bal_h = global_h - (rail_d);


union() {
    //bottom rail
    translate([0,0,-rail_z]) cube([rail_d, global_w, rail_d], center=true);
        
    //bottom rail mounting dowel
    translate([0,0,-rail_z]) rotate([90,0,0]) cylinder(h=global_w + (2 * dowel_len), r=global_r, center=true);

    for(i = [0:num_bal]) {
        translate([0,(i * bal_spacing)+half_sp,0]) baluster(bal_h, global_r);
        translate([0,-(i * bal_spacing)-half_sp,0]) baluster(bal_h, global_r);
    }
}
