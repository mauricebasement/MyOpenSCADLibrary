$fn=50;

module cut() {
    translate([-3,0])scale(1.05)linear_extrude(height=6) {
        difference() {
            translate([3,0])circle(r=3);
            square([3,6],center=true);
        }
    }
}
difference() {
    positiv();
    sides();
    cut();
}
module positiv(r=3) {
    hull() {
        rotate_extrude()translate([12.5-r,0])circle(r=r);
        cylinder(r=12.5,h=5);
    }
}
module sides(number=6,radius=4) {
    translate([0,0,-3])for(i=[0:number])rotate([0,0,360/number*i])translate([0,12.5+1])cylinder(h=8,r=radius);
}
    