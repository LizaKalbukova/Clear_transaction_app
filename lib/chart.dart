import 'package:flutter/material.dart';
import 'properties.dart';
import 'package:intl/intl.dart';
import 'chartBar.dart';

class ChartW extends StatelessWidget {
  final List<MyTransactions> mainTransactions;
  ChartW(this.mainTransactions);

  List<Map<String, Object>> get allMyCharts {
    // get динамічно будує

    return List.generate(7, (index) {
      // List.generate(length, (index) => null). generate конструктор це утиліта класу List яка приймає значення
      // відлік іде так Сьогодні index = 0 , Вчора index = 1 і так до кінця тижня
      final weekDay = DateTime.now().subtract(Duration(
          days: index)); //subtract метод віднімає від поточної дати інндекс
      var totalSum = 0.0;
// створюємо луп щоб виявити скільки транзакція було зроблено за конкретний день
      for (var i = 0;
          i < mainTransactions.length;
          i++) // почаок  і =0, міняємо індекс і на 1 + поки не дойдемо до кінця списка і тоді кінець
        if (mainTransactions[i].date.day == weekDay.day &&
            mainTransactions[i].date.month == weekDay.month &&
            mainTransactions[i].date.year ==
                weekDay
                    .year) //перевіряємо чи сьогоднішній день відповідає тому дню, місяцю, року
        {
          totalSum += mainTransactions[i].amount; // додаємо  +=

        }
      return {
        "Day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      }; // повертаємо Map
    }).reversed.toList(); // reversed задає список в обернутому порядку
  }

  double get totalWeekSpending {
    return allMyCharts.fold(0.0, (sum, element) {
      //повертаємо нову sum яку потім будемо вставляти заново в імпут для наступного ел в списку
      return sum + (element["amount"] as double);
    }); // fold() допомагає змінити нам list на інший тип. 0.0 - starting value. sum - curent value we calculating,
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
            children: allMyCharts.map((data) {
          return Expanded(
            child: ChartBar(
              (data['amount'] as double),
              totalWeekSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalWeekSpending,
              (data['Day'] as String),
            ),
          );
        }).toList()),
      ),
    );
  }
}
