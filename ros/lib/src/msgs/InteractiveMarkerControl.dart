// Auto-generated. Do not edit!

// Updated: Sun Jan  7 12:52:59 2024

// (in-package visualization_msgs.msg)


// ignore_for_file: type=lint
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';
import 'package:geometry_msgs/msgs.dart';
import 'Marker.dart';

//-----------------------------------------------------------

class InteractiveMarkerControl extends RosMessage<InteractiveMarkerControl> {
  String name;

  Quaternion orientation;

  int orientation_mode;

  int interaction_mode;

  bool always_visible;

  List<Marker> markers;

  bool independent_marker_orientation;

  String description;

  static InteractiveMarkerControl $prototype = InteractiveMarkerControl();
  InteractiveMarkerControl({ 
    String? name,
    Quaternion? orientation,
    int? orientation_mode,
    int? interaction_mode,
    bool? always_visible,
    List<Marker>? markers,
    bool? independent_marker_orientation,
    String? description,
  }):
  this.name = name ?? '',
  this.orientation = orientation ?? Quaternion(),
  this.orientation_mode = orientation_mode ?? 0,
  this.interaction_mode = interaction_mode ?? 0,
  this.always_visible = always_visible ?? false,
  this.markers = markers ?? [],
  this.independent_marker_orientation = independent_marker_orientation ?? false,
  this.description = description ?? '';

  @override
  InteractiveMarkerControl call({ 
    String? name,
    Quaternion? orientation,
    int? orientation_mode,
    int? interaction_mode,
    bool? always_visible,
    List<Marker>? markers,
    bool? independent_marker_orientation,
    String? description,
  }) => InteractiveMarkerControl(
  name: name,
  orientation: orientation,
  orientation_mode: orientation_mode,
  interaction_mode: interaction_mode,
  always_visible: always_visible,
  markers: markers,
  independent_marker_orientation: independent_marker_orientation,
  description: description,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type InteractiveMarkerControl
    // Serialize message field [name]
    writer.writeString(name);
    // Serialize message field [orientation]
    orientation.serialize(writer);
    // Serialize message field [orientation_mode]
    writer.writeUint8(orientation_mode);
    // Serialize message field [interaction_mode]
    writer.writeUint8(interaction_mode);
    // Serialize message field [always_visible]
    writer.writeUint8(always_visible == false ? 0 : 1);
    // Serialize message field [markers]
    // Serialize the length for message field [markers]
    writer.writeUint32(markers.length);
    markers.forEach((val) {
      val.serialize(writer);
    });
    // Serialize message field [independent_marker_orientation]
    writer.writeUint8(independent_marker_orientation == false ? 0 : 1);
    // Serialize message field [description]
    writer.writeString(description);
  }

