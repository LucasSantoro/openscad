$fa = 0.2;
$fs = 0.2;

global_w = 109;
global_r = 2;
dowel_len = 10;
bal_spacing = 10;
half_sp = bal_spacing / 2;

num_bal = floor(((global_w / 2)-bal_spacing) / bal_spacing );

difference() {

union(){
//bottom rail
cube([3*global_r, global_w, 3*global_r], center=true);
    
//bottom rail mounting dowel
rotate([90,0,0]) cylinder(h=global_w + (2 * dowel_len), r=global_r, center=true);
}

union() {
    for(i = [0:num_bal]) {
        translate([0,(i * bal_spacing)+half_sp,global_r]) cylinder(h=global_r*2, r=0.8 * global_r, center=true);
        translate([0,-(i * bal_spacing)-half_sp,global_r]) cylinder(h=global_r*2, r=0.8 * global_r, center=true);
    }
}

}
