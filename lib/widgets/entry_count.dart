import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/model/transaction_model.dart';

class EntryCount extends StatelessWidget {
  final List<TransactionModel> transactions;
  EntryCount(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.indigo.shade100,
      child: Center(
        child: Text(
          'Showing ${transactions.length} entries',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
