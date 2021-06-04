import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.monetization_on),
                Container(
                  width: 50,
                  height: 20,
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 3,
                      minY: 1000,
                      maxY: 5000,
                      gridData: FlGridData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0, 1000),
                            FlSpot(1, 2000),
                            FlSpot(2, 5000),
                            FlSpot(3, 4000),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Text("Hi")
              ],
            ),
          );
        },
      ),
    );
  }
}
