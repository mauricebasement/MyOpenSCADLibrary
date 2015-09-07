$fn=50;

i=0.95;

module holes(s=1) {
    for(j=[-1,1])translate([j*5,0])scale(s)circle(r=i*1.5);
}
difference() {
    square([26,10],center=true);
    holes();
}
!difference() {
    hull()holes(s=1.6);
    holes();
}
