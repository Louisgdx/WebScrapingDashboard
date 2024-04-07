import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String firstName;
  final String  lastName ;
  late final Timestamp timeStamp ;
  final String content ;

  Message({
    required this.firstName,
    required this.lastName,
    required this.timeStamp,
    required this.content,
  });

  Map<String, dynamic> toHashMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'timeStamp': timeStamp,
      'content': content,
    };
  }

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      firstName: data['firstName'],
      lastName: data['lastName'],
      timeStamp: data['timeStamp'],
      content: data['content'],
    );
  }
}

