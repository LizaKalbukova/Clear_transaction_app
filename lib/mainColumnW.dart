import 'package:flutter/material.dart';
import 'textInputWidget.dart';
import 'transactionListW.dart';
import 'properties.dart';

class MainColumnW extends StatefulWidget {
  @override
  State<MainColumnW> createState() => _MainColumnWState();
}

class _MainColumnWState extends State<MainColumnW> {
  final List<MyTransactions> transctionW = [
    MyTransactions(
        amount: 12.99,
        nameOfTransaction: "Banana",
        id: "1m",
        date: DateTime.now()),
    MyTransactions(
        amount: 12.99,
        nameOfTransaction: "Cola",
        id: "2m",
        date: DateTime.now())
  ];

  void addNewTransaction(String txNameOfTx, double txAmount) {
    final newTx = MyTransactions(
      amount: txAmount,
      nameOfTransaction: txNameOfTx,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      transctionW.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextInputW(addNewTransaction), TransactionListW(transctionW)],
    );
  }
}
