//TubeCollector

//Parameters
$fn=50;
innerDiameter = 40;
outerDiameter = 45;
hoseDiameter = 10;
tubeLenght = 3000;

//Seal
module bottomSeal() {
    difference() {
        circle(d=outerDiameter+5);
        circle(d=hoseDiameter);
    }
}
module topSeal() {
    difference() {
        circle(d=innerDiameter);
        circle(d=hoseDiameter);
    }
}
module assemblySeal() {
    extrude()bottomSeal();
    translate([0,0,5])extrude()topSeal();
}
//Printed Seal
module seal() {
    difference() {
        union() {
            cylinder(r=20,h=3);
            translate([0,0,3])cylinder(r1=20,r2=21,h=7);
        }
        union() {
            cylinder(r=5.5,h=3);
            translate([0,0,3])cylinder(r1=5.5,r2=6.5,h=7);
        }
    }
}

//Sealed Pipe
module sealedPipe(printedSeal=true) {
    rotate(a=[90,0,0])translate([0,0,-tubeLenght/2]){
        extrude(h=tubeLenght)difference() {
            circle(d=outerDiameter);
            circle(d=innerDiameter);
        }
        if(printedSeal==false) {
            translate([0,0,-5])assemblySeal();
            translate([0,0,tubeLenght+5])mirror([0,0,1])assemblySeal();
        }
        if(printedSeal==true) {
            translate([0,0,5])rotate([0,180,0])seal();
            translate([0,0,tubeLenght-5])mirror([0,0,1])rotate([0,180,0])seal();
        }
    }
}
//Pipe Holder
module pipeHolder() {
    difference() {
        square([60,250],center=true);
        for(i=[0:3])translate([0,i*(outerDiameter+10)-82.5]){
            hull(){
                circle(d=outerDiameter);
                translate([outerDiameter/2+10,0])square([1,outerDiameter],center=true);
            }
            for(i=[0,1])mirror([0,i,0])translate([-outerDiameter/2,(outerDiameter+5)/2])square(5,center=true);
        }
    }
}
//Assembly
module assembly() {
    for(i=[0:3])translate([0,0,i*(outerDiameter+10)-82.5])sealedPipe();
    for(i=[-3:3])translate([0,i*(tubeLenght/6-5),0])rotate([90,0,0])extrude()pipeHolder();
}
assembly();

//Helper Modules
module extrude(h=5) {
    linear_extrude(height=h)children();
}