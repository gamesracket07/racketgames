// lib/app/modules/academy_students/views/academy_students_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/academy_students_controller.dart';

class AcademyStudentsPage extends GetView<AcademyStudentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: controller.openAddStudent,
            tooltip: 'Add Student',
          ),
        ],
      ),
      body: Obx(() => ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: controller.students.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final student = controller.students[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(student.rollNo),
            ),
            title: Text(student.name),
            subtitle: Text(student.isActive ? 'Active' : 'Inactive',
                style: TextStyle(
                    color: student.isActive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold)),
            trailing: Switch(
              value: student.isActive,
              onChanged: (_) => controller.toggleStatus(student),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.shade100,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.openAddStudent,
        child: Icon(Icons.person_add),
        tooltip: 'Add Student',
      ),
    );
  }
}