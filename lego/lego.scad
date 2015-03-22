use <write/Write.scad>


Name = "Legostei";


BlockLength = 10;

BlockWidth = 2;


/*	**************** Computed **************************************** */

bln=(BlockLength-1)*8+4.8+1.45*2;
bwd=(BlockWidth-1)*8+4.8+1.45*2;
ltk=0.8+0.1;
lhg=7*1;


/*	**************** Modules ***************************************** */

module give_away();
{
	difference()
	{
		union()
		{
			translate([-bln/2, -bwd/2,0])
			LegoBlck(BlLn=BlockLength, BlWd=BlockWidth);

			translate([-bln/2,-bwd/2,0]) resize([bln,0,7])rotate([90,0,0])
			linear_extrude(height=3)text(Name);
		}

		translate([bln/2+3.85+0.75,bwd/2+3.85+0.75,5.75])
		rotate_extrude(convexity=10, $fn=4*round(20*PI/4/0.5))
		translate([10,0,0]) circle(r=3.5/2, $fn=4*round(3.5*PI/4/0.5));
	}
}


/*	**************** Dual Printing test Modules ********************** */

module dual_block()
{
	difference()
	{
		translate([-bln/2, -bwd/2,,0])
		LegoBlck(BlLn=BlockLength, BlWd=BlockWidth);

		translate([0,-(bwd-1.35)/2,lhg/2+1]) rotate([90,0,0])
		write(Name, t=1.45, h=8,  font = "orbitron.dxf", center=true);

		translate([bln/2+3.85,bwd/2+3.85,5.75])
		rotate_extrude(convexity=10, $fn=4*round(20*PI/4/0.5))
		translate([10,0,0]) circle(r=3.5/2, $fn=4*round(3.5*PI/4/0.5));
	}
}

module dual_letters()
{
	translate([0,-(bwd-(1.35-(ltk-0.1)))/2,lhg/2+1])
	rotate([90,0,0])
	write(Name, t=1.35+(ltk-0.1), h=8,  font = "orbitron.dxf", center=true);
}


module LegoBlck(BlLn = 4, BlWd = 2, BlHg = 1)
{
	block(BlWd, BlLn, BlHg, axle_hole=false, reinforcement=true);
}

module block(width,length,height,axle_hole,reinforcement) {

	od=4.95;
	rd=od/2;
	hg=9.5*height+2;

	x0=0;		x1=rd-0.3;		x2=rd;
	y0=0;		y1=hg-0.3;		y2=hg;

	overall_length=(length-1)*8+4.8+1.45*2;
	overall_width=(width-1)*8+4.8+1.45*2;
	union() {
		difference() {
			union() {
				cube([overall_length,overall_width,height*9.5]);
				translate([4.8/2+1.45,4.8/2+1.45,0]) 
					for (ycount=[0:width-1])
						for (xcount=[0:length-1]) {
							translate([xcount*8,ycount*8,0])
								rotate_extrude(convexity=10, $fn=4*round(od*PI/4/0.5))
								polygon([ [x0,y0],[x2,y0],[x2,y1],[x1,y2],[x0,y2] ]);

//								cylinder(r=4.95/2,h=9.5*height+2,$fs=.1);
					}
			}
			translate([1.45-0.1,1.45-0.1,-1.05])
			cube([overall_length-1.45*2+0.2,overall_width-1.45*2+0.2,9.5*height]);
			if (axle_hole==true)
				if (width>1 && length>1) for (ycount=[1:width-1])
					for (xcount=[1:length-1])
						translate([xcount*8,ycount*8,-9.5/2])  axle(height+1);
		}

		if (reinforcement==true && width>1 && length>1)
			difference() {
				for (ycount=[1:width-1])
					for (xcount=[1:length-1])
						translate([xcount*8,ycount*8,0]) reinforcement(height);
				for (ycount=[1:width-1])
					for (xcount=[1:length-1])
						translate([xcount*8,ycount*8,-0.5]) cylinder(r=6.5/2-0.1, h=height*9.5+0.5, $fs=.1);
			}

		if (width>1 && length>1) for (ycount=[1:width-1])
			for (xcount=[1:length-1])
				translate([xcount*8,ycount*8,0]) post(height,axle_hole);

		if (width==1 && length!=1)
			for (xcount=[1:length-1])
				translate([xcount*8,overall_width/2,0]) cylinder(r=3/2,h=9.5*height,$fs=.1);

		if (length==1 && width!=1)
			for (ycount=[1:width-1])
				translate([overall_length/2,ycount*8,0]) cylinder(r=3/2,h=9.5*height,$fs=.1);
	}
}

module post(height,axle_hole=false) {
	difference() {
		cylinder(r=6.5/2, h=height*9.5,$fs=.1);
		if (axle_hole==true) {
			translate([0,0,-block_height/2])
				axle(height+1);
		} else {
			translate([0,0,-0.5])
				cylinder(r=4.8/2, h=height*9.5+1,$fs=.1);
		}
	}
}

module reinforcement(height) {
	union() {
		translate([0,0,height*9.5/2]) union() {
			cube([1.5,8+4.8+1.45/2,height*9.5],center=true);
			rotate(v=[0,0,1],a=90) cube([1.5,8+4.8+1.45/2,height*9.5], center=true);
		}
	}
}

module axle(height) {
	translate([0,0,height*9.5/2]) union() {
		cube([9.5,2.0,height*9.5],center=true);
		cube([2.0,9.5,height*9.5],center=true);
	}
}
			