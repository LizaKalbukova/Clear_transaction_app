import 'package:flutter/material.dart';
import 'transactionListW.dart';
import 'mainColumnW.dart';

class TextInputW extends StatelessWidget {
  //String textInput = ''; // зміні які зберігають значення з рядку для ввода
  //String amountInput = '';
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;
  TextInputW(this.addNewTransaction);

  void submitData() {
    // метод щоб наша кнопочка на клавіатурі підтвержувала і додавала транзакцію в лис .... ця функція створенна щоб код не повторювався
    final textSubmit = textController.text;
    final amountSubmit = double.parse(amountController.text);

    if (textSubmit.isEmpty || amountSubmit <= 0) {
      // якщо текста немає і ціна відємна, то Після Return функція  addNewTransaction не працює
      return;
    }

    addNewTransaction(textSubmit, amountSubmit);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              //onChanged:(value) { },
              onSubmitted: (_) => submitData(),

              decoration: InputDecoration(labelText: 'Name of transaction'),
              controller: textController,
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'The price'),
              controller: amountController,
            ),
            TextButton(
              onPressed: submitData,
              child: Text("Add transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
