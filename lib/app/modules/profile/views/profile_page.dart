// lib/app/modules/profile/views/profile_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'dart:io';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: controller.openEditProfile,
            tooltip: 'Edit Profile',
          ),
        ],
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Obx(() => CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.player.value.photoUrl != null
                          ? (controller.player.value.photoUrl!.startsWith('http')
                              ? NetworkImage(controller.player.value.photoUrl!)
                              : FileImage(File(controller.player.value.photoUrl!))) as ImageProvider
                          : null,
                      child: controller.player.value.photoUrl == null
                          ? Icon(Icons.person, size: 50, color: Colors.grey)
                          : null,
                    )),
                SizedBox(height: 24),
                _buildInfoTile(Icons.person, 'Name', controller.player.value.name),
                SizedBox(height: 16),
                _buildInfoTile(Icons.email, 'Email', controller.player.value.email),
                SizedBox(height: 16),
                _buildInfoTile(Icons.phone, 'Mobile No', controller.player.value.phone),
              ],
            ),
          )),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: TextStyle(fontSize: 16)),
      tileColor: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}