import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double price;
  final double chartColor;

  ChartBar(this.price, this.chartColor, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("\$${price.toStringAsFixed(0)}"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 53, 52, 52),
                ),
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              heightFactor: chartColor,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color.fromARGB(255, 53, 52, 52),
                    ),
                    color: Colors.blue),
              ),
            ) // Віджет встановлює відносну величину у відсотках 0- 0% , 1 - 100%
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(title),
      ],
    );
  }
}
