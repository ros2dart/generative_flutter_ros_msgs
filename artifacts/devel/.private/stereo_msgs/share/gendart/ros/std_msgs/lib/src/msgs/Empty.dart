// Auto-generated. Do not edit!

// Updated: Fri Jan  5 12:59:15 2024

// (in-package std_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class Empty extends RosMessage<Empty> {
  static Empty $prototype = Empty();
  Empty();

  @override
  Empty call() => Empty();

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type Empty
  }

  @override
  Empty deserialize(ByteDataReader reader) {
    //deserializes a message object of type Empty
    final data = Empty();
    return data;
  }

  int getMessageSize() {
    return 0;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'std_msgs/Empty';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''
''';
  }

}

