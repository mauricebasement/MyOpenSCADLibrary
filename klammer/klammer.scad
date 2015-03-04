$fn=100;
//Variables
r1=1;
r2=1.5;
len1=32;
len2=33;
module stick_hull() {
	hull() {
		translate([0,len1-r1])circle(r=r1);
		translate([0,-len2+r2])circle(r=r2);
	}
}
module stick_cut() {
	for(i=[0:1.3:10]) {
		translate([r1+0.1,i])scale(v=[1,1.5])rotate(a=[0,0,45])square(1,center=true);
	}
}
module stick() {
	difference() {
		stick_hull();
		translate([0,22])stick_cut();
	}
}
module ring() {
	intersection(){
		difference() {
			circle(r=7.5);
			circle(r=6);
		}
		translate([-3,-11])square(6);
	}
}
module klammer() {
	for(i=[0,1])mirror([i,0])translate([-3,0])rotate(a=[0,0,-4])stick();
	translate([0,6])ring();
}
//Extrusion
linear_extrude(height=20)klammer();