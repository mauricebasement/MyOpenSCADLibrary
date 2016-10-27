$fn=500;

for(i=[0,1])mirror([0,0,i]) {
    difference() {
        cylinder(r=50,h=50);
        cylinder(r=12.5,h=15);
        translate([0,0,14])cylinder(r=40,h=60);
    }
}