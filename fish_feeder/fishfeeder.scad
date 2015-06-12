//Laser Cut Fish Feeder
$fn=50;

module wheel() {
    difference() {
        circle(r=50);
        for(i=[0:3])rotate(a=[0,0,i*90])translate([25,0])circle(r=5);
        }
    }
    wheel();