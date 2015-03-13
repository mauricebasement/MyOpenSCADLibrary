$fn=50;
module hold() {
	difference() {
		scale([10,6.5])cylinder(r=0.5,h=26);
		translate([0,0,23])rotate([90,0,0])cylinder(r=1,h=10,center=true);
	}
}
module base() {
	translate([0,0,-5])cube([45,45,10],center=true);
}

hold();
base();