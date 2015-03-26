$fn=50;
holeTolerance=1.05;
module side_flat() {
    difference() {
        square([37,34]);
        for(i=[3.5,37-3.5])translate([i,3.5])circle(r=3/2);
        translate([37-3.5,11.5])circle(r=1.5*holeTolerance);
        translate([0,7])square([7,50]);
        translate([18,25.5])circle(r=7);
        translate([5,25.5])square([37,34]);
        translate([17,18.5])square([37,34]);
    }
}
module side_ext() {
    difference() {
        translate([0,13])rotate(a=[90,0,0])difference() {
            linear_extrude(height=13)side_flat();
            for(i=[3.5,37-3.5])translate([i,3.5,6])cylinder(r=5.4/2,h=16);
        }
        translate([37-21.5,13-8])pipe();
    }
}
module pipe() {
    cylinder(r=3*holeTolerance,$fn=9,h=2);
    translate([0,0,2])cylinder(r=3*holeTolerance,$fn=6,h=6);
    translate([0,0,8])cylinder(r2=1*holeTolerance,r1=1.75*holeTolerance,h=4);
    translate([0,0,11])cylinder(r=1*holeTolerance,h=14);
}
side_ext();