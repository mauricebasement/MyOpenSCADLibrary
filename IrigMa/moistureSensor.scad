//Moisture Sensor
$fn=100;
margin = 4;
distance = 15;
radius = 1;
cableHoldX = 5;
cableHoldY = 15;


length = radius*2 + margin*2 + distance; 
width = radius*2 + margin*2; 

difference() {
    square([length,width],center=true);
    for(i=[-1,1])translate([i*distance/2,0])circle(r=radius);
}
translate([0,-cableHoldY/2])square([cableHoldX,cableHoldY],center=true);

