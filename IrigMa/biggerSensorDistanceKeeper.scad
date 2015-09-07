$fn=50;

i=0.95;

module holes(s=1) {
    for(j=[-1,1])translate([j*5,0])scale(s)circle(r=i*1.5);
}
difference() {
    square([18,8],center=true);
    holes();
}
!difference() {
    hull()holes(s=2);
    holes();
}
