import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'textInputWidget.dart';
import 'transactionListW.dart';
import 'properties.dart';
import 'chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
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
  bool light = false;

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
    final _MediaQuery = MediaQuery.of(context);
    final isLandscape = _MediaQuery.orientation == Orientation.landscape;
    final txListWidget = Container(
        height: (_MediaQuery.size.height -
                appBarW.preferredSize.height -
                _MediaQuery.padding.top) *
            0.7,
        child: TransactionListW(transctionW, _deliteTransaction));

    return Scaffold(
      appBar: appBarW,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Switch(
                value: light,
                onChanged: (value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
            if (!isLandscape)
              Container(
                height: (_MediaQuery.size.height -
                        appBarW
                            .preferredSize.height - // вичитаємо розмір  АppBar
                        _MediaQuery.padding.top) * // вичитаємо розмір StatusBar
                    0.3, // бо буде чарт показуватися окремо на екрані
                child: ChartW(transctionW),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              light
                  ? Container(
                      height: (_MediaQuery.size.height -
                              appBarW.preferredSize
                                  .height - // вичитаємо розмір  АppBar
                              _MediaQuery
                                  .padding.top) * // вичитаємо розмір StatusBar
                          0.7, // бо буде чарт показуватися окремо на екрані
                      child: ChartW(transctionW),
                    )
                  : txListWidget
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
