module tetris() {
    translate([])import("tetris.stl");
}
module cuber() {
    translate([0,0,200+115])cube(400,center=true);
}
intersection() {
    tetris();
    cuber();
}
!difference() {
    tetris();
    cuber();
}
