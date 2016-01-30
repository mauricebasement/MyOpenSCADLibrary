difference() {
    square([449,702],center=true);
    pots();
}
module pots() {
    a=130;
    b=220;
    trXY(x=a,y=b)circle(r=107/2);
    rotate(90)trXY(x=0,y=a)circle(r=107/2);
    trXY(x=0,y=b)circle(r=107/2);
    circle(r=107/2);
}
module trXY(x,y=0,spread=false) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}
    