$fn=100;
!difference() {
    circle(r=15);
    circle(r=1.5);
}
difference() {
    circle(r=7.5);
    for(i=[-1,1])translate([0,i*4.25])circle(r=1.5);
}