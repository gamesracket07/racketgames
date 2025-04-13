// lib/app/data/models/academy_user_model.dart
enum AcademyRole {
  admin,
  coach,
  student,
  parent
}

class AcademyUser {
  final String id;
  final String name;
  final String email;
  final String phone;
  final AcademyRole role;
  final String academyId;
  final String? photoUrl;
  final bool isActive;
  final DateTime joinDate;
  final Map<String, dynamic> permissions;

  AcademyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.academyId,
    this.photoUrl,
    this.isActive = true,
    required this.joinDate,
    required this.permissions,
  });

  factory AcademyUser.fromJson(Map<String, dynamic> json) => AcademyUser(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    role: AcademyRole.values.firstWhere(
            (e) => e.toString() == 'AcademyRole.${json['role']}'),
    academyId: json['academyId'],
    photoUrl: json['photoUrl'],
    isActive: json['isActive'] ?? true,
    joinDate: DateTime.parse(json['joinDate']),
    permissions: json['permissions'] ?? {},
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'role': role.toString().split('.').last,
    'academyId': academyId,
    'photoUrl': photoUrl,
    'isActive': isActive,
    'joinDate': joinDate.toIso8601String(),
    'permissions': permissions,
  };
}