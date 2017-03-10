/*Compartments
Simple Script to generate Compartments for a rectangular container.
*/

//Settings
xNr = 9;
yNr = 9;
xD = 433;
yD = 366;
depth = 50;
thickness = 6;
end = 1;
margin = .01;

//Make Planes
module horizontalPlane() {
    linear_extrude(height=thickness)difference() {
        square([yD,depth]);
        for(i=[end:yNr-end])translate([i*(yD-thickness)/yNr,0])square([thickness,depth/2]);
    }
}
module verticalPlane() {
    linear_extrude(height=thickness)translate([xD,depth])rotate(a=[0,0,180])difference() {
        square([xD,depth]);
        for(i=[end:xNr-end])translate([i*(xD-thickness)/xNr,0])square([thickness,depth/2]);
    }
}

//Render
module render() {
    for(i=[end:xNr-end])translate([0,0,i*(xD-thickness)/xNr])horizontalPlane();
    for(i=[end:yNr-end])translate([i*(yD-thickness)/yNr,0,0])translate([0,0,xD])rotate([0,90,0])verticalPlane();
}    
//Export
module export() {
    for(i=[end:yNr-end])translate([yD+margin,i*(depth+margin),0])projection()verticalPlane();
    for(i=[end:xNr-end])translate([0,i*(depth+margin)])projection()horizontalPlane();
}

render();
!export();
