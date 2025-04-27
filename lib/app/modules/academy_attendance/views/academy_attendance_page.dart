// lib/app/modules/academy_attendance/views/academy_attendance_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/academy_attendance_controller.dart';

class AcademyAttendancePage extends GetView<AcademyAttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Attendance'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: controller.saveAttendance,
            tooltip: 'Save Attendance',
          ),
        ],
      ),
      body: Obx(() => ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: controller.students.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final student = controller.students[index];
          final isPresent = controller.attendance[student.id]?.isPresent ?? true;
          return ListTile(
            leading: CircleAvatar(
              child: Text(student.rollNo),
            ),
            title: Text(student.name),
            trailing: Switch(
              value: isPresent,
              onChanged: (_) => controller.toggleAttendance(student.id),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.shade100,
            ),
            subtitle: Text(isPresent ? 'Present' : 'Absent',
                style: TextStyle(
                    color: isPresent ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold)),
            onTap: () => controller.toggleAttendance(student.id),
          );
        },
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.saveAttendance,
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }
}