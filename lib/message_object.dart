import 'package:flutter/material.dart';

class MessageObject {
  String? message;
  int? personType;
  String? time;

  MessageObject({
    this.message,
    this.personType,
    this.time,
  });

  factory MessageObject.fromJson(Map<String, dynamic> json) => MessageObject(
        message: json["message"],
        personType: json["person_type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "person_type": personType,
        "time": time,
      };
}
