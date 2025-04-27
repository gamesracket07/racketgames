// lib/app/modules/profile/controllers/profile_controller.dart
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../../data/models/player_model.dart';

class ProfileController extends GetxController {
  final player = Player(
    id: 1,
    team: 'Team A',
    country: 'USA',
    rank: 1,
    gender: 'Male',
    individualScore: 1000,
    name: 'John Doe',
    email: 'john@example.com',
    phone: '+1234567890',
    photoUrl: null,
  ).obs;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final isEditing = false.obs;
  final pickedImage = Rxn<XFile>();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final parentContactController = TextEditingController();

  String? dateOfBirth;
  String? address;
  String? parentContactNo;

  void openEditProfile() {
    emailController.text = player.value.email;
    phoneController.text = player.value.phone;
    pickedImage.value = null;
    isEditing.value = true;
    Get.bottomSheet(_editProfileSheet());
  }

  Widget _editProfileSheet() {
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
            Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            GestureDetector(
              onTap: pickImage,
              child: Obx(() => CircleAvatar(
                    radius: 40,
                    backgroundImage: pickedImage.value != null
                        ? FileImage(File(pickedImage.value!.path))
                        : (player.value.photoUrl != null
                            ? NetworkImage(player.value.photoUrl!)
                            : null) as ImageProvider?,
                    child: pickedImage.value == null && player.value.photoUrl == null
                        ? Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                        : null,
                  )),
            ),
            SizedBox(height: 16),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                hintText: player.value.name,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Mobile No', prefixIcon: Icon(Icons.phone)),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12),
            TextField(
              controller: dobController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                prefixIcon: Icon(Icons.cake),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: pickDateOfBirth,
            ),
            SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.home),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 12),
            TextField(
              controller: parentContactController,
              decoration: InputDecoration(
                labelText: 'Parent Contact No',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text('Save'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image != null) {
      pickedImage.value = image;
    }
  }

  void saveProfile() {
    player.update((val) {
      val!.email = emailController.text;
      val.phone = phoneController.text;
      if (pickedImage.value != null) {
        val.photoUrl = pickedImage.value!.path; // For demo, use local path
        // In real app, upload to server and use the URL
      }
    });
    isEditing.value = false;
    Get.back();
    Get.snackbar('Success', 'Profile updated', backgroundColor: Colors.green, colorText: Colors.white);
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    parentContactController.dispose();
    super.onClose();
  }

  void pickDateOfBirth() {
  }
}