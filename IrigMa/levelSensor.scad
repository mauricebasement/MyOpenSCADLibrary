//Level Sensor
$fn=50;

module sensor(side=12) {
    for(i=[-1,1])translate([10*i,0])cube([side,side,1],center=true);
    difference() {
        translate([0,0,side/2-0.5])cube([side+1,side,side],center=true);
        translate([0,0,side/2-1.5])cube([side-4,side,side-2],center=true);
        for(i=[-1,1])translate([0,3*i])cylinder(r=1,h=side);
    }
}
sensor();