$fn=100;
//Variables
r1=1.25;
r2=1.75;
len1=32;
len2=33;
module stick_hull() {
	hull() {
		translate([0,len1-r1])circle(r=r1);
		translate([0,-len2+r2])circle(r=r2);
	}
}
module stick_cut() {
	for(i=[0:1.3:2]) {
		translate([r1+0.1,i])scale(v=[1,1])rotate(a=[0,0,45])square(1.5,center=true);
	}
}
module stick1(x) {
		stick_hull();
		translate([-0.4,x])stick_cut();
}
module stick2(x) {
	difference() {
		stick_hull();
		translate([0,x])stick_cut();
	}
}
module ring() {
	intersection(){
		difference() {
			circle(r=9);
			circle(r=6);
		}
		translate([-4,-11])square(8);
	}
}
module klammer(x=5.1,y=4.5) {
	translate([-y,0])rotate(a=[0,0,-x])stick1(29);
    mirror([1,0])translate([-y,0])rotate(a=[0,0,-x])stick2(29);
	translate([0,6])ring();
}
//Extrusion
intersection() {
    linear_extrude(height=20)klammer();
    cube([18,100,40],center=true);
}