  @override
  InteractiveMarkerControl deserialize(ByteDataReader reader) {
    //deserializes a message object of type InteractiveMarkerControl
    final data = InteractiveMarkerControl();
    // Deserialize message field [name]
    data.name = reader.readString();
    // Deserialize message field [orientation]
    data.orientation = Quaternion.$prototype.deserialize(reader);
    // Deserialize message field [orientation_mode]
    data.orientation_mode = reader.readUint8();
    // Deserialize message field [interaction_mode]
    data.interaction_mode = reader.readUint8();
    // Deserialize message field [always_visible]
    data.always_visible = reader.readUint8() != 0;
    // Deserialize message field [markers]
    {
      // Deserialize array length for message field [markers]
      final len = reader.readInt32();
      data.markers = List.generate(len, (_) => Marker.$prototype.deserialize(reader));
    }
    // Deserialize message field [independent_marker_orientation]
    data.independent_marker_orientation = reader.readUint8() != 0;
    // Deserialize message field [description]
    data.description = reader.readString();
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += utf8.encode(name).length;
    markers.forEach((val) {
      length += val.getMessageSize();
    });
    length += utf8.encode(description).length;
    return length + 48;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'visualization_msgs/InteractiveMarkerControl';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'b3c81e785788195d1840b86c28da1aac';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Represents a control that is to be displayed together with an interactive marker

# Identifying string for this control.
# You need to assign a unique value to this to receive feedback from the GUI
# on what actions the user performs on this control (e.g. a button click).
string name


# Defines the local coordinate frame (relative to the pose of the parent
# interactive marker) in which is being rotated and translated.
# Default: Identity
geometry_msgs/Quaternion orientation


# Orientation mode: controls how orientation changes.
# INHERIT: Follow orientation of interactive marker
# FIXED: Keep orientation fixed at initial state
# VIEW_FACING: Align y-z plane with screen (x: forward, y:left, z:up).
uint8 INHERIT = 0 
uint8 FIXED = 1
uint8 VIEW_FACING = 2

uint8 orientation_mode

# Interaction mode for this control
# 
# NONE: This control is only meant for visualization; no context menu.
# MENU: Like NONE, but right-click menu is active.
# BUTTON: Element can be left-clicked.
# MOVE_AXIS: Translate along local x-axis.
# MOVE_PLANE: Translate in local y-z plane.
# ROTATE_AXIS: Rotate around local x-axis.
# MOVE_ROTATE: Combines MOVE_PLANE and ROTATE_AXIS.
uint8 NONE = 0 
uint8 MENU = 1
uint8 BUTTON = 2
uint8 MOVE_AXIS = 3 
uint8 MOVE_PLANE = 4
uint8 ROTATE_AXIS = 5
uint8 MOVE_ROTATE = 6
# "3D" interaction modes work with the mouse+SHIFT+CTRL or with 3D cursors.
# MOVE_3D: Translate freely in 3D space.
# ROTATE_3D: Rotate freely in 3D space about the origin of parent frame.
# MOVE_ROTATE_3D: Full 6-DOF freedom of translation and rotation about the cursor origin.
uint8 MOVE_3D = 7
uint8 ROTATE_3D = 8
uint8 MOVE_ROTATE_3D = 9

uint8 interaction_mode


# If true, the contained markers will also be visible
# when the gui is not in interactive mode.
bool always_visible


# Markers to be displayed as custom visual representation.
# Leave this empty to use the default control handles.
#
# Note: 
# - The markers can be defined in an arbitrary coordinate frame,
#   but will be transformed into the local frame of the interactive marker.
# - If the header of a marker is empty, its pose will be interpreted as 
#   relative to the pose of the parent interactive marker.
Marker[] markers


# In VIEW_FACING mode, set this to true if you don't want the markers
# to be aligned with the camera view point. The markers will show up
# as in INHERIT mode.
bool independent_marker_orientation


# Short description (< 40 characters) of what this control does,
# e.g. "Move the robot". 
# Default: A generic description based on the interaction mode
string description

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: visualization_msgs/Marker
# See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz

uint8 ARROW=0
uint8 CUBE=1
uint8 SPHERE=2
uint8 CYLINDER=3
uint8 LINE_STRIP=4
uint8 LINE_LIST=5
uint8 CUBE_LIST=6
uint8 SPHERE_LIST=7
uint8 POINTS=8
uint8 TEXT_VIEW_FACING=9
uint8 MESH_RESOURCE=10
uint8 TRIANGLE_LIST=11

uint8 ADD=0
uint8 MODIFY=0
uint8 DELETE=2
uint8 DELETEALL=3

Header header                        # header for time/frame information
string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object
int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later
int32 type 		                       # Type of object
int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects
geometry_msgs/Pose pose                 # Pose of the object
geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)
std_msgs/ColorRGBA color             # Color [0.0-1.0]
duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever
bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep

#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
geometry_msgs/Point[] points
#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
#number of colors must either be 0 or equal to the number of points
#NOTE: alpha is not yet used
std_msgs/ColorRGBA[] colors

# NOTE: only used for text markers
string text

# NOTE: only used for MESH_RESOURCE markers
string mesh_resource
bool mesh_use_embedded_materials

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

''';
  }

// Constants for message
  static const int INHERIT = 0;
  static const int FIXED = 1;
  static const int VIEW_FACING = 2;
  static const int NONE = 0;
  static const int MENU = 1;
  static const int BUTTON = 2;
  static const int MOVE_AXIS = 3;
  static const int MOVE_PLANE = 4;
  static const int ROTATE_AXIS = 5;
  static const int MOVE_ROTATE = 6;
  static const int MOVE_3D = 7;
  static const int ROTATE_3D = 8;
  static const int MOVE_ROTATE_3D = 9;

}

