// lib/app/data/models/student_model.dart
class Student {
  final String id;
  String name;
  String rollNo;
  bool isActive;

  Student({
    required this.id,
    required this.name,
    required this.rollNo,
    this.isActive = true,
  });
}