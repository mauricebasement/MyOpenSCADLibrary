module end() {
    difference() {
        cylinder(r1=18,r=10,h=5);
        cylinder(r=2.7,h=5);
    }
}
module holder() {
    difference(){
        translate([0,0,7.5])cube([15,40,15],center=true);
        cylinder(r=11.3/2,h=5.4,$fn=6);
        cylinder(r=5.4/2,h=15);
        for(i=[-1,1])translate([0,i*12]){
            cylinder(h=15,r=2.5);
            translate([0,0,5])cylinder(h=15,r=5);
        }
    }
}
end();
holder();
