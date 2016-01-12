$fn=200;

translate([0,0,5.4])ring();


difference() {
    cylinder(d=43,h=5.4);
    translate([0,0,3.5])cylinder(d=36.6,h=3.5);
    difference() {
        cylinder(d=43,h=1.6);
        hull()translate([0,0,1.6])rotate([0,180,0])ring();
    }
}

translate([0,0,3.5])cylinder(h=1,d1=10,d2=7);

hull() {
    cylinder(r=3.5,h=13);
    translate([0,0,13])cylinder(h=0.5,d2=3.5,d=6);
}

translate([0,0,13])cylinder(h=5,d=3.5);

translate([0,0,18])hull() {intersection() {
    sphere(r=3.5);
    cylinder(r=3.5,h=3.5);
} translate([0,0,-0.5])cylinder(d=3.5); }


//Modules
module ring() {
    rotate_extrude() {
        translate([39.8/2,0])circle(r=1.6);
    }
}

//Helper Modules
//Translation
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}       