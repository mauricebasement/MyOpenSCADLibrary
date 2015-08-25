module tubeRaw() {
    sphere(r=58/2);
    cylinder(r=58/2,h=500-58/2);
}
module tube(precise=false) {
    translate([0,0,58/2])difference() {
        tubeRaw();
        if(precise==true)translate([0,0,10])scale([0.8,0.8,0.99])tubeRaw();
    }
}
module tubeArray() {
    for(i=[1:5]) {
        translate([i*80,0])tube();
    }
}
module bottom(y=100) {
    translate([0,0,0])linear_extrude(height=5)
    difference(){
        translate([0,-y/2])square([480,y]);
        projection(cut=true)translate([0,0,-5])tubeArray();
    }
}

module top(y=100) {
    translate([0,0,450])linear_extrude(height=5)
    difference(){
        translate([0,-y/2])square([480,y]);
        projection(cut=true)translate([0,0,-58/2])tubeArray();
    }
}
module side() {
    rotate([0,90,0])linear_extrude(height=5)difference() {
        square([460,100]);
    }
}
    
tubeArray();
bottom();
top();
*side();
