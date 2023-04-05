import 'package:flutter/material.dart';
import 'transactionListW.dart';
import 'package:intl/intl.dart';

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
  DateTime? _selectedDate;

  void submitData() {
    // метод щоб наша кнопочка на клавіатурі підтвержувала і додавала транзакцію в лис .... ця функція створенна щоб код не повторювався
    final textSubmit = textController.text;
    final amountSubmit = double.parse(amountController.text);

    if (textSubmit.isEmpty || amountSubmit <= 0 || _selectedDate == null) {
      // якщо текста немає і ціна відємна і якщо не встановлена дата, то Після Return функція  addNewTransaction не працює
      return;
    }

    widget.addNewTransaction(textSubmit, amountSubmit,
        _selectedDate); // автоматично створено  widget. післа перетворення класу на StatefulWidget  для того щоб ми змогли передавати наші properties з приватного класа

    Navigator.of(context).pop(); // Закриває нашу форму
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2003),
      lastDate: DateTime.now(),
    ).then((pickerdate) {
      if (pickerdate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickerdate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 30,
              left: 10,
              right: 10,
              top: 10),
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
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Choosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!).toString()}'),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: Text("Choose Date"))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Add transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
