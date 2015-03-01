use<library.scad>

//marcel_velo
ring(r=10,d=4,h=1.1);
ring(r=10,d=4,h=1.3);
ring(r=10,d=4,h=2);

Halbyzylinder
difference() {
	ring(r=31/2,d=2.75,h=30);
	cube([31,1,30*2],center=true);
}
