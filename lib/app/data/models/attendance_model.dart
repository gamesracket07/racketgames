// lib/app/data/models/attendance_model.dart
class Student {
  final String id;
  final String name;
  final String rollNo;

  Student({
    required this.id,
    required this.name,
    required this.rollNo,
  });
}

class AttendanceRecord {
  final String studentId;
  bool isPresent;

  AttendanceRecord({
    required this.studentId,
    this.isPresent = true,
  });
}