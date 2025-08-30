import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/iPhone_top.dart';
import 'package:intl/intl.dart';

// 분리한 컴포넌트들
import '../component/bp_app_bar_widget.dart';
import '../component/bp_log_sheet_widget.dart';
import '../component/bp_segmented_switch.dart';
import '../component/date_center_with_calendar_widget.dart';
import '../component/guidance_panel_widget.dart';
import '../component/graph_section_widget.dart';
import '../component/pressure_monitoring_widget.dart';
import '../component/summary_row_widget.dart';

class BloodPressureInfo extends StatefulWidget {
  const BloodPressureInfo({super.key});

  @override
  State<BloodPressureInfo> createState() => _BloodPressureInfoState();
}

class _BloodPressureInfoState extends State<BloodPressureInfo> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IphoneTop(),

          // 상단 앱바(뒤로, 제목, 목록)
          BpAppBar(
            onBack: () => context.go('/'),
            onOpenList: () => showBpLogSheet(context),
          ),

          // 본문
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // 날짜(중앙 정렬) + 달력 버튼
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: DateCenterWithCalendar(
                      dateText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      initialDate: DateTime.now(),
                      onDatePicked: (d) {
                        // TODO: 선택 날짜 반영 setState(...)
                        DateTime.now();
                      },
                    ),
                  ),

                  // 상단 요약(고혈압 단계 / 맥박)
                  const SummaryRow(),

                  // 수축/이완 카드
                  const PressureRow(),

                  // 그래프 섹션
                  const GraphSection(),

                  // 구간 선택(최근/월/년) 자리
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 60,
                    color: Colors.white,
                    child: BpSegmentedSwitch(
                      initialIndex: 0, // 0: 최근, 1: 월, 2: 년
                      onChanged: (i) {
                        // TODO: i 값에 따라 목록 갱신
                      },
                    ),
                  ),

                  // 가이드 패널
                  const GuidancePanel(),
                ],
              ),
            ),
          ),

          Container(color: Colors.white,child: const BottomBar(location: 'chart',)),
          Container(color: Colors.white, height: 24),
        ],
      ),
    );
  }
}
