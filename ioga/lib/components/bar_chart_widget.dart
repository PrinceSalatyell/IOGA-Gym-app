import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 22;

  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 200,
        minY: 0,
        groupsSpace: 12,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          topTitles: BarTitles.getTopBottomTitles(),
          bottomTitles: BarTitles.getTopBottomTitles(),
          leftTitles: BarTitles.getSideTitles(),
          rightTitles: BarTitles.getSideTitles(),
        ),
        gridData: FlGridData(
          checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
          getDrawingHorizontalLine: (value) {
            if (value == 0) {
              return FlLine(
                color: Color(0xff141431),
                strokeWidth: 3
              );
            }
            return FlLine(
              color: Color(0xff2a2747),
              strokeWidth: 1
            );
          },
        ),
        barGroups: BarData.barData.map(
            (data) => BarChartGroupData(
              x: data.id,
              barRods: [
                BarChartRodData(
                  y: data.y,
                  width: barWidth,
                  colors: [data.color],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6)
                  )
                )
              ]
            ),
        ).toList(),

      )
    );
  }
}

class Data {
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({required this.id, required this.name, required this.y, required this.color});
}

class BarData {
  static int interval = 25;

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Seg',
      y: 150,
      color: Color(0xFF4A1C7B),
    ),
    Data(
      name: 'Ter',
      id: 1,
      y: 120,
      color: Color(0xFF5D2B95),
    ),
    Data(
      name: 'Qua',
      id: 2,
      y: 140,
      color: Color(0xFF512386),
    ),
    Data(
      name: 'Qui',
      id: 3,
      y: 160,
      color: Color(0xFF4A1C7B),
    ),
    Data(
      name: 'Sex',
      id: 4,
      y: 190,
      color: Color(0xFF390E66),
    ),
    Data(
      name: 'Sáb',
      id: 5,
      y: 200,
      color: Color(0xFF2C0750),
    ),
    Data(
      name: 'Dom',
      id: 6,
      y: 60,
      color: Color(0xFF996FC7),
    ),
  ];
}

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
    showTitles: true,
    getTextStyles: (context, value) => kCaptionTextStyle,
    margin: 10,
    getTitles: (double id) => BarData.barData.firstWhere((element) => element.id == id.toInt()).name,

  );

  static SideTitles getSideTitles() => SideTitles(
    showTitles: true,
    getTextStyles: (context, value) => kCaptionTextStyle,
    interval: BarData.interval.toDouble(),
    rotateAngle: 45,
    reservedSize: 50,
    getTitles: (double value) => value == 20.toDouble() ? '${value.toInt()}+' : '${value.toInt()}',
  );

}