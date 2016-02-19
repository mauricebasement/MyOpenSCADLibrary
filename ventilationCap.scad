$fn=200;
*difference() {
    square(160,center=true);
    tr_xy(x=65)circle(d=5);
    circle(d=125);
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