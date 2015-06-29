//Modules
module cut() {
    square([16,10.5]);
    translate([134,0])square([16,10.5]);
    translate([134+139,0])square([16,10.5]);
}
module fanCut() {
    tr_xy(x=20)circle(r=1.5);
    circle(r=10);
}
//Translations
module tr_xy(x,y=0) {
	if(y==0) {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,x*j])children();
	} else {
		for(i=[-1,1])for(j=[-1,1])translate([x*i,y*j])children();
	}
}
