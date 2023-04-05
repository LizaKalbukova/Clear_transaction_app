import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double price;
  final double chartColor;

  ChartBar(this.price, this.chartColor, this.title);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text("\$${price.toStringAsFixed(0)}"))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
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
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                  ),
                ) // Віджет встановлює відносну величину у відсотках 0- 0% , 1 - 100%
              ]),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(height: constraints.maxHeight * 0.15, child: Text(title)),
          ],
        );
      },
    );
  }
}
