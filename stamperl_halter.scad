/* Stamperlhalter für Schnappsordner 
Harry
3.5.2015
*/

radius = 15;
height = 40;
loch_r=2;
$fn=100;

module spangen(){
	translate([0,0,radius+3]){
		rotate([90,0,0]){
			difference(){
				cylinder(r = (radius+3),h=5,center=true);
				translate([0,1.5,0]) cylinder(r=radius,h=7,center=true);
				rotate([0,0,45]){
					#translate([10,10,0]) cube([(2*radius),(2*radius),7],center=true);
				}
			}
		}
	}
}

module back(){
	translate([-10,-(height-2.5),0]) cube([20,height,3.05]);
	translate([-10,-height,0]) cube([20,3,15]);
	rotate([90,0,0]){
		translate([0,15,height-3]) cylinder(r=10,h=3);
	}
	translate([-1,-height,3]) cube([2,height,1.5]);
}

module loch(x,y){
	translate([x,y,-1]) cylinder(r=loch_r,h=5);
	translate([x,y,1]) cylinder(r1=loch_r,r2=loch_r*2,h=2.1);
}

difference(){
	union(){	
		spangen();
		back();
	}
	loch(x=-5,y=-10);
	loch(x=5,y=-30);
}


