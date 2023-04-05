import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListW extends StatelessWidget {
  final List transctionNewW;

  final Function deleteTx;
  TransactionListW(this.transctionNewW, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transctionNewW
            .isEmpty // якщо transctionNewW.isEmpty то буде картинка,  а коли транзвкції додаються, то вона зникає

        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.4,
                  child: Image.asset(
                    'images/sleeping.png',
                    color: Color.fromARGB(204, 96, 125, 139),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
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
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transctionNewW[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"))
                        : IconButton(
                            onPressed: () => deleteTx(transctionNewW[index].id),
                            icon: Icon(Icons.delete),
                          )),
              );
            },
            itemCount: transctionNewW
                .length, //визначає скільки елементів має бути побудовано, в нашому випадку це буде lenght наших транзакцій
          );
  }
}
