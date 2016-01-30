//Costumizable Ring

//Variables
$fn = 50;
ringSize = 10; //Grösse des Ringes (Tabelle aus Internet)
ringProfile = 4; //Querschnitt des Ringes


//Profile Chooser
function profile() {
    if(ringProfile == 1) return square(4,center=true);
    if(ringProfile == 2) return square([3,8],center=true);
    if(ringProfile == 3) return circle(r=2);
    if(ringProfile == 4) return scale([1,2,1],circle(r=2));
}

function ring() {
    return rotate_extrude(translate([ringSize,0],profile()));
}



function main() {
    return ring();
}