// lib/screen/bp/date_widgets.dart
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

final List<_SalesData> data = [
  _SalesData('Jan', 35),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40),
];

class Calendar extends StatelessWidget {

  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: Colors.white, // 배경색
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // AppBar 대신 간단한 타이틀 영역
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Syncfusion Flutter chart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 12),

              // Cartesian 차트
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Half yearly sales analysis'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (s, _) => s.year,
                    yValueMapper: (s, _) => s.sales,
                    name: 'Sales',
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),

              // SparkLine 차트
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SfSparkLineChart.custom(
                    trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap,
                    ),
                    marker: const SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all,
                    ),
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    xValueMapper: (int index) => data[index].year,
                    yValueMapper: (int index) => data[index].sales,
                    dataCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

