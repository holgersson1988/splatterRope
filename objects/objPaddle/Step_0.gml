/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

if (!left && !right || (left && right))
{
	if(currSpeed > 0)
	{
		currSpeed = max(0, currSpeed - deceleration*DeltaTime());
	}
	else if (currSpeed < 0)
	{
		currSpeed = min(0, currSpeed + deceleration*DeltaTime());
	}
}
else
{
	if (left)
	{
		currSpeed = max(-maxSpeed, currSpeed - acceleration*DeltaTime());
	}
	if (right)
	{
		currSpeed = min(maxSpeed, currSpeed + acceleration*DeltaTime());
	}
}

physics_apply_local_impulse(0, 0, currSpeed, 0);


// Create Lines
if (keyboard_check_pressed(vk_space))
{
	ropeCreator = instance_create_layer(x, y, layer, objRopeCreator);
	ropeCreator.parent = id;
	drawing = true;
}
if (keyboard_check_released(vk_space) && ropeCreator != noone)
{
	scrCreateRope(ropeCreator);

	ropeCreator = noone;
	drawing = false;
}