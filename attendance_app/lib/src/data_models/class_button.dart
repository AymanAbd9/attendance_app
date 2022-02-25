import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ClassButton {
  Map<String, dynamic>? studentButtons = {
    'view_attendance': '/view_attendace',
    'scan_qr': '/scan_qr',
  };
  Map<String, dynamic>? teacherButtons = {
    'view_attendance': '/view_attendace',
    'add_student': '/add_student',
    'show_qr': '/show_qr',
    'edit_attendance': '/edit_attendace',
  };
}
