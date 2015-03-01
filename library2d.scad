module ring(r=5,d=1) {
	difference() {
		circle(r=r);
		circle(r=r-d);
	}
}
module square_hole(sx=10,sy=0,x=3,y=0,r=1) {
	difference() {
		square([sx,setY(x=sx,y=sy)],center=true);
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*i]);
	}
}
function setY(x,y) = {
	if(y==0)	return x;
	return y;
}
square_hole(sx=40,sy=10,x=10,r=2.5);*/
