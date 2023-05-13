import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../settings/app_theme.dart';



class QuestionsAskedStats extends StatefulWidget {
  QuestionsAskedStats({Key? key, this.groupID = ""}) : super(key: key);

  String? groupID;

  @override
  State<QuestionsAskedStats> createState() => _QuestionsAskedStats();

}

class _QuestionsAskedStats extends State<QuestionsAskedStats> {

  late String groupID;
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
    // AppTheme.mainColor,
    // AppTheme.secondColor
  ];

  List<FlSpot> flSpotsList = [];
  double calculatedAvg = 0.0;

  var values = [
    {'lecture': 1, 'questions': 12},
    {'lecture': 2, 'questions': 5},
    {'lecture': 3, 'questions': 7},
    {'lecture': 5, 'questions': 4},
    {'lecture': 6, 'questions': 6},
    {'lecture': 7, 'questions': 5},
    {'lecture': 8, 'questions': 5},
    {'lecture': 9, 'questions': 9},
    {'lecture': 10, 'questions':11},
    {'lecture': 11, 'questions': 14},
    {'lecture': 12, 'questions': 8},
    {'lecture': 13, 'questions': 5},
  ];





  @override
  void initState() {
    super.initState();
    groupID = widget.groupID ?? "";
  }


  @override
  Widget build(BuildContext context) {

    updateFLSpotsList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Questions Asked",
          style: AppTheme.appBarHeaderFontStyle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25, right: 25),
          child: Column(
            children: [
              Flexible(
                flex: 10,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                        show: true,
                        rightTitles:  AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles:  AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        )
                    ),
                    baselineX: 1,
                    maxX: 13,
                    baselineY: 0,
                    maxY: 20,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: AppTheme.mainColor,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: AppTheme.mainColor,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: const Color(0xff37434d)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: flSpotsList,
                        // spots: const [
                        //   FlSpot(1, 12),
                        //   FlSpot(2, 5),
                        //   FlSpot(3, 7),
                        //   FlSpot(4, 4),
                        //   FlSpot(5, 6),
                        //   FlSpot(6, 5),
                        //   FlSpot(7, 5),
                        //   FlSpot(8, 9),
                        //   FlSpot(9, 11),
                        //   FlSpot(10, 14),
                        //   FlSpot(11, 8),
                        //   FlSpot(12, 5),
                        //   FlSpot(13, 10),
                        // ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: gradientColors
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          ),
                        ),
                      ),
                    ],

                  ),
                  // swapAnimationDuration: Duration(milliseconds: 150), // Optional
                  // swapAnimationCurve: Curves.linear, // Optional
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Flexible(
                  flex: 1,
                    child: Text("Average: $calculatedAvg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateFLSpotsList() {
    double temp = 0.0;
    for (var value in values) {
      flSpotsList.add(FlSpot(value["lecture"]!.toDouble(), value["questions"]!.toDouble()));
      temp += value["questions"]!;
    }
    calculatedAvg = temp / 13;
  }
}