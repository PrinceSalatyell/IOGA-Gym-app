import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';

class AppUsersPieChart extends StatefulWidget {
  const AppUsersPieChart({Key? key}) : super(key: key);

  @override
  _AppUsersPieChartState createState() => _AppUsersPieChartState();
}

class _AppUsersPieChartState extends State<AppUsersPieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false,),
          sectionsSpace: 0,
          centerSpaceRadius: 30,
          sections: getSections()
        )
      ),
    );
  }
}

List<PieChartSectionData> getSections() => PieData.data.asMap().map<int, PieChartSectionData>((index, data) {
  final value = PieChartSectionData(
    color: data.color,
    value: data.percent,
    title: '${data.percent}%',
    titleStyle: kCaptionTextStyle
  );

  return MapEntry(index, value);
}).values.toList();

class PieData {
  static List<Data> data = [
    Data(name: 'Clientes Registados na App', percent: 30, color: Colors.red),
    Data(name: 'Clientes Não Registados na App', percent: 70, color: Colors.black54)
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({required this.name, required this.percent, required this.color});
}

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
        PieData.data.map((data) => Container(padding: EdgeInsets.symmetric(vertical: 2),
        child: buildIndicator(color: data.color, text: data.name),)).toList()
      ,
    );
  }

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) => Row(
    children: [
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          color: color,
        ),
      ),
      SizedBox(width: 8),
      Text(
        text,
        style: kCaptionTextStyle,
      )
    ],
  );
}

