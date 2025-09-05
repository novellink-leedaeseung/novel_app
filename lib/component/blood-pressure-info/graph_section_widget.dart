// lib/screen/bp/graph_section.dart
import 'package:flutter/material.dart';
import 'package:novel/primary-color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
late TooltipBehavior _tooltipBehavior;
class GraphSection extends StatelessWidget {
  const GraphSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      // 최근 1주일 값
      ChartData('월', 160, 128, 70),
      ChartData('화', 140, 100, 74),
      ChartData('수', 150, 120, 90),
      ChartData('목', 145, 130, 81),
      ChartData('금', 158, 128, 84),
      ChartData('토', 140, 150, 90),
      ChartData('일', 130, 120, 60),
    ];
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 240,
      color: Colors.white,
      // 배경색
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              tooltipBehavior: TooltipBehavior(
                enable: true,
                canShowMarker: false,
                  format: '이완기 혈압 point.y \n수축기 혈압 point.relaxation',
                // header: "혈압"
              ),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                // todo 80, 120 숫자 변경
                axisLabelFormatter: (AxisLabelRenderDetails args) {
                  if (args.value == 80 || args.value == 120) {
                    return ChartAxisLabel(
                      args.text,
                      const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    );
                  }
                  return ChartAxisLabel(args.text, const TextStyle(color: Colors.black));
                },
                // todo 혈압 그래프
                minimum: 60,
                maximum: 200,
                interval: 10,
                plotBands: <PlotBand>[
                  // 수축기 120 기준선 (빨간 점선)
                  PlotBand(
                    start: 120, end: 120,           // start=end 로 ‘선’처럼 사용
                    isVisible: true,
                    borderWidth: 1,
                    borderColor: Colors.red,
                    color: Colors.transparent,      // 배경은 투명
                  ),
                  // 정상범위(90~119) 배경 하이라이트
                  PlotBand(
                    start: 80, end: 80,
                    borderWidth: 1,
                    borderColor: Colors.red,
                    isVisible: true,
                  ),
                ],
              ),
              enableSideBySideSeriesPlacement: true,
              series: <CartesianSeries>[
                RangeColumnSeries<ChartData, String>(
                  name: "혈압",
                  width: 0.1,
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  lowValueMapper: (ChartData data, _) => data.relaxation,
                  highValueMapper: (ChartData data, _) => data.y,
                ),
                // 맥박
                SplineSeries<ChartData, String>(
                  name: "맥박",
                  opacity: 1,
                  width: 0.4,
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x, // 요일 매칭
                  yValueMapper: (ChartData data, _) => data.bpm,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.relaxation, this.bpm);

  // 요일
  final String x;
  // 수축기 혈압, 이완기 혈압
  final double y;
  final double relaxation;
  // 맥박
  final double bpm;
}
