$fn=200;
radius = 10.5;
length = 70;
wall = 2;

//Compiled Variables
side = radius*2 + wall*2;
a= [90,0,0];
b= [0,90,0];

module join() {
    difference() {
        union() {
            hull() {
                cyl();
                rotate(a)cyl();
            }
            hull() {
                rotate(a)cyl();
                rotate(b)cyl();
            }
            hull() {
                cyl();
                rotate(b)cyl();
            }
        }
        rot()translate([0,0,wall])cylinder(r=radius,h=length);
        hull()rot()translate([0,0,wall])cylinder(r=radius,h=0.01);
    }
}

module rot() {
    for(i=[[0,0,0],[90,0,0],[0,90,0]])rotate(i)children();
}

module tr() {
    translate([0,0,length/2])children();
}

module cb() {
    tr()cube([side,side,length],center=true);
}

module cyl() {
    tr()cylinder(r=side/2,h=length,center=true);
}

//Render
join();
difference() {
    hull() {
        intersection() {
            join();
            translate([-50,50,-50])cube([100,100,100],center=true);
        }
    }
    hull()rot()translate([0,0,wall])cylinder(r=radius,h=0.01);
}
        
    
    
       