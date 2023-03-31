import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionListW extends StatelessWidget {
  final List transctionNewW;
  TransactionListW(this.transctionNewW);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transctionNewW
              .isEmpty // якщо transctionNewW.isEmpty то буде картинка,  а коли транзвкції додаються, то вона зникає

          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'images/sleeping.png',
                  color: Color.fromARGB(204, 96, 125, 139),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                //запускає build для кожної нової транзакції
                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            "\$ ${transctionNewW[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transctionNewW[index].nameOfTransaction),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy')
                          .format(transctionNewW[index].date),
                    ),
                  ),
                );
              },
              itemCount: transctionNewW
                  .length, //визначає скільки елементів має бути побудовано, в нашому випадку це буде lenght наших транзакцій
            ),
    );
  }
}
