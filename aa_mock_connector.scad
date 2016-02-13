//AA Connector Battery
difference() {
    union() {
        cylinder(d2=14.5,d1=12);
        translate([0,0,1])cylinder(d=14.5,h=48.5);
        translate([0,0,49.5])cylinder(d=5.5,h=0.7);
        translate([0,0,50.2])cylinder(d1=5.5,d2=4.5,h=0.3);
    }
    cube([10,10,55]);
}
