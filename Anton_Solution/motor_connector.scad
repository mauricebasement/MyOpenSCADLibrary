$fn=100;
module hole() {
	cylinder(r=1.5,h=3);
	translate([0,0,3])cylinder(r=3,h=2);
}

difference() {
	translate([0,0,2.5])cube([42,42,5],center=true);
	for(i=[0:3])rotate(a=[0,0,i*90+45])translate([0,21.213])hole();
	for(i=[1:3])rotate(a=[0,0,i*90])translate([0,13.435])cylinder(r=1.45,h=5);
	cylinder(r=11,h=5);
}
	