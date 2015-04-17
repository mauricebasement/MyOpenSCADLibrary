//Simple Objects
module ring(r=5,d=1) {
	difference() {
		circle(r=r);
		circle(r=r-d);
	}
}
module round_square(x,y=0,r=0) {
    if(y==0) {
        hull()tr_xy(x=x/2-r)circle(r=r);
    } else {
        hull()tr_xy(x=x/2-r,y=y/2-r)circle(r=r);
    }
}
module slot(x,r,o)  {
    hull()for(i=[-1,1])rotate(o)translate([x/2*i,0])circle(r=r);
}
//Translation Modules
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}
module rot_x(x=0,rotation=90,off=0) {
	for(i=[0:360/rotation-1])rotate(a=[0,0,rotation*i+off])translate([x,0])children();
}
//Support for Hollowed Models
module support(comb=false) {
    intersection() {
        if(comb==false)support_raw();
        if(comb==true)support_honeycomb();
        children();
    }
}
module support_raw(x=20,y=20,d=1.1,t=0.15) {
    for(i=[-1,1])for(j=[0:d:x/2])translate([i*j,0])square([t,y],center=true);
    for(i=[-1,1])for(j=[0:d:x/2])translate([0,i*j])square([x,t],center=true);
}
module support_honeycomb(x=10,y=10,r=0.7,d=0.1,fn=6) {
    for(k=[-1,1])for(l=[0:2*(r+r*sin(30)-d):x]){
        for(i=[1,-1])for(j=[0:2*r*cos(30)-d:y]) {
            translate([k*l,i*j])comb(r,d,fn);
            translate([k*(l+r+r*sin(30)-d),i*(j+cos(30)*r-0.5*d)])comb(r,d,fn);
        }
    }
}
module honeycomb_drainholes(x=10,y=10,r=0.7,d=0.1,fn=6,o1=1,o2=1,ra=0.25) {
    for(k=[-1,1])for(l=[0:(2*(r+r*sin(30)-d))*o1:x]){
        for(i=[1,-1])for(j=[0:(2*r*cos(30)-d)*o2:y]) {
            translate([k*l,i*j])circle(r=ra);
            translate([k*(l+r+r*sin(30)-d),i*(j+cos(30)*r-0.5*d)])circle(r=ra);
        }
    }
}
module comb(r,d,fn) {
    difference() {
        circle(r=r,$fn=fn);
        circle(r=r-d,$fn=fn);
    }
}
module negativ_sq() {
    difference() {
        hull()children();
        children();
    }
}