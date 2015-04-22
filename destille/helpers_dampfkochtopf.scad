$fn=100;
circle(r=30);
difference() {
    circle(r=7.5);
    for(i=[-1,1])translate([0,i*4.25])circle(r=1.5);
}