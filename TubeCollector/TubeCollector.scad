//TubeCollector

//Parameters
$fn=50;
innerDiameter = 40;
outerDiameter = 45;
hoseDiameter = 10;

module bottom() {
    difference() {
        circle(d=outerDiameter+5);
        circle(d=hoseDiameter);
    }
}
module top() {
    difference() {
        circle(d=innerDiameter);
        circle(d=hoseDiameter);
    }
}
module extrude(h=5) {
    linear_extrude(height=h)children();
}
module assembly() {
    extrude()bottom();
    translate([0,0,5])extrude()top();
}
assembly();