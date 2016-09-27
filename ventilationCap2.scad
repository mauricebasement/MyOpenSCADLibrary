$fn=200;
!mirror([1,0,0])difference() {
    square([550,200]);
    translate([125/2+50,135-30]) {
        tr_xy(x=65)circle(d=5);
        circle(d=125);
    }
}
difference() {
    circle(d=165);
    circle(d=123);
    tr_xy(x=0,y=72.5)circle(r=2.5);
}

module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}