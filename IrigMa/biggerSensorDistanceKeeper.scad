$fn=50;

i=0.95;

difference() {
    square([26,10],center=true);
    for(j=[-1,1])translate([j*5,0])circle(r=i*1.5);
}
