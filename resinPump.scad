//ResinPump
$fn=50;

//Switch Case
module switchCase() {
    difference() {
        cube([8.4,15.4,7],center=true);
        translate([0,0,-1])cube([6,13,6],center=true);
        translate([0,2,3])cube([3,3,2],center=true);
    }
}
module button() {
    cube([2.5,2.5,4],center=true);
    translate([0,0,-2])cube([3.5,3.5,1],center=true);
}
module case() {
    switchTr()rotate([90,0,90])switchCase();
    difference() {
        cube([49,64,50],center=true);
        cylinder(d=29,h=80,center=true);
        translate([0,0,-2])cube([41.8,56.8,46],center=true);
        for(i=[-1,1])translate([0,i*25,-2])cylinder(r=1,h=50);
        switchTr()scale(1.001,0.99,0.99)hull()rotate([90,0,90])switchCase();
    }
}
module switchTr() {
    for(i=[-1,1])translate([21,i*22,14.50001])children();
}


button();
!case();