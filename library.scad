$fn=50;
//2D
module ring(r=5,d=1) {
	difference() {
		circle(r=r);
		circle(r=r-d);
	}
}
//3D
module ring(r=5,d=1,h=2) {
	difference() {
		cylinder(r=r,h=h);
		cylinder(r=r-d,h=h);
	}
}

//Marcellos Ringe
//ring(r=10,d=4,h=1.1);
//ring(r=10,d=4,h=1.3);
//ring(r=10,d=4,h=2);

//Marcellos Halbyzylinder
/*difference() {
	ring(r=31/2,d=2.75,h=30);
	cube([31,1,30*2],center=true);
}*/
