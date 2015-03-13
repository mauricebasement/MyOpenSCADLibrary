size_x=47;
hole_off=14.5;
circle_dist=26.5;
radius=(size_x-circle_dist)/2;
size_y=25;

difference(){
linear_extrude(height=2)difference(){
	hull()union(){
		for(i=[-1,1]) {
			translate([i*(size_x-2*radius)/2-i*0.5,-radius])circle(r=radius,$fn=100);
		}
		translate([0,-24.5])square([size_x,1],center=true);
	}
	translate([0,-hole_off])circle(d=2.5,$fn=50);
}
translate([0,-hole_off,1])cylinder(r=3.5/2,$fn=50);
}
linear_extrude(height=6)translate([0,-25])square([size_x,1],center=true);