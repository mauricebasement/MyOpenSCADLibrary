$fn=50;

linear_extrude(height=2)
difference() {
    translate([-0.8,-1.2])import("teilfabriko.dxf");
    translate([5.5,40])circle(r=3);
}