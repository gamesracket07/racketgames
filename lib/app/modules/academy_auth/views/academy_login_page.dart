// lib/app/modules/academy_auth/views/academy_login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/academy_auth_controller.dart';

class AcademyLoginPage extends GetView<AcademyAuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48),
              _buildHeader(),
              SizedBox(height: 48),
              _buildLoginForm(),
              SizedBox(height: 24),
              _buildLoginButton(),
              SizedBox(height: 16),
              _buildRememberMeAndForgotPassword(),
              SizedBox(height: 32),
              _buildDivider(),
              SizedBox(height: 32),
              _buildHelpSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.sports_tennis,
            size: 64,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Academy Login',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Login to access your academy dashboard',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        TextField(
          controller: controller.academyIdController,
          decoration: InputDecoration(
            labelText: 'Academy ID',
            hintText: 'Enter your academy ID',
            prefixIcon: Icon(Icons.business),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controller.emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16),
        TextField(
          controller: controller.passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                // TODO: Implement password visibility toggle
              },
            ),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Obx(() => ElevatedButton(
      onPressed: controller.isLoading.value ? null : controller.login,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: controller.isLoading.value
          ? SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
          : Text(
        'Login',
        style: TextStyle(fontSize: 16),
      ),
    ));
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      children: [
        Obx(() => Checkbox(
          value: controller.rememberMe.value,
          onChanged: (value) => controller.rememberMe.value = value!,
        )),
        Text('Remember me'),
        Spacer(),
        TextButton(
          onPressed: () => Get.toNamed('/forgot-password'),
          child: Text('Forgot Password?'),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Need Help?',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildHelpSection() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.contact_support),
          title: Text('Contact Support'),
          onTap: () => Get.toNamed('/support'),
        ),
        ListTile(
          leading: Icon(Icons.school),
          title: Text('Register New Academy'),
          onTap: () => Get.toNamed('/academy-registration'),
        ),
      ],
    );
  }
}