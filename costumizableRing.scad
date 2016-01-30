//Costumizable Ring

//Variables
$fn = 50;
ringSize = 10; //Grösse des Ringes (Tabelle aus Internet)
ringProfile = 4; //Querschnitt des Ringes


//Profile Chooser
module profile() {
    if(ringProfile == 1) square(4,center=true);
    if(ringProfile == 2) square([3,8],center=true);
    if(ringProfile == 3) circle(r=2);
    if(ringProfile == 4) scale([1,2,1])circle(r=2);
}

module ring() {
    rotate_extrude()translate([ringSize,0])profile();
}

ring();