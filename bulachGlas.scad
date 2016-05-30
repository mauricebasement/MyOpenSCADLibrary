$fn=100;
radius=57;
hClosed=35.5;
dLid=5.3;
radius2=50.5;

module ring() {
    rotate_extrude()translate([57/2-5.3/2,0])circle(d=5.3);
}
module assembly() {
    translate([0,0,hClosed-dLid/2])difference() {
        hull()ring();
        translate([0,0,dLid/2])rotate([90,0,0])cylinder(h=radius,r=dLid,center=true);
    }
    difference() {
        cylinder(h=hClosed-dLid/2,r=radius/2);
        translate([0,0,hClosed])rotate([90,0,0])cylinder(h=radius,r=dLid,center=true);
    }
    translate([0,0,-20])cylinder(r=radius2/2,h=20);
}

difference() {
    translate([32.5/2,0,15])cube([32.5,65,50],center=true);
    assembly();
}