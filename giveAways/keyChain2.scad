a=10;
linear_extrude(height=1)translate([64.4/2-a/2,55/2-a/2])round_square(x=54.4+a,y=45+a,r=7);
linear_extrude(height=2)translate([-0.8,-1.2])import("teilfabriko.dxf");

module round_square(x,y=0,r=0) {
    if(y==0) {
        hull()tr_xy(x=x/2-r)circle(r=r);
    } else {
        hull()tr_xy(x=x/2-r,y=y/2-r)circle(r=r);
    }
}
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}