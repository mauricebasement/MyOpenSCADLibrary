$fn=100;
angle = 180;
wavePeaks = [5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,5,4,3,2,2,3,1,2,3,4,5,6,5,4,3,2,1];
waveDistances = [1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1];
r = 50;
circ = r*2*pi();

length = sum(waveDistances,len(waveDistances)-1,0);

function pi()=3.14159265358979323846;
function sum(v,i,s=0) = (i==s ? v[i] : v[i] + sum(v,i-1,s));
function trans(i) = [cos(i)*r,sin(i)*r];
function angle(i) = 360/circ*i;

module dxf() {
    import("dxf.dxf");
}

module wave() {
    //for(i=[0,1])mirror([0,i,0])
    for(i=[0:len(waveDistances)]) {
        distance = waveDistances[i];
        translate([sum(waveDistances,i,0)-waveDistances[i],0])
            polygon(points=[[0,0],[distance,0],[1/2*distance,wavePeaks[i]]]);
    }
}

module waveExtrusion() {
    for(i=[0,1])mirror([0,0,i])for(i=[0:len(waveDistances)-1]) {
        distance = waveDistances[i]*1.05;
        a = angle(sum(waveDistances,i,0)-waveDistances[i]);
        translate(trans(a))rotate(a=[0,0,a])rotate(a=[90,0,90])
                linear_extrude(height=2)polygon(points=[[0,0],[distance,0],[1/2*distance,wavePeaks[i]]]);
                    
    }
}    
module ring() {
    difference() {
        cylinder(r=52,h=30,center=true);
        cylinder(r=51,h=30,center=true);
    }
}
difference() {
    ring();
    waveExtrusion();
}



