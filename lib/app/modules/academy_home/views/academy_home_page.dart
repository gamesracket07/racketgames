// lib/app/modules/academy_home/views/academy_home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/academy_home_controller.dart';

class AcademyHomePage extends GetView<AcademyHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academy Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDashboard(),
            SizedBox(height: 32),
            _buildActionCard(
              icon: Icons.group,
              title: 'Student List',
              subtitle: 'View and manage all students',
              onTap: controller.goToStudentList,
            ),
            SizedBox(height: 16),
            _buildActionCard(
              icon: Icons.check_circle,
              title: 'Attendance',
              subtitle: 'Mark and view attendance',
              onTap: controller.goToAttendance,
            ),
            SizedBox(height: 16),
            _buildActionCard(
              icon: Icons.currency_rupee,
              title: 'Fees',
              subtitle: 'April Month Pending fees',
              onTap: controller.goToFees,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return Obx(() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat('Total', controller.totalStudents.value, Colors.blue),
            _buildStat('Present', controller.presentToday.value, Colors.green),
            _buildStat('Absent', controller.absentToday.value, Colors.red),
          ],
        ),
      ),
    ));
  }

  Widget _buildStat(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}