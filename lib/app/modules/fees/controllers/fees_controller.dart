// lib/app/modules/fees/controllers/fees_controller.dart
import 'package:get/get.dart';
import '../../../data/models/fee_transaction_model.dart';
import 'package:intl/intl.dart';

class FeesController extends GetxController {
  final transactions = <FeeTransaction>[
    FeeTransaction(
      id: '1',
      studentName: 'Alice Smith',
      amount: 1200,
      date: DateTime(2024, 5, 5),
      status: 'Paid',
    ),
    FeeTransaction(
      id: '2',
      studentName: 'Bob Johnson',
      amount: 1200,
      date: DateTime(2024, 5, 10),
      status: 'Pending',
    ),
    FeeTransaction(
      id: '3',
      studentName: 'Charlie Lee',
      amount: 1200,
      date: DateTime(2024, 4, 7),
      status: 'Paid',
    ),
    // ...more transactions
  ].obs;

  Map<String, List<FeeTransaction>> get groupedByMonth {
    final map = <String, List<FeeTransaction>>{};
    for (var tx in transactions) {
      map.putIfAbsent(tx.monthKey, () => []).add(tx);
    }
    // Sort by month descending
    final sortedKeys = map.keys.toList()..sort((a, b) => b.compareTo(a));
    return {for (var k in sortedKeys) k: map[k]!};
  }

  String monthLabel(String monthKey) {
    final parts = monthKey.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    return DateFormat.yMMMM().format(DateTime(year, month));
  }

  void addTransaction(FeeTransaction tx) {
    transactions.add(tx);
  }
}