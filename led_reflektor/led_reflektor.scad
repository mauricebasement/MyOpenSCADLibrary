include <..\library2d.scad>
$fn=100;

// Aufhängung
difference() {
	square(120,center=true);
	circle(r=41);
	tr_xy(x=35.75)circle(r=2.5);
	tr_xy(x=52)circle(r=3);
}

// Relektor Abdeckung
!difference() {
	square(100,center=true);
	circle(r=41);
	tr_xy(x=35.75)circle(r=2.5);
	rot_x(x=47)slots();
}
// Reflektor Seiten
x=120;
y=90;
difference() {
	rot_x(x=0)translate([0,50.01])polygon(points=[[50,0],[y,x],[-y,x],[-50,0]]);
	rot_x(x=54)slots();
	rot_x(x=165)slots(x=86,y=108);		
}
//ZipTie Slots
module slots(x=35,y=0) {
	for(i=[-1,1])translate([0,i*x])rotate([0,0,i*y])square([2,4],center=true);
}