//20-25 Loch 16 von wand
//40 Stark
//105 Breit
//50 Hoch

difference() {
    cube([115,50,40],center=true);
    translate([0,-2.5,-5])cube([107,45,40],center=true);
    translate([0,-6])rotate([0,90,0])hull() {
        translate([0,-5])cylinder(r=2.5,h=120,center=true);
        translate([0,5])cylinder(r=2.5,h=120,center=true);
    }
    for(i=[-1,1])translate([i*20,25,0])rotate([90,0,0])cylinder(r=8.5,h=10);
}
    

