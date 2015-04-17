use <../library2d.scad>

$fn=100;
side = 40;
r = 2.5;

module klammer(x=25,r=2.5) {
    difference() {
        flat(side,r);
        for(i=[-1,1])translate([0,i*x/2])slot(x,r,0);
        translate([x/2,0])slot(0,r,x);
        scale([1,1.01])cut();
    }    
    translate([side/2+5,0])difference() {
        round_square(15,20,r);
        circle(r=3);
    }
}
module cut() {
    difference() {
        translate([5,0])square([10,20],center=true);
        circle(r=10);
    }
}
module slot(x,r,y)  {
    hull()for(i=[-1,1])translate([x/2*i,y/2*i])circle(r=r);
}
module flat(x,r,y) {
    hull()tr_xy(x/2-r)circle(r=r);
}
linear_extrude(height=2)klammer();