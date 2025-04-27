// lib/app/modules/fees/views/fees_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/fee_transaction_model.dart';
import '../controllers/fees_controller.dart';
import 'package:intl/intl.dart';

class FeesPage extends GetView<FeesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fees Collection'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransactionDialog(context),
            tooltip: 'Add Transaction',
          ),
        ],
      ),
      body: Obx(() {
        final grouped = controller.groupedByMonth;
        if (grouped.isEmpty) {
          return Center(child: Text('No transactions found.'));
        }
        return ListView(
          children: grouped.entries.map((entry) {
            final monthKey = entry.key;
            final txs = entry.value;
            return _buildMonthSection(monthKey, txs);
          }).toList(),
        );
      }),
    );
  }

  Widget _buildMonthSection(String monthKey, List<FeeTransaction> txs) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue.shade50,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              controller.monthLabel(monthKey),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          ...txs.map(_buildTransactionTile).toList(),
        ],
      ),
    );
  }

  Widget _buildTransactionTile(FeeTransaction tx) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(tx.studentName[0]),
      ),
      title: Text(tx.studentName),
      subtitle: Text(DateFormat('dd MMM yyyy').format(tx.date)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '₹${tx.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            tx.status,
            style: TextStyle(
              color: tx.status == 'Paid'
                  ? Colors.green
                  : tx.status == 'Pending'
                  ? Colors.orange
                  : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTransactionDialog(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final status = 'Paid'.obs;
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Fee Transaction'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    selectedDate = picked;
                    (context as Element).markNeedsBuild();
                  }
                },
              ),
              Obx(() => DropdownButtonFormField<String>(
                value: status.value,
                items: ['Paid', 'Pending', 'Overdue']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => status.value = val!,
                decoration: InputDecoration(labelText: 'Status'),
              )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty ||
                  amountController.text.trim().isEmpty) {
                Get.snackbar('Error', 'All fields are required',
                    backgroundColor: Colors.red, colorText: Colors.white);
                return;
              }
              controller.addTransaction(FeeTransaction(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                studentName: nameController.text.trim(),
                amount: double.tryParse(amountController.text.trim()) ?? 0,
                date: selectedDate,
                status: status.value,
              ));
              Get.back();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}