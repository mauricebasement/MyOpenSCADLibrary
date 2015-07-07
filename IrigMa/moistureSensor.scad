//Moisture Sensor
$fn=50;
margin = 5;
distance = 15;
screwR = 1.5;
wallT = 1.2;
hole = 6;

length = wallT*2 + screwR*2 + margin*2 + distance; 
width =  wallT*2 + screwR*2 + margin*2; 
heigth = wallT + hole;

difference() {
    cube([length,width,heigth],center=true);
    union() {
        translate([0,0,wallT])cube([length-wallT*2,width-wallT*2,heigth-wallT],center=true);
        for(i=[-1,1])translate([i*distance/2,0])cylinder(h=heigth,r=screwR,center=true);
    }
}