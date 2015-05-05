$fn=50;
x=51;
y=43;
z=126;
module front() {
    back(true);
}
module back(front=false) {
    difference() {
        square([x,y],center=true);
        if(front==false){
            square([23,31],center=true);
            for(i=[-1,1])translate([i*15.5,2.5])circle(r=1);
        }
        if(front==true){
            translate([0,17])square([5,2],center=true);
        }   
        for(i=[-1,1])for(j=[-20,20,-10,10])translate([i*24,j])square(3,center=true);
    }
}
module top() {
    bottom(true);
}
module bottom(top=false) {
    difference() {
        square([x,z],center=true);
        if(top==false)for(i=[-1,1])translate([i*37/2,126/2-5])circle(r=2);
        if(top==true)for(i=[-95:10:95])translate([0,i])square([30,3],center=true);
        for(i=[-1,1])for(j=[-50,50,-20,20])translate([i*(x/2-1.5),j])square(3,center=true);
    }
    for(i=[-1,1])for(j=[-1,1])translate([i*(x/2-1.5),j*(z/2+1.5)])square(3,center=true);
}
module side() {
    square([y-6,z],center=true);
    for(i=[-1,1]){
        for(j=[-50,50,-20,20])translate([i*(y/2-1.5),j])square(3,center=true);
        for(j=[-1,1])translate([i*10,j*(z/2+1.5)])square(3,center=true);
    }
}    

!front();
back();
top();
bottom();
side();