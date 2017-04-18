/// @ description Creates a rope from a rope creator
/// @ param ropeCreator instance

offset = 0;
host = self;
nextRope = instance_create_layer(x, y + offset, layer, objRopeVertical);

attach = physics_joint_distance_create(host, nextRope, host.x, host.y, nextRope.x, nextRope.y, false);
physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
physics_joint_set_value(attach, phy_joint_frequency, 10);

with(nextRope)
{
	parent = other.id;
}

repeat(10)
{
	offset += 1;
	var lastRope = nextRope;
	nextRope = instance_create_layer(x, y + offset, layer, objRopeVertical);

	attach = physics_joint_distance_create(lastRope, nextRope, lastRope.x, lastRope.y, nextRope.x, nextRope.y, false);
	physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
	physics_joint_set_value(attach, phy_joint_frequency, 10);

}