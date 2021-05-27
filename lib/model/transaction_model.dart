import 'package:flutter/foundation.dart';

class TransactionModel {
  final String remark;
  final double amount;
  final DateTime date;
  final String id;

  TransactionModel({
    @required this.remark,
    this.amount,
    @required this.date,
    @required this.id,
  });
}
