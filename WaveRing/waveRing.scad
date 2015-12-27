//Mock Wave Coordinates
wavePeaks = [1,2,1,3,1,4,1,2,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,1,2,3,4,5,6,5,4,3,2,1];
waveDistances = [1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1];

//Parameters
radius = 10;
thickness = 1.5;
height = 6;
scaleFactor = .1;
scaleFactorZ = 0.5;

//Variables
$fn=200;
outerRadius = radius + thickness;
length = sum(waveDistances,len(waveDistances)-1,0);
factor = perimeter(radius+thickness*1.5)/perimeter(radius);

//Functions
function pi()=3.14159265358979323846;
function sum(v,i,s=0) = (i==s ? v[i] : v[i] + sum(v,i-1,s));
function trans(i) = [cos(i)*radius*0.99,sin(i)*radius*0.99];
function angle(i) = i/(perimeter(radius)/360);
function perimeter(r) =r*2*pi();

module wave() {
    for(i=[0:len(waveDistances)]) {
        distance = waveDistances[i]*scaleFactor;
        angle = angle(sum(waveDistances,i,0)-waveDistances[i]/2)*scaleFactor;
        offSet = ((distance*factor)-distance)/2;
        translate(trans(angle))
            rotate([0,0,angle])
            hull()polyhedron(points=
                [[0,-distance/2,0],
                [0,distance/2,0],
                [0,0,wavePeaks[i]*scaleFactorZ],
                [thickness*1.5,-(distance/2)*factor,0],
                [thickness*1.5,(distance/2)*factor,0],
                [thickness*1.5,0,wavePeaks[i]*scaleFactorZ]],
                faces=[[0,1,2],[3,4,5]]);
    }
}
module ring() {
    difference() {
        cylinder(r=outerRadius,h=height,center=true);
        cylinder(r=radius,h=height,center=true);
    }
}

!wave();

difference() {
    ring();
    wave();
}



