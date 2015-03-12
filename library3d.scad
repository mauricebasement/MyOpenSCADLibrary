module ring(r=5,d=1,h=2) {
	difference() {
		cylinder(r=r,h=h);
		cylinder(r=r-d,h=h);
	}
}
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}
module rot_x(x) {
	for(i=[0:3])rotate(a=[0,0,90*i])translate([x,0])children();
}