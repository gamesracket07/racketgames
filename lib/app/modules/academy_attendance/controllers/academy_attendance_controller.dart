// lib/app/modules/academy_attendance/controllers/academy_attendance_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/attendance_model.dart';

class AcademyAttendanceController extends GetxController {
  // Dummy student list
  final students = <Student>[
    Student(id: '1', name: 'Alice Smith', rollNo: 'A01'),
    Student(id: '2', name: 'Bob Johnson', rollNo: 'A02'),
    Student(id: '3', name: 'Charlie Lee', rollNo: 'A03'),
    // ...add more students as needed
  ].obs;

  // Map studentId -> AttendanceRecord
  final attendance = <String, AttendanceRecord>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize all as present
    for (var student in students) {
      attendance[student.id] = AttendanceRecord(studentId: student.id, isPresent: true);
    }
  }

  void toggleAttendance(String studentId) {
    attendance[studentId] = AttendanceRecord(
      studentId: studentId,
      isPresent: !(attendance[studentId]?.isPresent ?? true),
    );
  }

  void saveAttendance() {
    // Here you would send attendance.values.toList() to your backend
    Get.snackbar('Success', 'Attendance saved!', backgroundColor: Colors.green, colorText: Colors.white);
  }
}