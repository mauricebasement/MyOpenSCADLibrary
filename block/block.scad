$fn=50;
module side_flat() {
    difference() {
        square([37,34]);
        for(i=[3.5,37-3.5])translate([i,3.5])circle(r=3/2);
        translate([37-3.5,11.5])circle(r=8/2);
        translate([0,7])square([7,50]);
        translate([18,25.5])circle(r=7);
        translate([5,25.5])square([37,34]);
        translate([17,18.5])square([37,34]);
    }
}
module side_ext() {
    difference() {
        translate([0,16])rotate(a=[90,0,0])difference() {
            linear_extrude(height=16)side_flat();
            for(i=[3.5,37-3.5])translate([i,3.5,2])cylinder(r=5.4/2,h=16);
        }
        translate([21.5,11])cylinder(r=2,h=30);
    }
}

side_ext();