$fn = 100;

difference() {
union() {
    cylinder(h=5, r = 11.5, center=true);
    translate([50, 0, 0]) cylinder(h=5, r = 42.5, center=true);
}

    cylinder(h=6, r1 = 6, r2 = 5.5, center=true);
    translate([50, 0, 0]) cylinder(h=6, r1 = 36.5, r2 = 37, center=true);
}
