import 'package:flutter/material.dart';
import 'textInputWidget.dart';
import 'transactionListW.dart';
import 'properties.dart';
import 'chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final List<MyTransactions> transctionW = [];

  void addNewTransaction(
      String txNameOfTx, double txAmount, DateTime choosenDate) {
    final newTx = MyTransactions(
      amount: txAmount,
      nameOfTransaction: txNameOfTx,
      id: DateTime.now().toString(),
      date: choosenDate,
    );

    setState(() {
      transctionW.add(newTx);
    });
  }

  void bottomFormInput() {
    // метод для того щоб  вспливала форма з нашими імпутами
    showModalBottomSheet(
        context:
            context, // те що ми передаємо в  showModalBottomSheet і будуємо форму
        builder: (BuildContext bcontext) {
          // bcontext це те куди передається context і ми повертаємо клас з нашими графічними віджетами
          return TextInputW(addNewTransaction);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChartW(transctionW),

            //  MainColumnW(),
            TransactionListW(transctionW)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomFormInput();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
