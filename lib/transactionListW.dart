import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionListW extends StatelessWidget {
  final List transctionNewW;
  TransactionListW(this.transctionNewW);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          //запускає build для кожної нової транзакції
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "\$ ${transctionNewW[index].amount.toStringAsFixed(2)}"),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black38)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transctionNewW[index].nameOfTransaction),
                    Text(DateFormat('dd/MM/yyyy')
                        .format(transctionNewW[index].date))
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transctionNewW
            .length, //визначає скільки елементів має бути побудовано, в нашому випадку це буде lenght наших транзакцій
      ),
    );
  }
}
