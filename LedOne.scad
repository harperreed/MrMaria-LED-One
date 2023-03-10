/*

Mr Maria LED One replacement

- uses esp32 
- uses neopixel ring
- a bit tight and needs some tweaks, but works well. 


This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/



*/

echo(version = version());
versionNumber = "0.13";

// The diameter of the one led
diameter = 90;

// Set the thickness of the circle
thickness = 1;

// Screw holes

screw_hole_position = [ 0, 120, 240 ]; // hole positions
screw_hole_distance = 6;               // Set the distance from the edge of the circle to the holes
screw_hole_radius = 2;                 // Set the radius of the holes

// neopixel measurements
neopixel_mount_inner_diameter = 23;
neopixel_mount_outer_diameter = 39;
neopixel_mount_height = 6;

// wire hole
wire_hole_size = 4;
wire_hole_position = 240; // 60;

// miffy mount size
miffy_mount_diameter = 45;

module wireHole()
{
	// wire hole
	rotate(wire_hole_position)
	translate([ (neopixel_mount_outer_diameter / 2) + wire_hole_size - 1, 0 ])
	cylinder(r = wire_hole_size, h = thickness + 9, center = true);
}

// neopixel mount
module neoPixelMount()
{
	// neopixel mount
	cylinder(r = neopixel_mount_inner_diameter / 2, h = thickness + neopixel_mount_height);

	difference()
	{

		// miffy hole mount
		cylinder(r = miffy_mount_diameter / 2 - 2, h = thickness + 3);

		// neopixel_mount_outer_diameter
		cylinder(r = neopixel_mount_outer_diameter / 2, h = thickness + neopixel_mount_height);

		wireHole();
	}
}

// base of the led mount
module base()
{
	// Calculate the radius of the circle
	radius = diameter / 2;

	// Generate the circle
	difference()
	{

		// base
		cylinder(r = radius, h = thickness, center = true);

		// screw holes
		for (i = screw_hole_position)
		{
			rotate(i)
			translate([ radius - screw_hole_distance, 0 ])
			cylinder(r = screw_hole_radius, h = thickness + 2 * screw_hole_radius, center = true);
		}

		wireHole();
	}
}

// mount to fit in the miffy hole
module miffyMount()
{
	difference()
	{
		// miffy hole mount
		cylinder(r = miffy_mount_diameter / 2, h = thickness + .5);

		wireHole();
	}
}

module version()
{
	versionBaseStr = "Mr Maria RGB Led Base";
	versionStr = str(versionBaseStr, " v.", versionNumber);

	rotate([ 0, 180, -30 ])
	translate([ 0, -30, 1 ])
	linear_extrude(height = 0.5)
	{
		text(versionStr, size = 3, halign = "center", valign = "center");
	}
}

module esp32Case()
{
	rotate([ 0, 180, -30 ])
	translate([ -18, -28, 0 ])
	import("./models/ESP32 D1 Mini Case -- Solid -- Bottom.stl");
}

module cableguide()
{

	cableGuideHeight = 10;
	cableGuideRadius = 2;
	cableGuideRotation = [ 0, 180, 60 ];
	cableguidePosition1 = [ -30, 0, 0 ];
	cableguidePosition2 = [ -40, 0, 0 ];

	rotate(cableGuideRotation)
	translate(cableguidePosition1)
	cylinder(r = cableGuideRadius, h = cableGuideHeight, center = false);

	rotate(cableGuideRotation)
	translate(cableguidePosition2)
	cylinder(r = cableGuideRadius, h = cableGuideHeight, center = false);
}

module MrMariaLEDOne()
{

	base();

	miffyMount();

	neoPixelMount();

	version();

	difference()
	{
		esp32Case();
		wireHole();
	}

	cableguide();
}

MrMariaLEDOne(); // Let's get that adapter going!
