difference() {
    cube([120,20,6],center=true);
    translate([0,0,1.5])cube([100,20,3],center=true);
    for(i=[-1,1])translate([i*55,0])cylinder(r=2.6,h=6,center=true);
    }