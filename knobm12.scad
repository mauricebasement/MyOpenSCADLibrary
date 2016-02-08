difference() {
    union() {
        cylinder(r=30,h=18);
        translate([0,0,18])cylinder(r1=18,r2=14,h=7);
        cylinder(r=14,h=40);
    }
    cylinder(r=6.5,h=40);
    a=7;
    for(i=[1:a]) {
        rotate([0,0,360/a*i])translate([0,35])cylinder(r=12,h=18);
    }
}