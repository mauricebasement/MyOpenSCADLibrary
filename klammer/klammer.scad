$fn=100;
//Variables
r1=1.5;
r2=1.5;
d1=1.5;
len1=33;
len2=31;
len3=15;
module stick_hull() {
	hull() {
		translate([0,len1-r1])circle(r=r1);
		translate([0,-len2+r2+len3])circle(r=r2);
        translate([0,-len2+r2])translate([-(r2*2-d1),d1/2])square(d1,center=true);
    }
    translate([0,3])internal();
}

module internal(d=1.5,n=5) {
	for(i=[0:d:(n-1)*d]) {
		translate([r1-0.1,i])scale(v=[1,1])rotate(a=[0,0,45])square(1.5,center=true);
	}
}
module ring() {
	intersection(){
		difference() {
			circle(r=9);
			circle(r=7);
		}
		translate([-4,-11])square(8);
	}
}
module klammer(x=3,y=3.7) {
	difference() {
        union() {
            translate([-y,0])rotate(a=[0,0,-x])stick_hull();
            mirror([1,0])translate([-y,0])rotate(a=[0,0,-x])stick_hull();
            translate([0,8])ring();
        }
        translate([0,31])hull()resize([15])claw();
        }
    translate([0,31])resize([7.17])claw();
}
module claw(o1=-0.6,o2=0.6) {
    difference() {
        intersection() {
            hull()for(i=[-1,1])translate([i*0.5,0])circle(r=2);
            translate([0,3])square([10,6],center=true);
        } 
       polygon(points=[[-1-o1,0],[-1.5-o1,0.5],[-1-o1,1],[-2.5-o1,2],[-0.5-o2,2],[-0.5-o2,1.8],[1-o2,1],[0.5-o2,0.5],[1-o2,0]]);
    }
}
//Extrusion
intersection() {
    linear_extrude(height=20)klammer();
    cube([15,100,40],center=true);
}
