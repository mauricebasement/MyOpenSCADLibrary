$fn=10;
r = 10;
resolution = 50;

function perimeter(radius) = radius*2*pi();
function pi()=3.14159265358979323846;
function trans(i) = [cos(i)*r,sin(i)*r];
function angle(i) = 360/perimeter(r)*i;

module dxf() {
    resize([50,6])import("dxf.dxf",origin =[-208,-60]);
}

module waveSplit(x,y=resolution) {
    translate([-x*50/y,0])intersection() {
        translate([x*50/y,0])square([400/y,6]);
        dxf();
    }
}

module waveExtrusion() {
    for(i=[0:resolution]) {
        a = angle(i);
        translate(trans(a))rotate(a=[0,0,a])rotate(a=[90,0,90])
                linear_extrude(height=3.5)waveSplit(x=i);                   
    }
}    

module ring() {
    difference() {
        cylinder(r=r+3,h=8);
        cylinder(r=r+1,h=8);
    }
}

difference() {
    ring();
    translate([0,0,1])waveExtrusion();
}



