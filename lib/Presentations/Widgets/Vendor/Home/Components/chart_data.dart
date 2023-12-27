import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';
import 'package:rite_funeral_flutter/Data/Resources/text_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartData {
  final String year;

  final int revenueValue;

  BarChartData(this.year, this.revenueValue);
}

class VerticalBarChart extends StatelessWidget {
  final List<BarChartData> chartData = [
    BarChartData(
      'Mon',
      5000,
    ),
    BarChartData(
      'Tue',
      18000,
    ),
    BarChartData(
      'Wed',
      10000,
    ),
    BarChartData(
      'Thu',
      4000,
    ),
    BarChartData(
      'Fri',
      40000,
    ),
    BarChartData(
      'Sat',
      20000,
    ),
    BarChartData(
      'Sun',
      15000,
    ),
    // Add more data as needed
  ];




  VerticalBarChart({super.key});
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderWidth: 0,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          labelStyle: Styles.regular(
              fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontSize: 13.sp)),
      primaryYAxis: NumericAxis(
          isVisible: true,
          numberFormat: NumberFormat.compact(),
          // Number of ticks on Y-axis
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ColumnSeries<BarChartData, String>>[
        ColumnSeries<BarChartData, String>(
          // trackColor: Colors.transparent,
          isTrackVisible: false,
          dataSource: chartData,
          xValueMapper: (BarChartData data, _) => data.year,
          yValueMapper: (BarChartData data, _) => data.revenueValue,
          name: '',
          color: AppColors.primary,
          width: 0.4,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.sp),
              topRight:
                  Radius.circular(10.sp)), // Dark blue color for completed
// Light blue color for pending
        ),
      ],
    );
  }
}
