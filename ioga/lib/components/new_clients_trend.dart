import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NewClientsTrend extends StatelessWidget {

  final List<Color> gradientColors = [
    Colors.red,
  ];

  NewClientsTrend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
        LineChartData(
            minX: 0,
            maxX: 5,
            minY: 0,
            maxY: 50,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                    color: const Color(0xff2d0101),
                    strokeWidth: 1
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                    color: const Color(0xff2d0101),
                    strokeWidth: 1
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff2d0101), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    FlSpot(0, 20),
                    FlSpot(1, 10),
                    FlSpot(2, 9),
                    FlSpot(3, 13),
                    FlSpot(4, 25),
                  ],
                  isCurved: false,
                  colors: gradientColors,
                  barWidth: 5,
                  belowBarData: BarAreaData(
                    show: false,
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
                return 'Jan';
            // case 1:
            //   return '8:00';
            // case 2:
            //   return '9:00';
            // case 3:
            //   return '10:00';
              case 1:
                return 'Fev';
            // case 5:
            //   return '12:00';
            // case 6:
            //   return '13:00';
            // case 7:
            //   return '14:00';
              case 2:
                return 'Mar';
            // case 9:
            //   return '16:00';
            // case 10:
            //   return '17:00';
            // case 11:
            //   return '18:00';
              case 3:
                return 'Abr';
            // case 13:
            //   return '20:00';
            // case 14:
            //   return '21:00';
            // case 15:
            //   return '22:00';
              case 4:
                return 'Mai';
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
                case 40:
                  return '40';
              }
              return '';
            },
            reservedSize: 18,
            margin: 10
        )
    );
  }
}
