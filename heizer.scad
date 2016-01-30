$fn=50;
schliffRadius1=18.5/2;
schliffRadius2=19.5/2;
x=6;
module heizer() {
    difference() {
        union(){difference() {
            cylinder(r=9,h=80);
            cylinder(r=3,h=80);
        }cylinder(r1=schliffRadius1,r2=schliffRadius2,h=15);}
        for(i=[0:1:x])rotate(a=[0,0,i*360/x])translate([0,6])cylinder(r=2,h=80);
    }
}
heizer();