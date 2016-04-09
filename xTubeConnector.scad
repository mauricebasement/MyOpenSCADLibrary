//Parameters
$fn=50;
dOne = 26.4;
dTwo = 30; // ?? Messen
hOne =10;
hTwo =20;
wall =1.5;
slot = 3;
screwHoleDiameter = 3;
screwNutRadius = screwHoleDiameter * 0.9;

module connector(d=20,h=10) {
    difference() {
        cylinder(r=d/2+wall,h=h,center=true);
        cylinder(r=d/2,h=h,center=true);
        translate([d/2,0])cube([d/2*1.1,slot,h],center=true);
    }
    
    translate([d/2+1.5*wall+screwHoleDiameter/2,slot])screwHold(a=2.5*wall+screwHoleDiameter,b=slot,c=h);
    translate([d/2+1.5*wall+screwHoleDiameter/2,-slot])screwHoldNut(a=2.5*wall+screwHoleDiameter,b=slot,c=h);
}
module screwHold(a,b,c) {
       difference() {
           cube([a,b,c],center=true);
           rotate([90])cylinder(r=screwHoleDiameter/2,h=c,center=true);
       }
}
module screwHoldNut(a,b,c) {
       difference() {
           cube([a,b,c],center=true);
           rotate([90])translate([0,0,-b])cylinder(r=screwHoleDiameter/2,h=c);
           rotate([90])translate([0,0,0])cylinder(r=screwNutRadius,h=b,$fn=6);
       }
}
module assembly() {
    connector(d=dOne,h=hOne);
    translate([-dOne-3*wall,0])rotate([90,0,180])connector(d=dTwo,h=hTwo);
}
module hullCut() {
    intersection() {
        assembly();
        translate([-dOne/2-wall/2,l,0])cube([wall,hTwo,hOne],center=true);
    }
}
assembly();
hull()hullCut();