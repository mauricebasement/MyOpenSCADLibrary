$fn=20;

a=660;
b=510;

module lidCut() {
    *difference() {
        square([a,b],center=true);
        square([a-0.1,b-0.1],center=true);
    }
pots();
}



module pots(a=5.5,b=4.5,x=50,r=32/2) {
    for(i=[-a:1:a])
        for(j=[-b:1:b])translate([i*x*1.05,j*x])circle(r=r);
}

lidCut();
