$fn=50;
module face() {
    difference() {
        square([60,48]);
        for(i=[[15,3],[57,45]])translate(i)circle(r=1.5);
    }
}

linear_extrude(height=23)face();