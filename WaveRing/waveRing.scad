//Mock Wave Coordinates
wavePeaks = rands(0.5,4,200);
wavePeaks2 = rands(0.5,4,200);
waveDistances = rands(0.5,1,200);

//Parameters
radius = 10;    //Radius of the Ring
thickness = 1.5;    //Thickness of the Ring
height = 6; //Height of the Ring
scaleFactor = .2;   //Scaling Factor for WaveLenght
scaleFactorZ = 0.5; //Scale Factor for Wave Height
style = 0;  //1: Straight Edges 2:Round Edges
//Implement?   edgeFactor = 1;

//Variables
$fn=1000;
outerRadius = radius + thickness;
length = sum(waveDistances,len(waveDistances)-1,0);
factor = perimeter(radius+thickness*1.5)/perimeter(radius);

//Functions
function pi()=3.14159265358979323846;
function sum(v,i,s=0) = (i==s ? v[i] : v[i] + sum(v,i-1,s));
function trans(i) = [cos(i)*radius*0.99,sin(i)*radius*0.99];
function angle(i) = i/(perimeter(radius)/360);
function perimeter(r) =r*2*pi();

//Wave Extrusion
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
        translate(trans(angle))
            rotate([0,0,angle])
            hull()polyhedron(points=
                [[0,-distance/2,0],
                [0,distance/2,0],
                [0,0,-wavePeaks2[i]*scaleFactorZ],
                [thickness*1.5,-(distance/2)*factor,0],
                [thickness*1.5,(distance/2)*factor,0],
                [thickness*1.5,0,-wavePeaks2[i]*scaleFactorZ]],
                faces=[[0,1,2],[3,4,5]]);
    }
}

//Ring Extrusion
module ring(style) {
    if(style==0)difference() {
        cylinder(r=outerRadius,h=height,center=true);
        cylinder(r=radius,h=height,center=true);
    }
    if(style==1)rotate_extrude()translate([radius+thickness/2,0,0])
        hull()tr_xy(x=0.001,y=(height-thickness*2.5))circle(r=thickness/2);
}

//Render
difference() {
    ring(style);
    wave();
}

//Helper Modules
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}