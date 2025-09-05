import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/common/bottom-bar.dart';
import 'package:novel/iPhone_top.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:novel/screen/bp_input_screen.dart'; // showBpInputModal 사용 시 필요

// 분리한 컴포넌트들
import '../component/bp-history/bp_app_bar_widget.dart';
import '../component/bp-history/bp_segmented_switch.dart';
import '../component/bp-history/bp_log_sheet_widget.dart';
import '../component/bp-input/date_center_with_calendar_widget.dart';
import '../component/blood-pressure-info/guidance_panel_widget.dart';
import '../component/blood-pressure-info/graph_section_widget.dart';
import '../component/blood-pressure-info/pressure_monitoring_widget.dart';
import '../component/blood-pressure-info/summary_row_widget.dart';

// todo 날짜에 이벤트 추가 나중엔 API 고려
final List<NeatCleanCalendarEvent> _eventList = [
  NeatCleanCalendarEvent(
    '고혈압 1기',
    description: '148 / 128 mmHg 70 bpm',
    startTime: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
      00,
      0,
    ),
    endTime: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
      00,
      0,
    ),
    color: Colors.orange,
    isMultiDay: false,
    metadata: {"type": "edit"},
  ),
  NeatCleanCalendarEvent(
    '고혈압 1기',
    description: '148 / 128 mmHg 70 bpm',
    startTime: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 3,
      10,
      0,
    ),
    endTime: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 3,
      10,
      0,
    ),
    color: Colors.orange,
    isMultiDay: false,
  ),
];

class CalendarIconButton extends StatelessWidget {
  const CalendarIconButton({
    super.key,
    this.onPressed,
    this.initialDate,
    this.onDatePicked,
    this.color = const Color(0xFF0B1E38),
    this.size = 24,
  });

  final VoidCallback? onPressed;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDatePicked;
  final Color color;
  final double size;

  void _openCalendarDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      isDismissible: false, // 창 닫힘 방지
      enableDrag: false,    // 드래그 닫힘 방지
      builder: (ctx) {
        return CalendarBottomSheet(
          initialDate: initialDate,
          onPicked: (d) => onDatePicked?.call(d), // 선택만 전달, 닫지 않음
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => _openCalendarDialog(context),
      child: SizedBox(
        child: Center(
          child: SvgPicture.asset("assets/icon/calendar.svg"),
        ),
      ),
    );
  }
}

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({required this.onPicked, this.initialDate, super.key});

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPicked;

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late ValueChanged<DateTime>? onTodayButtonPressed;
  late DateTime _selectedDate;

  static const _headerHeight = 56.0;
  static const _dividerHeight = 1.0;

  @override
  void initState() {
    super.initState();
    final init = widget.initialDate ?? DateTime.now();
    _selectedDate = DateTime(init.year, init.month, init.day);
  }

  void _selectDate(DateTime d) {
    final onlyDate = DateTime(d.year, d.month, d.day);
    setState(() => _selectedDate = onlyDate);
    widget.onPicked(onlyDate); // 외부에 알림 (창은 닫지 않음)
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // 뒤로가기 닫힘 방지
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.92,
        minChildSize: 0.92,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, -6),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final sheetHeight = constraints.maxHeight;
                final calendarHeight = sheetHeight - _headerHeight - _dividerHeight;

                return ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    // 헤더 (스타일 유지)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // X 버튼 동작 막음 (닫히지 않게)
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              'assets/images/close.svg',
                              width: 24,
                              height: 24,
                              errorBuilder: (_, __, ___) => const Icon(Icons.close, size: 24),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              final now = DateTime.now();
                              _selectDate(DateTime(now.year, now.month, now.day)); // 오늘 선택
                            },
                            style: TextButton.styleFrom(foregroundColor: Colors.blue),
                            child: const Text(
                              '오늘',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF227EFF),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                height: 0.06,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: _dividerHeight),

                    SizedBox(
                      height: calendarHeight,
                      child: Calendar(
                        onTodayButtonPressed: (date) {
                          // 오늘 날짜로 이동
                          print(date);
                        },
                        onRangeSelected: (date) {
                          print(date);
                        },

                        todayButtonText: "오늘",
                        showEventListViewIcon: false,
                        allDayEventText: 'test',
                        weekDays: const ['일', '월', '화', '수', '목', '금', '토'],
                        eventListBuilder: (
                          BuildContext context,
                          List<NeatCleanCalendarEvent> selectedEvents,
                        ) {
                          return Column(
                            children: [
                              Container(
                                width: 375.w,
                                height: 24.h,
                                color: const Color(0xff227EFF),
                                child: SizedBox(
                                  width: 311.w,
                                  height: 22.h,
                                  child: Text(
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    "${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: (selectedEvents.isNotEmpty)
                                    ? Container(
                                        width: 375,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(999),
                                                color: const Color(0xffe5621c),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        height: 20,
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 4, bottom: 4.5),
                                                              child: SizedBox(
                                                                width: 54,
                                                                height: 20,
                                                                child: const Text(
                                                                  '고혈압1기',
                                                                  style: TextStyle(
                                                                    color: Color(0xFFE5621C),
                                                                    fontSize: 14,
                                                                    fontFamily: 'Pretendard',
                                                                    height: 0.12,
                                                                    letterSpacing: -0.35,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 97,
                                                        height: 16,
                                                        child: Text(
                                                          '측정 필요',
                                                          style: TextStyle(
                                                            color: Color(0xFF333333),
                                                            fontSize: 12,
                                                            fontFamily: 'Pretendard',
                                                            height: 0.13,
                                                            letterSpacing: -0.30,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          );
                        },
                        eventsList: _eventList,
                        showEvents: true,
                        isExpanded: true,
                        locale: 'ko_KR',
                        onDateSelected: (DateTime date) {
                          _selectDate(date); // 선택만 갱신(창은 닫히지 않음)
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 상단 날짜 표시 + 캘린더 버튼(스타일 유지)
class DateCenterWithCalendar extends StatelessWidget {
  const DateCenterWithCalendar({
    super.key,
    required this.dateText,
    this.initialDate,
    this.onDatePicked,
    this.color = const Color(0xFF0B1E38),
  });

  final String dateText;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDatePicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 133),
        Text(
          dateText,
          style: const TextStyle(
            color: Color(0xFF0D1B34),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.2,
            letterSpacing: -0.40,
          ),
        ),
        SizedBox(width: 6.w),
        CalendarIconButton(
          initialDate: initialDate,
          onDatePicked: onDatePicked,
          color: color,
        ),
        const SizedBox(width: 76),
        SizedBox(
          width: 32,
          height: 32,
          child: ElevatedButton(
            onPressed: () {
              // 스타일 유지. 외부 함수 존재 시 모달 표시
              showBpInputModal(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF227EFF),
              shadowColor: Colors.black.withOpacity(0.15),
              elevation: 4,
            ),
            child: const Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

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
                      dateText: DateFormat('yyyy.MM.dd').format(DateTime.now()),
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