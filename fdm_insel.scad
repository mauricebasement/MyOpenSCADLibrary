//FDM Insel
//Halter an Platte
rRohr = 14*1.1;
module plattenHalter() {
    difference() {
        linear_extrude(height=50, scale=0.5)square(80,center=true);
        cylinder(r=rRohr,h=51);
        tr_xy(x=30) {
            cylinder(r=5,h=25);
            translate([0,0,10])cylinder(r=10,h=40);
        }
    }    
}
//Verbidnungsstück
rRohr2=12*1.1;
rRohr3=14*1.1;
length=100;
wall=10;
distance=28;
module verbindung() {
    *translate([135/2-25,105/2-25])linear_extrude(height=5)platte();
    difference() {
        hull() {
            cube([2*rRohr+wall,2*rRohr+wall,length]);
            cube([2*rRohr2+wall,length,2*rRohr2+wall]);
            cube([length,2*rRohr3+wall,2*rRohr3+wall]);
        }
        translate([rRohr+wall/2,rRohr+wall/2],0)cylinder(h=length,r=rRohr);
        translate([rRohr2+wall/2,distance,rRohr2+wall/2])rotate([-90,0,0])cylinder(h=length,r=rRohr2);
        translate([distance,rRohr3+wall/2,rRohr3+wall/2])rotate([0,90,0])cylinder(h=length,r=rRohr3);
        
    }
}


!plattenHalter();
verbindung();

//Helper Modules
module platte() {
    difference() {
        square([135,105],center=true);
        tr_xy(x=105/2,y=80/2)circle(r=5);
    }
}
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}