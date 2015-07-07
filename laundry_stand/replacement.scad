$fn=100;

difference() {
    cylinder(r=11,h=30);
    translate([0,0,10])cylinder(r=9,h=20);
    translate([0,0,4])rotate([0,90,0])cylinder(r=2.2,h=22,center=true);
}