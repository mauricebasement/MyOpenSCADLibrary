radius = 10.5;
length = 70;
wall = 3;

//Compiled Variables
side = radius*2 + wall*2;

difference() {
    hull()rot()translate([0,0,length/2])cube([side,side,length],center=true);
    rot()translate([0,0,wall])cylinder(r=radius,h=length);
}
module rot() {
    for(i=[[0,0,0],[90,0,0],[0,90,0]])rotate(i)children();
}
    
       