//Air Valve Prototype

//Variables
bladeH = 80;
bladeW = 20;
gearT = 5;
jointT = 5;
jointW = 5;

//Blade
module blade() {
    square([bladeW,bladeH],center=true);
    square([jointW,bladeH+2*(gearT+jointT)],center=true);
}

linear_extrude(height=5)blade();