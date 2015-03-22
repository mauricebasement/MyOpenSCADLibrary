use<write.scad>

module txt() { 
translate([0,5,0])write("Wo sind den",[0,-20,12],40.5,space=1.2);
write("nur all die",[0,0,12],40.5,space=1.2);
translate([0,-5,0])write("bunten Farben?",[0,-20,12],40.5,space=1.2);
}

difference() {
	cube([2*55,2*25,1]);
	scale(v=[2,2,1])translate([5,10,0])txt();
}
