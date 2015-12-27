$fn=100;

radius = 10;
thickness = 1.5;
height = 6;
outerRadius = radius + thickness;
scaleFactor = 0;

//Mock Wave Coordinates
wavePeaks = [5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,1,2,3,4,5,6,5,4,3,2,1];
waveDistances = [1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1];

circ = radius*2*pi();

length = sum(waveDistances,len(waveDistances)-1,0);

function pi()=3.14159265358979323846;
function sum(v,i,s=0) = (i==s ? v[i] : v[i] + sum(v,i-1,s));
function trans(i) = [cos(i)*radius*0.95,sin(i)*radius*0.95];
function angle(i) = 360/circ*i;

module wave() {
    for(i=[0:len(waveDistances)]) {
        distance = waveDistances[i];
        angle = angle((sum(waveDistances,i,0)-waveDistances[i])/2.2);
        translate(trans(angle))
            hull()
            rotate([0,0,angle])polyhedron(points=[[0,0,0],[0,distance,0],[0,distance/2,wavePeaks[i]],[thickness*1.5,0,0],[thickness*1.5,distance,0],[thickness*1.5,distance/2,wavePeaks[i]]],faces=[[3,4,5],[0,1,2]]);
    }
}
module ring() {
    difference() {
        cylinder(r=outerRadius,h=height,center=true);
        cylinder(r=radius,h=height,center=true);
    }
}
//!wave();

difference() {
    ring();
    wave();
}



