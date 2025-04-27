// lib/app/modules/academy_students/controllers/academy_students_controller.dart
import 'package:get/get.dart';
import '../../../data/models/student_model.dart';
import 'package:flutter/material.dart';

class AcademyStudentsController extends GetxController {
  final students = <Student>[
    Student(id: '1', name: 'Alice Smith', rollNo: 'A01', isActive: true),
    Student(id: '2', name: 'Bob Johnson', rollNo: 'A02', isActive: false),
    Student(id: '3', name: 'Charlie Lee', rollNo: 'A03', isActive: true),
  ].obs;

  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final isActive = true.obs;

  void openAddStudent() {
    nameController.clear();
    rollNoController.clear();
    isActive.value = true;
    Get.bottomSheet(_addStudentSheet());
  }

  Widget _addStudentSheet() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New Student', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 12),
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(labelText: 'Roll No', prefixIcon: Icon(Icons.confirmation_number)),
            ),
            SizedBox(height: 12),
            Obx(() => SwitchListTile(
              title: Text(isActive.value ? 'Active' : 'Inactive'),
              value: isActive.value,
              onChanged: (val) => isActive.value = val,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.shade100,
            )),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: addStudent,
              child: Text('Add Student'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }

  void addStudent() {
    if (nameController.text.trim().isEmpty || rollNoController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Name and Roll No are required', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    students.add(Student(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text.trim(),
      rollNo: rollNoController.text.trim(),
      isActive: isActive.value,
    ));
    Get.back();
    Get.snackbar('Success', 'Student added', backgroundColor: Colors.green, colorText: Colors.white);
  }

  void toggleStatus(Student student) {
    student.isActive = !student.isActive;
    students.refresh();
  }
}