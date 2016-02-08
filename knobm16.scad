difference() {
    union() {
        cylinder(r=30*1.25,h=18*1.25);
        cylinder(r=12*1.25,h=40*1.25);
    }
    cylinder(r=6.5*1.25,h=40*1.25);
    a=7;
    for(i=[1:a]) {
        rotate([0,0,360/a*i])translate([0,35*1.25])cylinder(r=12*1.25,h=18*1.25);
    }
}
