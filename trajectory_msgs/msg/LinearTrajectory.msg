# A linear trajectory is defined here as a list of 6D poses with associated
# timing information, and optional velocity, acceleration, forces and torques.
#
# Trajectories are defined as moving a specified Cartesian frame through a
# Cartesian coordinate system with a specified origin. It is assumed the
# location of the origin (relative to other such origins) is provided by an
# external system (fi: TF in the case of ROS).
#
# Several fields in this message are required fields. Recipients of this message
# must either ignore malformed incoming messages or return an error whenever
# possible.

# A standard ROS message header.
#
# ## header.frame_id
#
# This field provides the name of the TF frame which defines the origin of the
# coordinate system relative to which the poses in this trajectory are defined.
#
# It is an error to leave 'header.frame_id' empty.
#
# Recipients of trajectories are required to verify 'header.frame_id' and
# compare it to whichever coordinate system they intend to use for execution of
# the trajectory. In case of mismatch, they are required to transform all poses,
# velocities, accelerations and wrenches to 'header.frame_id' before proceeding
# with execution. The field 'header.stamp' should be used in this case to lookup
# the value of the transform at the correct time.
#
# Note: only a single origin is supported. Producers of trajectories are
# required to transform trajectory points relative to other origins to a
# common origin before adding them to a trajectory. Failure to do so will most
# likely result in unintended and/or unexpected motion.
#
# ## header.seq
#
# This field is not used.
#
# ## header.stamp
#
# This field is set to the time at which the trajectory was created.
#
# TODO: align semantics of 'stamp' with JointTrajectory::header.
std_msgs/Header header

# The trajectory describes the motion of this frame relative to
# 'header.frame_id'.
#
# It is an error to leave this field empty.
string child_frame_id

# List of points in this trajectory.
#
# Each point in the trajectory specifies at least a valid pose and a time at
# which that pose must be reached by 'child_frame_id'.
#
# All other fields are optional.
#
# Refer to the documentation of 'LinearTrajectoryPoint' for more information
# on the contents of its fields.
trajectory_msgs/LinearTrajectoryPoint[] points
