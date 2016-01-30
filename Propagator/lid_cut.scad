$fn=20;

a=660;
b=510;

*difference() {
    square([a,b],center=true);
    square([a-0.1,b-0.1],center=true);
}
pots();

module pots(a=4.5,b=3.5,x=60,r=52/2) {
    for(i=[-a:1:a])
        for(j=[-b:1:b])translate([i*x*1.05,j*x])circle(r=r);
}