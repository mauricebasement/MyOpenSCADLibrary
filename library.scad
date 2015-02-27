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