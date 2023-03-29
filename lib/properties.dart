import 'package:flutter/material.dart';

class MyTransactions {
  String id;
  String nameOfTransaction;
  double amount;
  DateTime date;

  MyTransactions(
      {required this.id,
      required this.nameOfTransaction,
      required this.amount,
      required this.date});
}
