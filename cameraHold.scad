module complete() {
    difference() {
    square([100,100],center=true);
    translate([20,13])tr_xy(23/2,58/2)circle(r=3);
    translate([-5,-50])tr_xy(23/2,0)circle(r=3);
    translate([-33,30])square([38.5,42],center=true);
    translate([47,-42])square([6,5.8],center=true);
    translate([47,-30])square([6,5.8],center=true);
    translate([30,-35])circle(r=3);
    translate([38,-20])square([40,80]);
}
translate([-32,40])camera();
translate([-32,19.5])camera();
}

module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}

module camera() {
    difference() {
        square([35,20],center=true);
        translate([0,7.5])square([25,5],center=true);
        translate([0,-7])square([5.8,6],center=true);
    }
}

module render(a=3,b=6) {
for(j=[0:b])for(i=[0:a])translate([i*100.5,j*100.5])complete();
}

render();
