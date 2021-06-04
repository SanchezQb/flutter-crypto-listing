import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 10,
        minY: 1000,
        maxY: 5000,
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 1,
            dotData: FlDotData(show: false),
            colors: [color],
            spots: [
              FlSpot(
                0,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                1,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                2,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                3,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                4,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                5,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                6,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                7,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                8,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                9,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
              FlSpot(
                10,
                Random().nextInt(5000 - 1000).toDouble(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
