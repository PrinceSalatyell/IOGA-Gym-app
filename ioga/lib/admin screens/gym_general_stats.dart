import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/new_clients_trend.dart';
import 'package:ioga/components/pie_chart_widget.dart';
import 'package:ioga/constants.dart';

class GeneralStats extends StatelessWidget {
  const GeneralStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {

          var clientNumber = Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    height: 110,
                    width: 170,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.red[500],
                      child: GridTile(
                        child: Center(
                          child: Text(
                            '486',
                            style: kTitleTextStyle.copyWith(color: Color(0xff6d0e0e), fontSize: 40),
                          ),
                        ),
                        header: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                          child: Text(
                            'Nº de clientes:',
                            style: kCaptionTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ),
                );

          var newClientTrends = Positioned(
                  top: 300,
                  right: 0,
                  child: Container(
                    height: 200,
                    width: 390,
                    child: Card(
                      color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff6d0e0e) : Color(
                          0xfffd3e3e),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text(
                              'Novos Clientes (últ. 5 meses)',
                              style: kTitleTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: NewClientsTrend(),
                          )
                        ],
                      ),
                    ),
                  ),
                );

          var genderPercentage = Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        child: GridTile(
                          child: Text(
                            '38%',
                            style: kTitleTextStyle.copyWith(color: ThemeProvider.of(context)!.brightness == Brightness.light ? Color(0xff6d0e0e) : Color(
                                0xfffd3e3e), fontSize: 40),
                          ),
                          footer: Text(
                            'Mulheres',
                            style: kTitleTextStyle,
                          ),
                        ),
                      ),
                      VerticalDivider(width: 80, color: Colors.red, thickness: 20, indent: 50, endIndent: 10,),
                      Container(
                        width: 110,
                        height: 110,
                        child: GridTile(
                          child: Text(
                            '62%',
                            style: kTitleTextStyle.copyWith(color: ThemeProvider.of(context)!.brightness == Brightness.light ? Color(0xff6d0e0e) : Color(
                                0xfffd3e3e), fontSize: 40),
                          ),
                          footer: Text(
                            'Homens',
                            style: kTitleTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Estatísticas Gerais'),
              backgroundColor: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff6d0e0e) : Color(
                  0xfffd3e3e),
            ),
            body: Stack(
              children: [
                clientNumber,
                Positioned(
                  left: 60,
                  top: 100,
                  child: AppUsersPieChart(),
                ),
                Positioned(
                  left: 10,
                  top: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: IndicatorsWidget(),
                      )
                    ],
                  ),
                ),
                newClientTrends,
                genderPercentage
              ],
            ),
          );
        },
      ),
    );
  }
}
