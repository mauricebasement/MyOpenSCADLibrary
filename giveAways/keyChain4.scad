$fn=50;

linear_extrude(height=2) {
    translate([-0.8,-1.2])import("teilfabriko.dxf");
    translate([0,45/2])difference() {
        circle(r=6);
        circle(r=4);
    }
}