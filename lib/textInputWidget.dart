import 'package:flutter/material.dart';
import 'transactionListW.dart';

class TextInputW extends StatefulWidget {
  final Function addNewTransaction;
  TextInputW(this.addNewTransaction);

  @override
  State<TextInputW> createState() => _TextInputWState();
}

class _TextInputWState extends State<TextInputW> {
  //String textInput = ''; // зміні які зберігають значення з рядку для ввода
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    // метод щоб наша кнопочка на клавіатурі підтвержувала і додавала транзакцію в лис .... ця функція створенна щоб код не повторювався
    final textSubmit = textController.text;
    final amountSubmit = double.parse(amountController.text);

    if (textSubmit.isEmpty || amountSubmit <= 0) {
      // якщо текста немає і ціна відємна, то Після Return функція  addNewTransaction не працює
      return;
    }

    widget.addNewTransaction(textSubmit,
        amountSubmit); // автоматично створено  widget. післа перетворення класу на StatefulWidget  для того щоб ми змогли передавати наші properties з приватного класа

    Navigator.of(context).pop(); // Закриває нашу форму
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
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
