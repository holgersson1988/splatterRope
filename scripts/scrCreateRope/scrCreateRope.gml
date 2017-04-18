/// @ description Creates a rope from a rope creator
/// @ param ropeCreator instance

var creator = argument0;

var offsetDistance = 1;
var ropeLength = 4;
var collide = true;
var offset = 0;
var start = creator.startX;
var ending = creator.endX;

var distanceDrawn = ending - start;
var gravityStrength = creator.gravityStrength;

var firstRope = instance_create_layer(start + offset, creator.y, creator.layer, objRope);
firstRope.gravityStrength = gravityStrength;

with(firstRope)
{
	var nextRope = id;
	var sections = distanceDrawn div ropeLength;
	repeat(sections)
	{
		// Increase offset
		offset += offsetDistance;
		var lastRope = nextRope;
		// Create a new Rope instance
		nextRope = instance_create_layer(start + offset, creator.y, creator.layer, objRope);
		nextRope.gravityStrength = gravityStrength;
		
		// Attach the two last ropes with a joint
		var link = physics_joint_distance_create(lastRope, nextRope, lastRope.x, lastRope.y, nextRope.x, nextRope.y, collide);
		//physics_joint_set_value(link, phy_joint_max_length, 0);
		physics_joint_set_value(link, phy_joint_damping_ratio, 1);
		physics_joint_set_value(link, phy_joint_frequency, 10);
		with(nextRope){
			parent = lastRope;
		}
	}
}
instance_destroy(creator);