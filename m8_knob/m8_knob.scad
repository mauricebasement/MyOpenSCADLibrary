$fn=50;
module bottom() {
    difference() {
        cylinder(r=20,h=8);
        for(i=[0:20:360])rotate([0,0,i])translate([21,0])scale([1,2,1])cylinder(r=3,h=8);
    }
}
module top() {
    translate([0,0,8])difference() {
        cylinder(r=10,h=25);
        translate([0,0,19])cylinder(r=15.5/2,h=7,$fn=6);
    }
}
difference() {
    union() {
        top();
        bottom();
    }
    translate([0,0,3])cylinder(r=4.5,h=30);
}
