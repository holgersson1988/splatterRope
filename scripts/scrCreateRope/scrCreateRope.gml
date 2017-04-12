/// @ description Creates a rope from a rope creator
/// @ param ropeCreator instance

var creator = argument0;

var offsetDistance = 1;
var ropeLength = 16;
var collide = false;
var offset = 0;
var start = creator.startX;
var ending = creator.endX;

var distanceDrawn = ending - start;

var firstRope = instance_create_layer(start + offset, creator.y, creator.layer, objRope);

with(firstRope)
{
	//var nextRope = instance_create_layer(start, creator.y, creator.layer, objRope);

	//var attach = physics_joint_distance_create(self, nextRope, x, y, nextRope.x, nextRope.y, collide);
	//physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
	//physics_joint_set_value(attach, phy_joint_frequency, 10);


	//with(nextRope){
	//	parent = id;
	//}

	var nextRope = id;
	var sections = distanceDrawn div ropeLength;
	repeat(sections)
	{
		// Increase offset
		offset += offsetDistance;
		var lastRope = nextRope;
		// Create a new Rope instance
		nextRope = instance_create_layer(start + offset*ropeLength, creator.y, creator.layer, objRope);
		// Attach the two last ropes with a joint
		var link = physics_joint_rope_create(lastRope, nextRope, lastRope.x + offset, lastRope.y, nextRope.x, nextRope.y, ropeLength, collide);
		with(nextRope){
			parent = lastRope;
		}
	
		//physics_joint_set_value(link, phy_joint_damping_ratio, 1);
		//physics_joint_set_value(link, phy_joint_frequency, 10);
	}			

}
instance_destroy(creator);