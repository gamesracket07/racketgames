// lib/app/data/models/fee_transaction_model.dart
class FeeTransaction {
  final String id;
  final String studentName;
  final double amount;
  final DateTime date;
  final String status; // e.g. 'Paid', 'Pending', 'Overdue'

  FeeTransaction({
    required this.id,
    required this.studentName,
    required this.amount,
    required this.date,
    required this.status,
  });

  String get monthKey => "${date.year}-${date.month.toString().padLeft(2, '0')}";
}