import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.black.withOpacity(0.1),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.grey[900]!,
              width: 1.5,
            ),
          ),
          minX: 0,
          maxX: 20,
          minY: 0,
          maxY: 5000,
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 1.5,
              dotData: FlDotData(show: false),
              colors: [color],
              belowBarData: BarAreaData(
                show: true,
                colors: [color.withOpacity(0.1)],
              ),
              spots: [
                FlSpot(0, 200),
                FlSpot(1, 750),
                FlSpot(2, 1600),
                FlSpot(3, 4500),
                FlSpot(4, 2300),
                FlSpot(5, 2000),
                FlSpot(6, 2800),
                FlSpot(7, 1330),
                FlSpot(8, 3000),
                FlSpot(9, 3060),
                FlSpot(10, 2789),
                FlSpot(11, 1500),
                FlSpot(12, 2000),
                FlSpot(13, 2500),
                FlSpot(14, 2300),
                FlSpot(15, 2000),
                FlSpot(16, 2800),
                FlSpot(17, 1330),
                FlSpot(18, 3000),
                FlSpot(19, 3060),
                FlSpot(20, 2789),
              ],
            )
          ],
        ),
      ),
    );
  }
}
