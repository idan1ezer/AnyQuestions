import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";

import '../../../settings/app_theme.dart';

class TimeConsumedStats extends StatefulWidget {
  TimeConsumedStats({Key? key, this.groupID = ""}) : super(key: key);

  String? groupID;

  @override
  State<TimeConsumedStats> createState() => _TimeConsumedStats();
}

class _TimeConsumedStats extends State<TimeConsumedStats> {
  late String groupID;

  List<BarChartGroupData> barGroups = [];

  var values = [
    {'lecture': 1, 'efficiency': 80},
    {'lecture': 2, 'efficiency': 85},
    {'lecture': 3, 'efficiency': 90},
    {'lecture': 4, 'efficiency': 70},
    {'lecture': 5, 'efficiency': 91},
    {'lecture': 6, 'efficiency': 89},
    {'lecture': 7, 'efficiency': 77},
    {'lecture': 8, 'efficiency': 55},
    {'lecture': 9, 'efficiency': 85},
    {'lecture': 10, 'efficiency':90},
    {'lecture': 11, 'efficiency': 92},
    {'lecture': 12, 'efficiency': 80},
    {'lecture': 13, 'efficiency': 55},
  ];


  @override
  void initState() {
    super.initState();
    groupID = widget.groupID ?? "";
  }

  @override
  Widget build(BuildContext context) {
    initBarGroups();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Time Consumed",
          style: AppTheme.appBarHeaderFontStyle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 25, right: 20, left: 20),
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: barGroups,
              gridData: FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              minY: 0,
            ),
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: AppTheme.mainColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Color(0xFF0F3460),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;
      case 5:
        text = '5';
        break;
      case 6:
        text = '6';
        break;
      case 7:
        text = '7';
        break;
      case 8:
        text = '8';
        break;
      case 9:
        text = '9';
        break;
      case 10:
        text = '10';
        break;
      case 11:
        text = '11';
        break;
      case 12:
        text = '12';
        break;
      case 13:
        text = '13';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Color(0xFF0F3460),
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  void initBarGroups() {
    int index = 1;

    for (var value in values) {
      barGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: value["efficiency"]?.toDouble() ?? 2.0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      );
      index ++;
    }
  }
}
