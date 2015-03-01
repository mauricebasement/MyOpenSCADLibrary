module ring(r=5,d=1,h=2) {
	difference() {
		cylinder(r=r,h=h);
		cylinder(r=r-d,h=h);
	}
}