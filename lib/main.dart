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

  void _deliteTransaction(String id) {
    setState(() {
      transctionW.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  Widget build(BuildContext context) {
    final appBarW = AppBar(title: Text(" No Money"));

    return Scaffold(
      appBar: appBarW,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBarW.preferredSize.height - // вичитаємо розмір  АppBar
                      MediaQuery.of(context)
                          .padding
                          .top) * // вичитаємо розмір StatusBar
                  0.3,
              child: ChartW(transctionW),
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBarW.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionListW(transctionW, _deliteTransaction))
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
