module tt() {
    translate([0,-1.5])import("tt.stl");
}
module c() {
    import("c.dxf");
}
module d() {
    import("d.dxf");
}

linear_extrude(height=1)projection(cut=true)translate([0,0,-0.5])tt();
linear_extrude(height=1)projection(cut=true)translate([0,0,-227])tt();
linear_extrude(height=1)projection(cut=true)translate([0,0,0.5])rotate([0,90,0])translate([0,0,-227])tt();
linear_extrude(height=1)projection(cut=true)translate([0,0,-0.5])rotate([90,0,0])tt();
linear_extrude(height=1)intersection(){c();translate([-105,0])square(200);}
linear_extrude(height=1)difference(){c();translate([-105,0])square(200);}
linear_extrude(height=1)intersection(){d();translate([0,-115])square(220);}
!linear_extrude(height=1)difference(){d();translate([0,-115])square(220);}