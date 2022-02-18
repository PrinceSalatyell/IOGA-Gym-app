import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ioga/constants.dart';

class LineChartWidget extends StatelessWidget {

  final List<Color> gradientColors = [
    const Color(0xffcea121),
    const Color(0x80ffffff),

  ];

  LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 16,
        minY: 0,
        maxY: 70,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff45596c),
              strokeWidth: 1
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
                color: const Color(0xff45596c),
                strokeWidth: 1
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff45596c), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 20),
              FlSpot(1, 25),
              FlSpot(2, 19),
              FlSpot(3, 28),
              FlSpot(4, 15),
              FlSpot(5, 8),
              FlSpot(6, 5),
              FlSpot(7, 14),
              FlSpot(8, 28),
              FlSpot(9, 40),
              FlSpot(10, 48),
              FlSpot(11, 60),
              FlSpot(12, 57),
              FlSpot(13, 60),
              FlSpot(14, 55),
              FlSpot(15, 23),
              FlSpot(16, 15),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            )
          )
        ]
      )
    );
  }
}

class LineTitles {
  static getTitleData() {
    return FlTitlesData(
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        //getTextStyles: (context, value) => kTitleTextStyle,
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '7:00';
            // case 1:
            //   return '8:00';
            // case 2:
            //   return '9:00';
            // case 3:
            //   return '10:00';
            case 4:
              return '11:00';
            // case 5:
            //   return '12:00';
            // case 6:
            //   return '13:00';
            // case 7:
            //   return '14:00';
            case 8:
              return '15:00';
            // case 9:
            //   return '16:00';
            // case 10:
            //   return '17:00';
            // case 11:
            //   return '18:00';
            case 12:
              return '19:00';
            // case 13:
            //   return '20:00';
            // case 14:
            //   return '21:00';
            // case 15:
            //   return '22:00';
            case 16:
              return '23:00';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        //getTextStyles: (context, value) => kTitleTextStyle,
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 10:
              return '10';
            case 20:
              return '20';
            case 30:
              return '30';
            case 40:
              return '40';
            case 50:
              return '50';
            case 60:
              return '60';
          }
          return '';
        },
        reservedSize: 18,
        margin: 10
      )
    );
  }
}
