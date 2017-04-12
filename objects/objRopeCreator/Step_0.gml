/// @description Insert description here
// You can write your code in this editor

var currentX = parent.x;

var drawing = false;
if (currentX < startX)
{
	startX = currentX;
	drawing = true;
}
if (currentX > endX)
{
	endX = currentX;
	drawing = true;
}
